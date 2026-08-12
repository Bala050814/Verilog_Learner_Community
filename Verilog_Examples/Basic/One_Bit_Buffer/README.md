# One-Bit Buffer

## 1. Introduction

A **one-bit buffer** is a digital circuit that passes a single binary input signal to its output without changing its logical value.

For a one-bit buffer:

```text
out = in
```

Therefore:

* If `in = 0`, then `out = 0`
* If `in = 1`, then `out = 1`

The One-Bit Buffer in this example is implemented using a wire and two NOT operations. Since two inversions cancel each other, the final output has the same logical value as the input.

---

## 2. Concept of a Buffer

A digital buffer transfers a signal from its input to its output while preserving the logic value.

The truth table is:

| Input (`in`) | Output (`out`) |
| ------------ | -------------- |
| 0            | 0              |
| 1            | 1              |

The Boolean expression for the buffer is:

```text
out = in
```

In this implementation, the same result is obtained using two NOT operations:

```text
out = ~(~in)
```

According to Boolean algebra:

```text
~(~A) = A
```

Therefore:

```text
out = ~(~in)
    = in
```

---

## 3. Real-World Analogy

A simple analogy for a buffer is a **pipe carrying water from one location to another**.

```text
Water In ──────────────────► Water Out
```

The pipe transfers the water without changing it into something different.

Similarly, a digital buffer transfers the input signal to the output:

```text
Input Signal ───────────────► Output Signal
```

If the input is logic `0`, the output is logic `0`.

If the input is logic `1`, the output is logic `1`.

---

## 4. Block Diagram

The One-Bit Buffer can be represented as:

```text
              ONE-BIT BUFFER

        ┌─────────────────────┐
        │                     │
in ────►│       BUFFER        │────► out
        │                     │
        └─────────────────────┘
```

The circuit has:

* One input: `in`
* One output: `out`

---

## 5. Logic Diagram of This Implementation

The actual Verilog implementation uses two NOT operations.

```text
                 sub_wire
                    │
                    ▼
in ───────────────► ● ───► NOT ───► NOT ─────────► out
                    │
                    └──────────────────────────────
```

A clearer representation is:

```text
in
 │
 ▼
┌──────────┐
│ sub_wire │
└────┬─────┘
     │
     ▼
   ┌────┐
   │ NOT│
   └─┬──┘
     │
     ▼
   ┌────┐
   │ NOT│
   └─┬──┘
     │
     ▼
    out
```

The two NOT gates cancel each other:

```text
in → NOT → NOT → out

out = ~(~in)
```

Therefore:

```text
out = in
```

---

# 6. Verilog Design

The Verilog design is:

```verilog
module one_bit_buffer(input wire in, output wire out);

wire sub_wire;

assign sub_wire = in;

assign out = ~(~sub_wire);

endmodule
```

---

## 7. Verilog Code Explanation

### Module Declaration

```verilog
module one_bit_buffer(input wire in, output wire out);
```

This declares a module named `one_bit_buffer`.

The module has:

* `in` — one-bit input
* `out` — one-bit output

The keyword `wire` indicates that these signals represent connections carrying values between parts of the circuit.

---

### Internal Wire

```verilog
wire sub_wire;
```

`sub_wire` is an internal one-bit wire used to connect the input to the next part of the circuit.

It acts as an intermediate signal between `in` and `out`.

---

### Connecting the Input

```verilog
assign sub_wire = in;
```

This continuously assigns the value of `in` to `sub_wire`.

Therefore:

```text
in = 0 → sub_wire = 0

in = 1 → sub_wire = 1
```

The internal wire always follows the input.

---

### Double NOT Operation

```verilog
assign out = ~(~sub_wire);
```

This is the main logic of the buffer.

The inner `~` performs a NOT operation:

```text
~sub_wire
```

The outer `~` performs another NOT operation:

```text
~(~sub_wire)
```

Two NOT operations cancel each other:

```text
~(~A) = A
```

Therefore:

