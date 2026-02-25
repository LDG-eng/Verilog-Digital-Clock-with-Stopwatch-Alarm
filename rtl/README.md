# RTL Module Overview

This directory contains all **Verilog RTL source files** for the Digital Clock project, including **Stopwatch** and **Alarm** functionalities.  
The design is modularized for maintainability, testability, and clear top-level integration.

---

## 📂 RTL Modules

| Module Name             | Description |
|-------------------------|-------------|
| Top_module.v          | Top-level integration module. Connects the clock generator, main clock/alarm, and stopwatch modules.|
| clock_gen.v           | Divides the 5KHz input clock to generate a 1Hz (1 Sec) clock for the main timekeeping and a 1KHz (1 MSec) clock for the stopwatch. |
| stopwatch.v           | Implements Stopwatch functionality with millisecond precision. Includes independent start, stop, and reset operations based on a state machine. |
| alarm_clk.v           | Core timekeeping and alarm module. Tracks current time (Hours, Mins, Secs) and compares it with the user-set alarm time to trigger an alert. |

> Notes: The design has been **RTL-synthesized**, and all modules have associated **module-level testbenches** in `tb/`.

### 🏗️ Module Hierarchy

- ⚙️ **`Top_module.v`** (Top-level Integration)
  - ⏱️ `clock_gen.v`
  - 🛑 `stopwatch.v`
  - 🔔 `alarm_clk.v`

---

## 🛠️ Usage Notes
- All sub-modules are instantiated in `Top_module.v` for seamless system operation and mode switching.
- Each module has a dedicated **testbench** for behavioral simulation using **ModelSim**.
- The RTL code adheres to the project specifications, covering standard digital design practices suitable for structural synthesis.

---

> Assets such as block diagrams and waveform screenshots are stored in `../assets/images/`.
