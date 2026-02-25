# RTL Module Overview

This directory contains all **Verilog RTL source files** for the Digital Clock project, including **Stopwatch** and **Alarm** functionalities.  
The design is modularized for maintainability, testability, and clear top-level integration.

---

## 📂 RTL Modules

| Module Name             | Description |
|-------------------------|-------------|
| Top_module.v          | Top-level module. Integrates Clock, Stopwatch, Alarm, Display Controller, and Clock Divider. Manages reset and mode selection. |
| clock_gen.v           | Divides input clock to generate 1Hz and other required lower-frequency clocks for counters. |
| stopwatch.v           | Implements Stopwatch functionality: start, stop, and reset operations. Independent from main clock counters. |
| alarm_clk.v           | Compares current time with user-set alarm time and triggers an output signal when matched. |

> Notes: The design has been **RTL-synthesized**, and all modules have associated **module-level testbenches** in `tb/`.

### 🏗️ Module Hierarchy

- ⚙️ **`Top_module.v`** (Top-level Integration)
  - ⏱️ `clock_gen.v`
  - 🛑 `stopwatch.v`
  - 🔔 `alarm_clk.v`

---

## 🛠️ Usage Notes
- All modules are instantiated in `top.v` for system integration.  
- Each module has a dedicated **testbench** for behavioral simulation using **ModelSim**.  
- The RTL code follows **structural and behavioral Verilog best practices**, suitable for synthesis and further FPGA/ASIC implementation.

---

> Assets such as block diagrams and waveform screenshots are stored in `../assets/images/`.
