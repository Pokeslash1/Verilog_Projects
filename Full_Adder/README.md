# 1-Bit Full Adder with Testbench

A hardware description and verification setup for a standard 1-bit Full Adder using **Verilog HDL**. This project includes both the synthesizable design module and a stimulus testbench for functional simulation.

## 📁 Repository Structure

*   `Full_Adder.v` — The core RTL design module implementing the full adder logic.
*   `Full_Adder_Testbench.v` — The testbench file providing input stimuli and monitoring outputs.

---

## 🛠️ Simulation Requirements

To run these files locally, you need the following open-source EDA tools installed on your system:
1.  **Icarus Verilog (`iverilog`)** — The compiler used to compile the Verilog source code.
2.  **VVP (`vvp`)** — The runtime engine used to execute the compiled simulation file.
3.  *Optional:* **GTKWave** — A waveform viewer to visually inspect the signals.

---

## 🚀 Execution Guide

Follow these steps in your terminal or command prompt to compile and execute the simulation.

### Step 1: Compile the Source Files
Use `iverilog` to compile both the design file and the testbench into a single simulation object. The `-o` flag specifies the output executable name.

```bash
iverilog -o adder_sim Full_Adder.v Full_Adder_Testbench.v
```

### Step 2: Run the Simulation
Execute the compiled simulation object using the `vvp` runtime tool:

```bash
vvp adder_sim
```
*This will print the text-based simulation outputs (like `$display` or `$monitor` logs) directly to your terminal.*

---

## 📊 Visualising Waveforms (Optional)

`Full_Adder_Testbench.v` includes system tasks to dump waveform data (such as `$dumpfile("waveform.vcd");` and `$dumpvars(0, Full_Adder_Testbench);`), you can view the timing diagrams visually using **GTKWave**:

```bash
gtkwave waveform.vcd
```
