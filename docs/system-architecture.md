# System Architecture

This document describes the **system architecture** of the Verilog Digital Clock project with **Stopwatch** and **Alarm** functionalities.  
The design is modular and RTL-synthesizable, intended for behavioral simulation and logic synthesis.

---

## 📌 Project Overview
- **Objective:** Design a digital clock with integrated **Alarm** and **Stopwatch** functionalities.  
- **Time Format:**  
  - Seconds and minutes: 0–59  
  - Hours: 1–12  
- **AM/PM Handling:** Toggles at 12:00:00 (transition from 11:59:59).

---

## 🏗️ Module Hierarchy

The system consists of one top-level module and three functional submodules:

- ⚙️ **`Top_module.v`** (Top-level Integration)
  - ⏱️ `clock_gen.v`   # Clock generator module
  - 🛑 `stopwatch.v`   # Stopwatch module
  - 🔔 `alarm_clk.v`   # Current time & alarm module

## 🏗️ Block Diagram

![System Block Diagram](../assets/images/system_block_diagarm.png)

---

## ⚡ Module Specifications

### 1️⃣ clock_gen (Clock Generator)
- **Role:** Generate sub-clocks from 5KHz input for seconds and milliseconds counting.  
- **Inputs:**  
  - `Clock_5K` (5 KHz main clock)  
  - `Reset`  
- **Outputs:**  
  - `Clock_1Sec` (1-second clock)  
  - `Clock_1MSec` (1-millisecond clock)

---

### 2️⃣ alarm_clk (Current Time & Alarm)
- **Role:** Handle timekeeping, alarm setting, and alarm trigger logic.  
- **Inputs:**  
  - Clock & control: `Clock_1Sec`, `Reset`  
  - Mode control: `LoadTime` (1: time set), `LoadAlm` (1: alarm set), `AlarmEnable` (1: alarm ON)  
  - Time/alarm values: `SetSecs`, `SetMins`, `AlarmMinsIn`, `SetHours`, `AlarmHoursIn`, `Set_AM_PM`, `Alarm_AM_PM_In`  
- **Outputs:**  
  - `AM_PM` (1: AM, 0: PM)  
  - `Alarm` (alarm flag)  
  - `Secs_C`, `Mins_C`, `Hours_C`  
- **Special Notes:**  
  - When current time matches alarm time, alarm triggers for **1 minute** (from 0 to 59 seconds of that minute)
  - The module separates timekeeping, setting, and alarm logic into independent always blocks.
  - This separation was intentionally designed to avoid synthesis conflicts and improve timing reliability.

---

### 3️⃣ stop (Stopwatch)
- **Role:** Millisecond-level stopwatch logic.  
- **Inputs:**  
  - Clock/control: `Clock_1MSec`, `Reset`, `Control` (1: disable, 0: enable)
  - Control signals: `Start_S` (1: start, 0: pause), `Stop_S` (1: stop), `Reset_S` (1: reset)  
- **Outputs:**  
  - `Hours_S`, `Mins_S`, `Secs_S`, `MSecs_S`  
- **Special Notes:**  
  - Once `Stop_S` is 1, the stopwatch halts completely.
  - The module includes a state-protection mechanism: once `Stop_S` is asserted, the stopwatch cannot restart until `Reset_S` is applied.

---

### 4️⃣ Top_module (Top-Level Module)
- **Role:** Integrates `clock_gen`, `alarm_clk`, and `stop` modules, and determines final outputs.  
- **Inputs:**  
  - Main clock: `Clock_5K`, `Reset`  
  - Mode selection signals (`Control`, `LoadTime`, `LoadAlm`, etc.) for time/alarm/stopwatch setting
- **Outputs:**  
  - `Hours`, `Mins`, `Secs`, `MSecs`  
  - `AM_PM`, `Alarm`  
  - Stopwatch state: `SW_State`
- **Special Notes:**
  - `SW_State` is asserted for one `Clock_5K` cycle when `Control` changes.
    
---

> This textual architecture provides a clear overview of module interactions and signal flow.  
