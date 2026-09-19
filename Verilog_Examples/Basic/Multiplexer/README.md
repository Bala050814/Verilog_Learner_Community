# 8:1 Multiplexer

## Description

An 8:1 multiplexer selects one of eight 1-bit inputs and routes the selected input to the output.

The selection is controlled by a 3-bit select signal.

## Module Interface

| Signal | Width | Direction | Description             |
| ------ | ----: | --------- | ----------------------- |
| `a`    |     8 | Input     | Eight 1-bit data inputs |
| `sel`  |     3 | Input     | Select signal           |
| `out`  |     1 | Output    | Selected data output    |

## Selection Table

| `sel` | Output |
| ----- | ------ |
| `000` | `a[0]` |
| `001` | `a[1]` |
| `010` | `a[2]` |
| `011` | `a[3]` |
| `100` | `a[4]` |
| `101` | `a[5]` |
| `110` | `a[6]` |
| `111` | `a[7]` |

## Implementation

The multiplexer is implemented in Verilog using a combinational `always @(*)` block and a `case` statement.

## Verification

The testbench verifies all eight select combinations using multiple input patterns:

* `01010101`
* `10101010`
* `11111111`
* `00000000`

The testbench performs automatic PASS/FAIL checking by comparing the MUX output with the selected input bit.

A VCD waveform is also generated for waveform inspection.

## Simulation

Using Icarus Verilog:

```bash
iverilog -o mux_sim mux821.v mux81_tb.v
vvp mux_sim
```

To view the waveform:

```bash
gtkwave mux8to1_TB.vcd
```

## Files

* `mux821.v` — 8:1 multiplexer RTL
* `mux81_tb.v` — Verilog testbench
* `README.md` — Module documentation

