# 🧪 Verification Overview (Testbench)

This directory contains **ModelSim-based testbenches** for verifying the functional correctness of each RTL module. The verification process focuses on ensuring that timekeeping, alarm triggers, and stopwatch state transitions operate exactly as specified in the project requirements.

---

## 📂 Testbench Files

| File Name          | Targeted Module   | Verification Focus |
|--------------------|-------------------|--------------------|
| `clock_generator_tb.v` | `clock_gen.v`     | Accuracy of 1Hz (1 Sec) and 1KHz (1 MSec) clock division from the 5KHz input clock. |
| `alarm_clk_tb.v`   | `alarm_clk.v`     | Time increment logic, 12-hour AM/PM transitions, and 1-minute alarm duration trigger. |
| `stopwatch_tb.v`   | `stopwatch.v`     | Stopwatch control logic (Start, Pause, Stop, Reset) and millisecond counter behavior. |
| `Top_module_tb.v`  | `Top_module.v`    | System-level integration, mode switching (Clock vs. Stopwatch), and overall stability. |

---

## 🔍 Verification Strategy

### 1. Behavioral Simulation
All modules underwent behavioral simulation using **ModelSim** to confirm logical accuracy before synthesis. Key verifications include:
* **Timekeeping:** Seconds and minutes accurately reset at 59, and hours transition from 12 to 1 correctly.
* **Stopwatch Logic:** The system correctly maintains or resets its state based on the strict priority of `Stop_S` and `Reset_S` signals.
* **Mode Control:** Verified correct mode switching behavior when the `Control` signal changes.

### 2. Waveform Analysis
Simulation waveforms were analyzed to verify correct signal transitions and logical behavior.

*(Example: Stopwatch & Clock Generator Verification Waveforms)*
![Stopwatch Simulation Waveform](../assets/stopwatch_waveform.png)
![Clock Generator Simulation Waveform](../assets/clock_gen_waveform.png)

---

## 🚀 How to Run Verification

The testbenches are designed to be compatible with **ModelSim**. Follow the steps below to execute the simulation via the command line:

```bash
# 1. Create the work library
> vlib work

# 2. Compile RTL and Testbench files
> vlog ../rtl/*.v *.v

# 3. Run simulation (Example: Top-level verification)
> vsim -c Top_module_tb -do "run -all; quit"
```

---

> 💡 **Note:** Captured waveform images are available in the `../assets/` directory.
