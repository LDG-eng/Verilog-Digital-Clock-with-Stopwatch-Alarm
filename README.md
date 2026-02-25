# ⏰ Verilog Digital Clock with Stopwatch and Alarm

## 📌 Project Overview
This repository contains the RTL design and verification of a multi-functional digital clock implemented in **Verilog HDL**.  
The design integrates a real-time clock, a precision stopwatch, and a programmable alarm system.  

The project demonstrates the **standard cell-based digital IC design flow**, from RTL coding and behavioral simulation to logic synthesis and gate-level verification.  
Stopwatch and Alarm functionalities are modularized and integrated at the top-level RTL design.  

## ✨ Key Features
* **🕰️ Timekeeping**: Hours, minutes, and seconds counter.
* **⏱️ Stopwatch**: Independent start, stop, and reset functionality.
* **🔔 Alarm System**: Configurable alert triggered at a user-set time.
* **🎛️ Mode Control**: Seamless switching between Clock, Alarm Set, and Stopwatch modes via button inputs.

## 🛠️ Tools & Environment
* **HDL:** Verilog (RTL)  
* **Simulation:** Module-level testbenches (`tb/`)  
* **Synthesis Tool:** `[확실하지 않음]`  

## 🛠️ Design Flow
1. **RTL Design:** Modular Verilog code developed for each functional block (Clock, Stopwatch, Alarm, Display Controller, Clock Divider).  
2. **Simulation:** Verified using module-level testbenches in `[simulation tool: 확실하지 않음]`.  
3. **Logic Synthesis:** Synthesized top-level RTL with `[synthesis tool: 확실하지 않음]` to confirm gate-level mapping and timing

## 🗂️ Repository Structure
📦 Verilog-Digital-Clock-with-Stopwatch-Alarm
> Notes:  
> - `rtl/` contains all functional modules (`top.v`, `counter.v`, `stopwatch.v`, `alarm.v`, `display_controller.v`, `clock_divider.v`)  
> - `tb/` contains module-level testbenches for verification  
> - `docs/` contains architecture, experiment setup, and results  
> - `assets/` contains block diagrams, waveform images, and synthesis screenshots


| Folder      | Description |
|------------|------------|
| firmware/  | RTL Verilog source files (`top.v`, `counter.v`, `stopwatch.v`, `alarm.v`, `display_controller.v`, `clock_divider.v`) |
| tb/        | Module-level testbenches for behavioral simulation |
| docs/      | System architecture, experiment setup, and verification results |
| assets/    | Block diagrams, waveform images, and synthesis screenshots |
| README.md  | Top-level project introduction |
| LICENSE    | License information |



> Notes:  
> - `rtl/` contains all functional modules (`top.v`, `counter.v`, `stopwatch.v`, `alarm.v`, `display_controller.v`, `clock_divider.v`)  
> - `tb/` contains module-level testbenches for verification  
> - `docs/` contains architecture, experiment setup, and results  
> - `assets/` contains block diagrams, waveform images, and synthesis screenshots



## 📈 Synthesis Results
*(Exact tool report values not provided, summarized placeholders below)*

| Metric             | Result               |
|-------------------|--------------------|
| Target Frequency   | 확실하지 않음       |
| Total Area         | 확실하지 않음       |
| Setup/Hold Slack   | Met timing requirements |

> Screenshot of synthesis report: `assets/images/synthesis_report.png`  

## 🚀 Key Contributions
* **Modular RTL Design**: Top-level integration of core clock, stopwatch, and alarm modules.
* **Functional Verification**: Verified logical correctness using dedicated module-level testbenches.
* **Synthesis Confirmation**: Synthesized the top-level RTL to confirm suitability for standard FPGA/ASIC design flows.
* **Documentation**: Clear documentation of architecture, simulation setup, and verification results.

## 🚀 How to Run Simulation
# Compile and run the top-level testbench using Icarus Verilog
iverilog -o clock_tb tb/top_tb.v firmware/*.v
vvp clock_tb
gtkwave dump.vcd