```text
out = ~(~sub_wire)
    = sub_wire
    = in
```

So the final output is the same as the input.

---

### End of Module

```verilog
endmodule
```

This indicates the end of the `one_bit_buffer` module.

---

# 8. Boolean Operation

The complete signal flow can be represented mathematically as:

```text
sub_wire = in

out = ~(~sub_wire)

Therefore:

out = ~(~in)

Using double negation:

out = in
```

Hence, the circuit behaves as a one-bit buffer.

---

# 9. Testbench

The testbench file is named:

```text
One_Bit_Buffer_TB.v
```

The testbench is used to verify whether the `one_bit_buffer` module produces the expected output.

The testbench contains:

```verilog
`timescale 1ns/1ps

module one_bit_buffer_tb;

wire out;
reg in;

one_bit_buffer u1(.in(in),.out(out));

initial begin

$dumpfile("one_bit_buffer_tb.vcd");
$dumpvars(0,one_bit_buffer_tb);

$monitor("time=%0t in=%b out=%b",$time,in,out);

in=0;
#10;
in=0;
#10;
in=1;
#10;
in=0;
#10;
in=0;
#10;
in=1;
#10;
in=0;
#10;
in=0;
#10;
in=1;
#10;
in=0;
#10;
in=0;
#10;
in=1;
#10;
in=0;
#10;
in=0;
#10;
in=1;
#10;
in=0;
#10;
in=0;
#10;
in=1;
#10;

$finish;

end

endmodule
```

---

# 10. Testbench Code Explanation

## Timescale

```verilog
`timescale 1ns/1ps
```

This specifies the simulation time unit and precision.

* `1ns` is the simulation time unit.
* `1ps` is the simulation precision.

Therefore, delays such as:

```verilog
#10
```

represent 10 ns.

---

## Testbench Module

```verilog
module one_bit_buffer_tb;
```

This creates the testbench module.

The `_tb` suffix indicates that this is a **testbench**.

The testbench is not the actual circuit. It provides input signals and observes the output of the circuit being tested.

---

## Input Register

```verilog
reg in;
```

The testbench uses `in` as a `reg` because the testbench needs to assign different values to it during simulation.

For example:

```verilog
in = 0;
```

and:

```verilog
in = 1;
```

---

## Output Wire

```verilog
wire out;
```

The output from the One-Bit Buffer is connected to the `out` wire.

The testbench observes this signal but does not directly assign a value to it.

---

# 11. Instantiating the Design Under Test

```verilog
one_bit_buffer u1(.in(in),.out(out));
```

This creates an instance of the `one_bit_buffer` module.

The instance name is:

```text
u1
```

The connections are:

```text
Testbench                 One-Bit Buffer

   in  ──────────────────► in
                            │
                            │
   out ◄────────────────── out
```

Thus, the testbench provides the input and observes the output.

---

# 12. Generating a VCD Waveform

The testbench contains:

```verilog
$dumpfile("one_bit_buffer_tb.vcd");
```

This creates a VCD file named:

```text
one_bit_buffer_tb.vcd
```

VCD stands for **Value Change Dump**.

It stores signal changes during simulation and can be used to view waveforms.

---

## Dumping Signals

```verilog
$dumpvars(0,one_bit_buffer_tb);
```

This tells the simulator to record the signals in the testbench for waveform generation.

The resulting VCD file can be opened in a waveform viewer such as GTKWave.

---

# 13. Monitoring the Signals

The testbench uses:

```verilog
$monitor("time=%0t in=%b out=%b",$time,in,out);
```

`$monitor` displays the values whenever one of the monitored signals changes.

It displays:

* Simulation time
* Input `in`
* Output `out`

For example:

```text
time=0   in=0 out=0
time=20  in=1 out=1
```

The exact displayed formatting depends on the simulator.

---

# 14. Applying Test Inputs

The testbench repeatedly applies values to `in`.

The input sequence is:

```text
0 → 0 → 1 → 0 → 0 → 1 → 0 → 0 → 1
→ 0 → 0 → 1 → 0 → 0 → 1 → 0 → 0 → 1
```

