# ⏰ Verilog Digital Clock with Stopwatch and Alarm

## 📌 Project Overview
This repository contains the RTL design and verification of a multi-functional digital clock implemented in **Verilog HDL**.  
The design integrates a real-time clock, a precision stopwatch, and a programmable alarm system.  

The project demonstrates the **standard cell-based digital IC design flow**, from RTL coding and behavioral simulation to logic synthesis and gate-level verification.  
Stopwatch and Alarm functionalities are modularized and integrated at the top-level RTL design.  

## ✨ Key Features
* **🕰️ Timekeeping**: Hours, minutes, and seconds counter with 12-hour AM/PM format
* **⏱️ Stopwatch**: Independent start, stop, and reset functionality with millisecond precision
* **🔔 Alarm System**: Configurable alert triggered at a user-set time, maintaining the alarm state for 1 minute
* **🎛️ Mode Control**: Seamless switching between Clock, Alarm Set, and Stopwatch modes via control inputs

## 🛠️ Tools & Environment
* **HDL:** Verilog (RTL)  
* **Simulation:** ModelSim (Module-level & Top-level testbenches in `tb/`)
* **Synthesis Tool:** Xilinx Vivado

## 🛠️ Design Flow
1. **RTL Design:** Modular Verilog code developed for each functional block
2. **Simulation:** Verified functionality and timing using **ModelSim** with dedicated testbenches.
3. **Logic Synthesis:** Synthesized top-level RTL using **Vivado** to confirm gate-level mapping and hardware implementability.

## 🗂️ Repository Structure

📦 Verilog-Digital-Clock-with-Stopwatch-Alarm
- 📁 **rtl/**  
  Verilog RTL source files (.v)  
  *Modules:* `top.v`, `stopwatch.v`, `alarm.v`, `clock_gen.v`
- 📁 **tb/**  
  Module-level testbenches for behavioral simulation
- 📁 **docs/**  
  System architecture, experiment setup, and verification results
- 📁 **assets/**  
  Block diagrams, waveform images, and synthesis screenshots
- 📄 **README.md**  
  Project documentation and overview

## 📈 Synthesis Results
*(Exact tool report values not provided, summarized placeholders below)*

| Metric             | Result               |
|-------------------|--------------------|
| Target Frequency   | 5KHz (Main Clock)       |
| Total Area         | Nonexistent             |
| Setup/Hold Slack   | Met timing requirements |

> Screenshot of synthesis report: `assets/images/synthesis_report.png`  

## 🚀 Key Contributions
* **Modular RTL Design**: Top-level integration of core clock, stopwatch, and alarm modules.
* **Functional Verification**: Verified logical correctness using dedicated module-level testbenches.
* **Synthesis Confirmation**: Synthesized the top-level RTL to confirm suitability for FPGA implementation.
* **Documentation**: Clear documentation of architecture, simulation setup, and verification results.

## 🚀 How to Run Simulation
```bash
# Compile and run the testbench (ModelSim CLI example)
> vlib work
> vlog rtl/*.v tb/clk_tb.v
> vsim -c clk_tb -do "run -all; quit"
