# System Architecture

This document describes the **system architecture** of the Verilog Digital Clock project with **Stopwatch** and **Alarm** functionalities.  
The design is modular and RTL-synthesizable, intended for behavioral simulation and logic synthesis.

---

## 📌 Project Overview
- **Objective:** Design a digital clock with integrated **Alarm** and **Stopwatch** functionalities.  
- **Time Format:**  
  - Seconds and minutes: 0–59  
  - Hours: 1–12  
- **AM/PM Handling:** Switches at 11:59:59. (AM 12 = midnight, PM 12 = noon)  

---

## 🏗️ Module Hierarchy

The system is composed of **four main modules**:

Top
├── clock_gen # Clock generator module
├── alarm_clk # Current time & alarm module
└── stop # Stopwatch module

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

---

### 3️⃣ stop (Stopwatch)
- **Role:** Millisecond-level stopwatch logic.  
- **Inputs:**  
  - Clock/control: `Clock_1MSec`, `Reset`  
  - Control signals: `Start_S` (1: start, 0: pause), `Stop_S` (1: stop), `Reset_S` (1: reset)  
- **Outputs:**  
  - `Hours_S`, `Mins_S`, `Secs_S`, `MSecs_S`  
- **Special Notes:**  
  - Once `Stop_S` is 1, the stopwatch halts completely.  
  - Restarting requires `Reset_S` to be 1; simply toggling `Start_S` will not resume.

---

### 4️⃣ Top (Top-Level Module)
- **Role:** Integrates `clock_gen`, `alarm_clk`, and `stop` modules, and determines final outputs.  
- **Inputs:**  
  - Main clock: `Clock_5K`, `Reset`  
  - User buttons / mode selection signals for time/alarm/stopwatch setting  
- **Outputs:**  
  - `Hours`, `Mins`, `Secs`, `MSecs`  
  - `AM_PM`, `Alarm`  
  - Stopwatch state: `SW_State`  

---

> This textual architecture provides a clear overview of module interactions and signal flow.  