Each value is held for 10 ns before the next value is applied.

The sequence follows the repeating pattern:

```text
0 → 0 → 1
```

---

# 15. Expected Input and Output

Because the circuit is a buffer:

```text
out = in
```

the expected behavior is:

| Time (ns) | Input (`in`) | Expected Output (`out`) |
| --------: | -----------: | ----------------------: |
|         0 |            0 |                       0 |
|        10 |            0 |                       0 |
|        20 |            1 |                       1 |
|        30 |            0 |                       0 |
|        40 |            0 |                       0 |
|        50 |            1 |                       1 |
|        60 |            0 |                       0 |
|        70 |            0 |                       0 |
|        80 |            1 |                       1 |
|        90 |            0 |                       0 |
|       100 |            0 |                       0 |
|       110 |            1 |                       1 |
|       120 |            0 |                       0 |
|       130 |            0 |                       0 |
|       140 |            1 |                       1 |
|       150 |            0 |                       0 |
|       160 |            0 |                       0 |
|       170 |            1 |                       1 |

After the final 10 ns delay, `$finish` terminates the simulation at approximately 180 ns.

---

# 16. Expected Waveform

The input and output waveforms should have the same logical pattern:

```text
in:

1           ┌────┐        ┌────┐        ┌────┐
            │    │        │    │        │    │
0 ──────────┘    └────────┘    └────────┘    └────
     0   10  20  30  40  50  60  70  80  90 ... ns


out:

1           ┌────┐        ┌────┐        ┌────┐
            │    │        │    │        │    │
0 ──────────┘    └────────┘    └────────┘    └────
     0   10  20  30  40  50  60  70  80  90 ... ns
```

The important observation is that:

```text
Input waveform = Output waveform
```

The output follows the input without logical inversion.

---

# 17. Why Does the Output Equal the Input?

The circuit performs two inversions:

```text
in
 ↓
NOT
 ↓
NOT
 ↓
out
```

The first NOT changes the signal:

```text
0 → 1
1 → 0
```

The second NOT changes it back:

```text
1 → 0
0 → 1
```

Therefore:

```text
0 → NOT → 1 → NOT → 0

1 → NOT → 0 → NOT → 1
```

So:

```text
out = in
```

This is the fundamental behavior of the One-Bit Buffer.

---

# 18. Buffer vs NOT Gate

A buffer should not be confused with a NOT gate.

### Buffer

```text
in ───► BUFFER ───► out

0 ────────────────► 0
1 ────────────────► 1
```

### NOT Gate

```text
in ───► NOT ───► out

0 ────────────► 1
1 ────────────► 0
```

The One-Bit Buffer preserves the input value, whereas a NOT gate reverses it.

---

# 19. Key Takeaways

* A one-bit buffer has one input and one output.
* The output always follows the input.
* The fundamental Boolean expression is `out = in`.
* The design uses an intermediate wire named `sub_wire`.
* The design implements two NOT operations using `~(~sub_wire)`.
* Two NOT operations cancel each other.
* The testbench applies a repeating `0 → 0 → 1` input pattern.
* Each input value is held for 10 ns.
* `$monitor` displays the simulation values.
* `$dumpfile` creates a VCD waveform file.
* `$dumpvars` records signals for waveform viewing.
* The expected output is identical to the input.

---

# 20. Conclusion

The One-Bit Buffer is a simple but important digital logic circuit that demonstrates how a signal can be transferred from an input to an output without changing its logical value.

In this implementation, the input is first assigned to `sub_wire` and then passed through two NOT operations:

```verilog
assign sub_wire = in;
assign out = ~(~sub_wire);
```

Since two inversions cancel each other:

```text
out = ~(~in)
out = in
```

The testbench verifies this behavior by applying multiple input patterns and monitoring the resulting output.

Therefore, the One-Bit Buffer successfully demonstrates the fundamental concept of **preserving and transferring a single digital logic value from input to output**.
