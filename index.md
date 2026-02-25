---
title: "RTL Verilog Digital Clock with Stopwatch & Alarm"
---

# ⏰ Verilog Digital Clock  
### RTL Digital Design with Stopwatch & Alarm

---

## 📌 Project Summary

This project is a fully modular **digital clock system implemented in Verilog HDL**, incorporating:

- Timekeeping with **12-hour AM/PM format**
- **Stopwatch** with millisecond precision and state protection
- Configurable **Alarm** that asserts for exactly one minute
- Deterministic control logic and top-level mode switching

The design undergoes behavioral verification in **ModelSim** and logic synthesis using **Xilinx Vivado** targeting the **ZCU104 Evaluation Board**.

---

## 🧠 Design Motivation & Goals

Modern embedded systems require precise timing, reliable mode control, and robust state handling.  
This project aims to demonstrate a **realistic RTL design flow** (not just toy functionality):

- Clear modular RTL architecture  
- Testbench driven verification strategy  
- Deterministic logic behavior under control sequences  
- FPGA synthesis with resource efficiency  

The design has been developed to reflect **practical engineering considerations** with no artificial simplification.

---

## 🏗 Architecture at a Glance

**System Components:**

- `Top_module.v`: Integrates all functional blocks  
- `clock_gen.v`: Generates 1 second & 1 millisecond clocks  
- `alarm_clk.v`: Handles timekeeping, alarm setting & triggering  
- `stopwatch.v`: Stopwatch with start/stop/reset logic

---

## 🔹 Block Diagram

A high-level overview of module interconnection:

![System Block Diagram](assets/images/system_block_diagram.png)

---

## 🛠 Tools & Environment

| Category | Tool |
|----------|------|
| HDL | Verilog (RTL) |
| Simulation | ModelSim |
| Synthesis | Xilinx Vivado |
| Target Board | ZCU104 Evaluation Board |

Key activities:
- Module-level verification
- Top-level simulation
- Logic synthesis & schematic inspection

---

## 🧪 Functional Verification

### 📌 Testbench Strategy

Simulation is structured in two phases:

1️⃣ **Module-Level Testbenches**  
- Verify isolated behavior of submodules  
- Clock generator accuracy
- Stopwatch control and counter behavior
- Alarm & timekeeping logic

2️⃣ **Top-Level Integration Testbench**  
- Mode switching behavior  
- Interaction between stopwatch and clock/alarm
- Assertion of status signals like `SW_State`

Simulation waveforms confirm state transitions and timing behavior.

---

## 🔍 Top-Level Integration (Control + SW_State)

Below waveform demonstrates integrated operation:

![Top-Level Integration Waveform](assets/waveforms/top_integration_waveform.png)

---

## 📈 Synthesis Results

### ✔ FPGA Resource Utilization

| Resource | Utilization |
|----------|------------|
| LUT      | 1% |
| FF       | 1% |
| IO       | 18% |
| BUFG     | 1% |

The design occupies minimal FPGA resources and shows **modest logic complexity**.

---

## 🔍 Post-Synthesis Hierarchy

The gate-level schematic confirms structural consistency with RTL.

![Post-Synthesis Schematic](assets/images/synthesis_schematic.png)

---

## ⏱ Verified Behavior Summary

✔ **Stopwatch**
- Millisecond accuracy
- Start, pause, stop, reset behavior
- State protection preventing unintended resume

✔ **Alarm & Clock**
- Alarm triggers exactly for 60 seconds
- `AM_PM` toggles at 12:00:00
- Timekeeping independent of other states

✔ **Mode Switching**
- `Control` bit smoothly toggles modes
- `SW_State` pulse on mode change

---

## 🧾 Design Highlights

- Modular architecture with clear separation between functional units
- Independent always blocks ensure deterministic concurrent operation
- Control priority ensures correct reset behavior
- Simulation waveforms and synthesis results corroborate correctness

---

## 🗂 Repository Overview
📦 Verilog-Digital-Clock-with-Stopwatch-Alarm
┣ 📁 rtl/
┣ 📁 tb/
┣ 📁 docs/
┣ 📁 assets/
┣ ✨ GitHub Pages
┗ 📄 README.md

---

## 📌 Next Steps (Optional Extensions)

- Add hardware implementation on FPGA board with display interface  
- Add real push-button / debouncing logic  
- Integrate UART/SPI display driver for console visualization

---

© 2026 Dong-Geun Lee  
RTL Digital Design Portfolio
