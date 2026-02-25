# 🧪 Verification Overview (Testbench)

This directory contains **ModelSim-based testbenches** for verifying the functional correctness of each RTL module. The verification process focuses on ensuring that timekeeping, alarm triggers, and stopwatch state transitions operate exactly as specified in the project requirements.

---

## 📂 Testbench Files

| File Name          | Targeted Module   | Verification Focus |
|--------------------|-------------------|--------------------|
| `clk_tb.v`         | `clock_gen.v`     | Accuracy of 1Hz (1 Sec) and 1KHz (1 MSec) clock division from the 5KHz input clock. |
| `alarm_clk_tb.v`   | `alarm_clk.v`     | Time increment logic, 12-hour AM/PM transitions, and 1-minute alarm duration trigger. |
| `stopwatch_tb.v`   | `stopwatch.v`     | State machine transitions (Start, Pause, Reset) and MSec counter logic. |
| `top_tb.v`         | `Top_module.v`    | System-level integration, mode switching (Clock vs. Stopwatch), and overall stability. |

---

## 🔍 Verification Strategy

### 1. Behavioral Simulation
All modules underwent behavioral simulation using **ModelSim** to confirm logical accuracy before synthesis. Key verifications include:
* **Timekeeping:** Seconds and minutes accurately reset at 59, and hours transition from 12 to 1 correctly.
* **Stopwatch Logic:** The system correctly maintains or resets its state based on the strict priority of `Stop_S` and `Reset_S` signals.
* **Mode Control:** Confirmed seamless transitions without signal glitches when switching display modes.

### 2. Waveform Analysis
Simulation results were analyzed via waveform viewers to ensure timing constraints and signal transitions (such as `SW_State` or `Alarm` flags) met the design specifications.

*(If you have a waveform screenshot, uncomment the line below to display it)*
---

## 🚀 How to Run Verification

The testbenches are designed to be compatible with **ModelSim**. Follow the steps below to execute the simulation via the command line:

```bash
# 1. Create the work library
> vlib work

# 2. Compile RTL and Testbench files
> vlog ../rtl/*.v *.v

# 3. Run simulation (Example: Top-level verification)
> vsim -c top_tb -do "run -all; quit"
```

Note: Captured waveform images (.png or .jpg) showing successful functional verification and state transitions are located in the ../assets/ directory.
