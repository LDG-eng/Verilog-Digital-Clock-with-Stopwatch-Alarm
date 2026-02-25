# ⏰ Verilog Digital Clock  
### RTL-Based Digital Design with Stopwatch & Alarm

---

## 📌 Project Overview

This project implements a modular digital clock system in Verilog HDL, integrating:

- 12-hour timekeeping with AM/PM
- Millisecond-resolution stopwatch
- Configurable 1-minute alarm trigger
- Deterministic control logic with state protection

The design was functionally verified using ModelSim and synthesized using Xilinx Vivado targeting the ZCU104 board.

---

## 🏗 System Architecture

![System Block Diagram](assets/images/system_block_diagram.png)

👉 [View Detailed Architecture](architecture.md)

---

## 🧪 Functional Verification

- Module-level simulation
- Top-level integration verification
- SW_State pulse validation
- Alarm 1-minute duration confirmation

👉 [View Verification Details](verification.md)

---

## 📈 Synthesis Summary

| Resource | Utilization |
|----------|------------|
| LUT      | 1% |
| FF       | 1% |
| IO       | 18% |
| BUFG     | 1% |

![Synthesis Schematic](assets/images/synthesis_schematic.png)

👉 [View Synthesis Details](synthesis.md)

---

## 🔎 Design Highlights

- Modular RTL hierarchy
- Separate always blocks for deterministic concurrency
- Stop-state protection logic
- Minimal FPGA resource usage

---

© 2026 Dong-Geun Lee
