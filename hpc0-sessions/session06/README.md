# Lecturer Notes --- Worksheet 6: Building a Simple ALU (Part 2 of 2)

This worksheet completes the Mini-ALU started in Worksheet 4.

The main purpose is to bring together the combinational logic developed
in Worksheet 4 with the sequential logic introduced earlier in Worksheet
2 and discussed in more detail in the lecture video on D latches and D
flip-flops.

By the end of the worksheet, the students have built a small machine
that can execute the 8-bit instructions introduced in Worksheet 4. The
machine has four 8-bit registers, stored status flags, an arithmetic
datapath, and an instruction decoder.

The worksheet is deliberately bottom-up. Each component is first
understood and tested separately before the complete Mini-ALU is
assembled.

## Preparation

Before the session, students should have watched:

-   [Sequential Logic... and about D Latches and D Flip
    Flops](https://www.youtube.com/watch?v=d47EieiISyc)

In particular, they should already know the difference between a D latch
and a D flip-flop and understand what happens at the rising edge of the
clock.

The worksheet assumes the circuits from Worksheet 4 are available. In
particular, students reuse the adder/subtractor, the status-flag logic,
and the 8-bit instruction format developed there.

The complete CircuitVerse project for this worksheet is available here:

-   [ALU HPC0 2026 ---
    CircuitVerse](https://circuitverse.org/users/20564/projects/alu-hpc0-2026/simulator/embed)

## Step 1 --- Storing the Status Flags

Worksheet 4 deliberately stopped with combinational status-flag logic.
The first step of this worksheet turns these flags into state.

The existing `Status-Flags` module computes `ZF`, `CF`, `SF`, and `OF`
combinationally. Four D flip-flops are added so that the values are
stored on the rising edge of the clock.

This is a good point to ask students to explain, rather than merely
recall, the difference between a D latch and a D flip-flop:

-   Why would a D latch be inappropriate here?
-   What does level-triggered mean?
-   What does edge-triggered mean?
-   How can the behavior be described mathematically?

The intention is not to introduce D flip-flops again. They have already
seen them in Worksheet 2 and in the preparation video. The important
step is now to use them as part of a larger circuit.

### SystemVerilog

The SystemVerilog example is not intended as a SystemVerilog programming
lesson. The purpose is to show that the same hardware that was
constructed graphically in CircuitVerse can also be described textually.

In Worksheet 4, students saw `always_comb` for combinational logic. Here
they encounter `always_ff`:

``` systemverilog
always_ff @(posedge clock) begin
    ...
end
```

The `ff` stands for flip-flop and `posedge` specifies the rising edge of
the clock.

This provides a useful direct comparison:

  -----------------------------------------------------------------------
  SystemVerilog                       Hardware
  ----------------------------------- -----------------------------------
  `always_comb`                       combinational logic

  `always_ff @(posedge clock)`        edge-triggered sequential logic
                                      (flip-flops)
  -----------------------------------------------------------------------

The nonblocking assignment operator `<=` should also be pointed out. In

``` systemverilog
ZF <= ~(s[0] | s[1] | s[2] | s[3] |
        s[4] | s[5] | s[6] | s[7]);
```

`ZF` does not continuously follow the expression on the right-hand side.
Its new value is stored at the rising edge of the clock and remains
unchanged between clock edges.

There is no need at this point to discuss the event scheduling semantics
of nonblocking assignments in detail.

### From the Mathematical Model to Physical Hardware

The expression for `ZF` also provides an opportunity to revisit
propagation delay.

In the Boolean model, evaluating

``` text
~(s[0] | s[1] | ... | s[7])
```

appears instantaneous. In physical hardware it is not. Signals require
time to propagate through combinational logic and routing.

This was already observed experimentally with the ripple-carry adder in
Worksheet 2. Here the same phenomenon becomes important in a clocked
circuit: the combinational logic must have produced a stable value
before the active clock edge.

For an FPGA, the combinational expression will typically be mapped to
LUTs and routing resources rather than literally to the chain of gates
suggested by the source expression. Nevertheless, these physical
resources have nonzero propagation delays.

This is a useful modeling discussion, particularly for students with an
applied-mathematics background:

> Which properties of the physical system can we ignore in our model,
> and which properties become relevant for the question we want to
> answer?

For determining the logical result of the Mini-ALU, propagation delays
can largely be ignored. For determining the maximum reliable clock
frequency, they cannot.

FPGA tools therefore perform timing analysis after mapping the logical
design to physical resources. A design may be logically correct in
simulation while failing to meet a requested timing constraint on
physical hardware.

For the tiny circuits used here, timing closure is not a practical
concern. The purpose of the discussion is simply to make students aware
of the boundary between the idealized logical model and its physical
realization.

## Step 2 --- Adder with Stored Status Flags

The `Adder w/SF` module combines the adder/subtractor from Worksheet 4
with the new `Status-Flags-FF` module.

This step is primarily a test of Step 1 rather than a new construction.

A useful experiment is to let students choose operands and an operation,
apply a rising clock edge, and then change the operands without applying
another clock edge.

Do not tell them in advance what should happen. Ask them to observe the
circuit and explain its behavior.

The important observation is that the adder output is combinational and
reacts to its inputs, whereas the status flags represent stored state
and retain their previous values until the next rising clock edge.

This is the first place in the worksheet where combinational logic and
state are visibly working together as one functional unit.

## Step 3 --- Building the Register File

The register file contains four architecturally visible 8-bit registers:

``` text
%0  %1  %2  %3
```

`%0` is a zero register. Reading it always produces zero and attempts to
write to it have no effect.

The circuit is mostly provided. The goal is not to make students
discover a register-file implementation from scratch, but to understand
how the provided implementation realizes its specification.

Students should be able to explain three things:

1.  How the demultiplexer uses `addr_in` to select which register
    receives a clock edge and therefore stores `data_in`.
2.  How a multiplexer uses `addr1_out` to select the register appearing
    at `data1_out`.
3.  How the zero register is implemented.

The implementation of `%0` is particularly useful. There is no storage
element for `%0`; reading register zero simply selects a constant 8-bit
zero value. Consequently, there is nowhere for a value written to `%0`
to be stored.

Students complete the second read port, `addr2_out` / `data2_out`,
analogously to the already provided first read port.

They should then test that two different registers can be read
simultaneously and that writing a nonzero value to `%0` does not change
`%0`.

The additional outputs `%0`, `%1`, `%2`, and `%3` exist for observation
and debugging. On the physical Mini-ALU these are connected to
hexadecimal displays so that all four register values can be inspected
simultaneously.

## Step 4 --- Building the ALU

This is the central step of the worksheet.

The register file and `Adder w/SF` are now connected to form the actual
datapath.

The second operand of an arithmetic operation always comes from
`data2_out`. The first operand can come from either `data_in` or
`data1_out`.

The multiplexer controlled by `use_data1_out` selects between them.

The name `use_data1_out` deliberately describes what the control signal
does in the hardware. When it is zero, `data_in` is selected and can
supply an immediate operand. When it is one, the first operand comes
from the register file.

Students should trace both paths through the circuit before trying to
operate it.

The output `S` of the adder is fed back to `data_in` of the register
file. Thus the result computed by the combinational datapath can be
stored in the destination register on the next rising clock edge.

### Manual Control

Before introducing the decoder, let students control the ALU manually.

Useful operations are, for example,

``` text
%1 <- 3
%2 <- 5
%3 <- %1 + %2
%1 <- %3 - %2
```

For each operation, students should determine the required values of

``` text
data_in
addr_in
addr1_out
addr2_out
use_data1_out
add/sub
```

before generating the clock edge.

This is important preparation for the instruction decoder. The decoder
should not appear as an arbitrary additional circuit. Students should
first experience the problem that it solves: manually setting all
control signals for every operation is tedious and error-prone.

### The Zero Register and the Status Flags

At this point, ask students to execute an arithmetic operation with `%0`
as the destination register.

Choose operands for which the resulting status flags are interesting.

Students should observe what happens and explain the result from the
circuit they have built.

This addresses an important question:

> Does it matter for the status flags whether the result is written to
> the zero register?

The answer follows directly from the datapath rather than from a special
rule that has to be memorized.

The arithmetic operation is performed normally, and the status flags are
computed and stored from its result. Independently, the register file
discards a write to `%0`.

Therefore the status flags are updated normally even when the
destination is the zero register.

This is one of the advantages of constructing the machine bottom-up: an
architectural behavior that might otherwise appear to be an arbitrary
rule follows directly from the hardware.

## Step 5 --- Building the Instruction Decoder

After operating the ALU manually, the need for the decoder should be
clear.

Worksheet 4 introduced an 8-bit instruction format. The decoder
translates one such instruction into the control signals required by the
ALU.

Most of the decoder is provided. In particular, the connections for the
register addresses are already present. Students complete the parts
generating

``` text
data_in
add/sub
use_data1_out
```

from `Op` and the remaining instruction fields.

Before wiring the multiplexers, it is useful to have students complete a
table of the form

  `Op`   `data_in`   `add/sub`   `use_data1_out`
  ------ ----------- ----------- -----------------
  `00`   ?           ?           ?
  `01`   ?           ?           ?
  `10`   ?           ?           ?
  `11`   ?           ?           ?

The table should be derived from the instruction semantics introduced in
Worksheet 4.

Once the table is correct, implementing the decoder is mostly
mechanical.

A useful conceptual question is:

> Why can the missing parts of the decoder be implemented using
> multiplexers controlled by `Op`?

Students should test at least one instruction for each value of `Op` and
predict the decoder outputs before checking them in CircuitVerse.

## Step 6 --- Putting Everything Together

The final construction is intentionally simple.

Connect the outputs

``` text
data_in
addr_in
addr1_out
addr2_out
add/sub
use_data1_out
```

of the `Decoder` to the corresponding inputs of the `ALU`.

The resulting circuit has only two inputs that matter during normal
operation:

``` text
instruction
clock
```

At this point it is worth stopping for a moment:

> The students have built a machine that accepts an 8-bit machine
> instruction and executes it on a clock edge.

The individual components should no longer be controlled manually.

### Executing Instructions

Reuse instructions from Worksheet 4 where possible. This closes the loop
between the instruction format that was previously considered abstractly
and the hardware that now gives those bit patterns their meaning.

For each instruction, students should

1.  predict the resulting register contents and status flags,
2.  enter the 8-bit instruction,
3.  generate the rising clock edge,
4.  compare the observed state with their prediction.

Include an instruction whose destination is `%0` and return to the
status-flag question from Step 4.

## What Has Been Built --- and What Has Not

At the end of the worksheet, the Mini-ALU contains

-   an arithmetic datapath,
-   four architecturally visible registers,
-   stored status flags, and
-   an instruction decoder.

It can therefore execute individual machine instructions.

It is deliberately **not yet a complete processor**. Instructions still
have to be entered manually. There is no instruction memory, no program
counter, and no mechanism that automatically fetches and executes a
sequence of instructions.

This distinction is worth making explicit. The students have now
constructed the part of the machine that gives an instruction its
effect. Later, additional state and control logic can turn this into a
machine that executes a program automatically.

## Teaching Perspective

The amount of circuit construction in this worksheet is intentionally
limited. Several circuits are almost complete when given to the
students.

The goal is not to test whether students can reproduce large
CircuitVerse diagrams. The important activity is to understand why the
wires are connected as they are, to predict the behavior of the
resulting circuit, and to explain observations in terms of the
components already understood.

The progression is therefore

``` text
Boolean logic
    -> combinational arithmetic
    -> flip-flops
    -> stored state
    -> register file
    -> datapath
    -> control signals
    -> instruction decoder
    -> executable machine instruction
```

This completes the bottom-up construction begun in the earlier
worksheets. The students have moved from individual gates to a machine
capable of executing their small instruction set.
