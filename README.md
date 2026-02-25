# Verilog Digital Clock with Stopwatch and Alarm

"A multi-functional Digital Clock (Stopwatch &amp; Alarm) designed in Verilog HDL. Covers RTL implementation to Logic Synthesis."

This repository contains a Verilog-based digital clock project designed for RTL-level design and synthesis.  
The project implements **Stopwatch** and **Alarm** functionalities, verified through module-level testbenches and simulation.  

---

## Project Overview

The digital clock system is composed of modular RTL components, enabling clear separation of functionality and maintainable design.  
It includes:

- **Timekeeping**: Hours, minutes, and seconds counter
- **Stopwatch**: Independent start/stop/reset functionality
- **Alarm**: Configurable alert at set time
- **Display Controller**: Multiplexed 7-segment display output

The design has been verified through simulation, and RTL synthesis has been performed to ensure implementability.

---

## Key Contributions

- Modular RTL design with top-level integration of Stopwatch and Alarm  
- Functional verification using dedicated module-level testbenches  
- Synthesis performed to confirm RTL suitability for FPGA/ASIC flow  
- Clear documentation of architecture, simulation setup, and verification results

---

## Tools & Environment

- **HDL**: Verilog (RTL)
- **Simulation**: Module-level testbenches (`tb/` folder)  
- **Synthesis**: Top-level RTL synthesis performed (tool and version: 확실하지 않음)  
- **Display**: 7-segment, multiplexed output  

> Exact synthesis timing, area, and power metrics: 확실하지 않음

---

## Repository Structure





# ⏰ Verilog Digital Clock (Stopwatch & Alarm)

## 📌 Overview
This repository contains the RTL design and verification of a multi-functional Digital Clock implemented in **Verilog HDL**. The design integrates a real-time clock, a precision stopwatch, and a programmable alarm system. 

The primary objective of this project is to experience the complete standard cell-based digital IC design flow, from **RTL coding and behavioral simulation to logic synthesis and gate-level verification.**

## 🗂️ Directory Structure
*(주의: 이 부분은 실제 구조에 맞게 수정이 필요합니다)*
* `src/` : Verilog RTL source codes (`.v`)
* `tb/` : Testbench files for behavioral simulation
* `syn/` : Synthesis scripts, generated gate-level netlists, and timing/area reports
* `docs/` : Block diagrams, FSM charts, and simulation waveform images

## ✨ Key Features
1. **Digital Clock Mode:** Tracks Hours, Minutes, and Seconds accurately.
2. **Stopwatch Mode:** Features Start, Stop, and Reset operations.
3. **Alarm System:** Compares current time with the user-set alarm time and triggers an output signal.
4. **State Machine Control:** Seamlessly switches between modes (Clock, Alarm Set, Stopwatch) using button inputs.

## 🛠️ Design Flow & Verification
1. **RTL Design:** Developed modular Verilog code.
2. **Simulation:** Verified functionality using [ModelSim / Cadence Xcelium 등 사용하신 툴 이름].
3. **Logic Synthesis:** Synthesized the design using [Cadence Genus / Synopsys Design Compiler 등 사용하신 툴 이름] to check gate-level mapping and timing closure.

## 📈 Synthesis Results
*(여기에 합성 툴에서 얻은 리포트 결과를 요약해서 넣으면 매우 전문적으로 보입니다)*
* **Target Frequency:** [예: 50 MHz]
* **Total Area:** [예: 확인된 면적 수치]
* **Setup/Hold Slack:** Met timing requirements.

## 🚀 How to Run (Simulation)
```bash
# Example commands to compile and run the testbench
> icarus-verilog -o clock_tb tb/clock_tb.v src/*.v
> vvp clock_tb
> gtkwave dump.vcd
