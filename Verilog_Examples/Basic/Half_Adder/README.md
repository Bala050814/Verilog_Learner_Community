# Half Adder

A **Half Adder** is one of the most fundamental building blocks in **Digital Electronics** and **Verilog**. It is a simple combinational circuit that adds **two 1-bit binary inputs** and produces two outputs:

* **Sum** – The result of the addition.
* **Carry** – Generated when the addition exceeds a single bit.

## How a Half Adder Works

A Half Adder takes two inputs:

* **A**
* **B**

When these two bits are added together, there are two possible outputs:

* **Sum** (`sum`)
* **Carry** (`carry`)

The carry output becomes `1` only when both input bits are `1`.

## Truth Table

| A | B | Sum | Carry |
| - | - | --- | ----- |
| 0 | 0 | 0   | 0     |
| 0 | 1 | 1   | 0     |
| 1 | 0 | 1   | 0     |
| 1 | 1 | 0   | 1     |

### Why is the Sum `0` when A = 1 and B = 1?

In binary,

```
1 + 1 = 10₂
```

The result `10₂` contains **two bits**.

* The **least significant bit (0)** becomes the **Sum**.
* The **most significant bit (1)** becomes the **Carry**.

So,

```
  1
+ 1
----
 10
```

* **Sum = 0**
* **Carry = 1**

This is why the last row of the truth table is:

| A | B | Sum | Carry |
| - | - | --- | ----- |
| 1 | 1 | 0   | 1     |

## Boolean Equations

The Half Adder can be represented using two simple Boolean expressions:

```
Sum   = A ⊕ B
Carry = A · B
```

Where:

* `⊕` represents the XOR operation.
* `·` represents the AND operation.

## Real-Life Analogy

Imagine two people each have **one coin**.

* If only one person contributes a coin, the total is **1 coin**, so the **Sum** is `1` and there is **no Carry**.
* If neither contributes, the total is **0 coins**.
* If **both contribute one coin**, there are **2 coins**.

In binary:

```
2 = 10₂
```

So:

* `0` becomes the **Sum**
* `1` becomes the **Carry**

This is exactly how a Half Adder behaves.

## Circuit Diagram

<img width="507" height="332" alt="Half Adder Circuit" src="https://github.com/user-attachments/assets/b3f7df1c-78fc-4a62-a1cc-c3d068e4cb2d" />

# Verilog Implementation

The Verilog implementation of the Half Adder can be found in **`half_adder.v`** in this dirctory.

# Code Explanation

In Verilog, every hardware design is written inside a **module**. A module is the basic building block of a Verilog design.

## What is a Module?

Think of a module like a **LEGO block**. Every LEGO block has a specific shape and purpose. Similarly, every Verilog module has a specific function. By connecting multiple modules together, we can build larger and more complex digital circuits.

## Ports

A module communicates with the outside world using **ports**. There are two main types of ports:

- **Input Ports** – Receive data into the module.
- **Output Ports** – Send data out of the module.

In this Half Adder:

```verilog
input  a, b;
output sum, carry;
```

- `a` and `b` are the input ports.
- `sum` and `carry` are the output ports.

## Modeling Style

This implementation uses **Dataflow Modeling**, where the functionality of the circuit is described using continuous assignments.

Verilog also supports other modeling styles:

- **Switch-Level Modeling** – Describes circuits using transistors and switches.
- **Gate-Level Modeling** – Uses built-in gate primitives such as `and`, `or`, `xor`, etc.
- **Behavioral Modeling** – Uses procedural blocks like `always` and `initial` to describe circuit behavior.

For example, instead of writing:

```verilog
assign sum = a ^ b;
```

you could write the same logic using the built-in XOR gate:

```verilog
xor (sum, a, b);
```

Try implementing the Half Adder using different modeling styles to better understand how each one works.

## The `assign` Keyword

The `assign` keyword creates a **continuous assignment**.

```verilog
assign sum   = a ^ b;
assign carry = a & b;
```

This means the outputs are continuously updated whenever the inputs change.

For example:

- If `a` changes, `sum` and `carry` are automatically recalculated.
- If `b` changes, the outputs are updated immediately.

Continuous assignments are commonly used for **combinational circuits**.

## Operators Used

This design uses two bitwise operators:

### XOR (`^`)

```verilog
assign sum = a ^ b;
```

The XOR operator is used to calculate the **Sum** output.

### AND (`&`)

```verilog
assign carry = a & b;
```

The AND operator is used to calculate the **Carry** output.

## A Note About `reg`

Verilog has a data type called `reg`.

Despite its name, **`reg` does not always represent a hardware register**. It simply means the signal can hold a value assigned inside a procedural block (`always` or `initial`).

Since this Half Adder uses **continuous assignments (`assign`)**, there is no need to declare the outputs as `reg`.

## Module Declaration

Every Verilog module starts with the `module` keyword and ends with the `endmodule` keyword.

```verilog
module half_adder (
    input  a,
    input  b,
    output sum,
    output carry
);

    assign sum   = a ^ b;
    assign carry = a & b;

endmodule
```

# Key Takeaways

- Every Verilog design is written inside a **module**.
- Modules communicate using **input** and **output** ports.
- This Half Adder is implemented using **Dataflow Modeling**.
- The `assign` keyword continuously drives an output based on an expression.
- `^` is the **bitwise XOR** operator.
- `&` is the **bitwise AND** operator.
- Every module begins with `module` and ends with `endmodule`.
* A Half Adder adds **two 1-bit inputs**.
* It has **two outputs**: **Sum** and **Carry**.
* It **does not** have a carry input from a previous stage.
* Multiple Half Adders can be combined to build more complex adders, such as a **Full Adder**.
