# ⏰ Verilog Digital Clock  
### RTL-Based Digital Design with Stopwatch & Alarm

---

## 📌 Project Overview

This project implements a modular digital clock system in **Verilog HDL**, integrating:

- 12-hour timekeeping with AM/PM
- Millisecond-resolution stopwatch
- Configurable 1-minute alarm trigger
- Deterministic control logic with stop-state protection

The design was functionally verified using **ModelSim** and synthesized using **Xilinx Vivado** targeting the **ZCU104 Evaluation Board**.

---

## 🏗 System Architecture

The system consists of four RTL modules:

- `Top_module`
- `clock_gen`
- `alarm_clk`
- `stopwatch`

![System Block Diagram](assets/images/system_block_diagram.png)

👉 **[View Detailed Architecture](architecture.md)**

---

## 🧪 Functional Verification

Verification was performed at both module and top levels using ModelSim.

### ✔ Verified Scenarios

- Correct 12-hour timekeeping and AM/PM transition
- 1-minute alarm assertion when time matches configuration
- Stopwatch start, pause, stop, and reset behavior
- Deterministic recovery using `Reset_S` priority
- One-cycle `SW_State` assertion on mode change

![Top-Level Integration Waveform](assets/waveforms/top_integration_waveform.png)

👉 **[View Full Verification Details](verification.md)**

---

## 📈 Synthesis Results

Synthesis was completed using Vivado.

### ✔ Resource Utilization

| Resource | Utilization |
|----------|------------|
| LUT      | 1% |
| FF       | 1% |
| IO       | 18% |
| BUFG     | 1% |

Low LUT and FF utilization indicate limited logic resource usage.

### ✔ Post-Synthesis Schematic

![Post-Synthesis Schematic](assets/images/synthesis_schematic.png)

👉 **[View Synthesis Details](synthesis.md)**

---

## 🔎 Design Highlights

- Modular RTL hierarchy
- Separate always blocks for deterministic concurrent operation
- Stop-state protection logic preventing unintended restart
- Clean synthesis with minimal FPGA resource usage
- Clear separation of verification and synthesis documentation

---

## 📂 Repository Structure
- rtl/ → Verilog RTL source files
- tb/ → ModelSim testbenches
- docs/ → GitHub Pages documentation
- assets/ → Block diagrams & waveform images

---

## 📌 Tools & Environment

- **HDL:** Verilog (RTL)
- **Simulation:** ModelSim
- **Synthesis:** Xilinx Vivado
- **Target Board:** ZCU104 Evaluation Board

---

© 2026 Dong-Geun Lee  
RTL Digital Design Portfolio
