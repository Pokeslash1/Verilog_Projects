# 2:1 Multiplexer with Active-Low Enable (Verilog)

A 2-to-1 multiplexer written in Verilog using dataflow modeling, with an active-low enable input and an exhaustive testbench that checks all 16 input combinations.

## Overview

The multiplexer selects one of two data inputs (`D0` or `D1`) based on a select line `S`. An enable input `E` gates the whole circuit: when `E` is low the mux works normally, and when `E` is high the output is forced to `0`.

### Boolean expression

```
Y = (~E & S & D1) | (~E & ~S & D0)
```

## Ports

| Port | Direction | Width | Description                                  |
|------|-----------|-------|----------------------------------------------|
| `E`  | input     | 1     | Enable, **active low** (`0` = enabled)       |
| `S`  | input     | 1     | Select line (`0` selects `D0`, `1` selects `D1`) |
| `D0` | input     | 1     | Data input 0                                 |
| `D1` | input     | 1     | Data input 1                                 |
| `Y`  | output    | 1     | Multiplexer output                           |

## Function Table

| E | S | Y            |
|---|---|--------------|
| 0 | 0 | `D0`         |
| 0 | 1 | `D1`         |
| 1 | X | `0` (disabled) |

### Full truth table

| E | S | D1 | D0 | Y |
|---|---|----|----|---|
| 0 | 0 | 0  | 0  | 0 |
| 0 | 0 | 0  | 1  | 1 |
| 0 | 0 | 1  | 0  | 0 |
| 0 | 0 | 1  | 1  | 1 |
| 0 | 1 | 0  | 0  | 0 |
| 0 | 1 | 0  | 1  | 0 |
| 0 | 1 | 1  | 0  | 1 |
| 0 | 1 | 1  | 1  | 1 |
| 1 | X | X  | X  | 0 |

## Project Structure

```
.
├── MUX.v            # Design: 2:1 mux with active-low enable
├── MUX_Testbench.v  # Testbench: exhaustive test of all 16 input combinations
└── README.md
```

## Design

```verilog
module MUX(
    input E, S, D1, D0,
    output Y
);
    assign Y = (~E)&S&D1 | (~E)&(~S)&D0;
endmodule
```

## Testbench

`MUX_Testbench.v` (module `testbench`) instantiates the mux as `uut` and drives every combination of `E`, `S`, `D0` and `D1` (2⁴ = 16 vectors), holding each for 10 ns. A `$monitor` statement prints the inputs and output whenever any of them changes, and the simulation ends with `$finish`.

- Timescale: `1ns/1ps`
- Total simulation time: 160 ns

## Running the Simulation

### Icarus Verilog

```bash
iverilog -o mux_sim MUX.v MUX_Testbench.v
vvp mux_sim
```

### ModelSim / QuestaSim

```bash
vlog MUX.v MUX_Testbench.v
vsim -c testbench -do "run -all; quit"
```

### Vivado

1. Create a new project and add `MUX.v` as a design source.
2. Add `MUX_Testbench.v` as a simulation source.
3. Set `testbench` as the top simulation module and run Behavioral Simulation.

### Viewing waveforms (optional)

The testbench does not dump a waveform file by default. To view waveforms in GTKWave, add these lines at the start of the `initial` block:

```verilog
$dumpfile("mux.vcd");
$dumpvars(0, testbench);
```

Then run:

```bash
gtkwave mux.vcd
```

## Expected Console Output

Output follows this format, one line per input change:

```
Time = 0|E = 0|S = 0|D0 = 0|D1 = 0|Y = 0
Time = 10|E = 0|S = 0|D0 = 0|D1 = 1|Y = 0
Time = 20|E = 0|S = 0|D0 = 1|D1 = 0|Y = 1
...
```

When `E = 1`, `Y` stays `0` regardless of the other inputs.

## Tools

Works with any standard Verilog simulator, such as Icarus Verilog, ModelSim/QuestaSim, Vivado Simulator, or Verilator (with a wrapper).

## License

Add a license of your choice (e.g. MIT) and include a `LICENSE` file in the repository.
