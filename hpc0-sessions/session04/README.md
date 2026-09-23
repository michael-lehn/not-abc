# Session 04 — Building a Simple ALU (Part 1 of 2)

This directory contains the lecturer notes accompanying Worksheet 4 of the
HPC0 course.

This session begins to combine the individual components developed so far
into the datapath of a very small computer. Most of the underlying ideas are
not new. The main goal is to revisit them, connect them, and turn them into
larger reusable CircuitVerse modules.

The resulting circuit is still entirely combinational. Registers and the
sequential part of the Mini-ALU will be added in Worksheet 6.


## Preparation

Students should watch the corresponding lecture videos before coming to
class.

- [4-bit Subtractor](https://www.youtube.com/watch?v=wJkuQ-SxHek)
- [Multiplexer and Demultiplexer](https://www.youtube.com/watch?v=Nqjllb--TU8)
- [https://www.youtube.com/watch?v=Nqjllb--TU8](https://www.youtube.com/watch?v=UZjZDI-lk4w)


The relevant topics include

- binary addition and subtraction,
- two's-complement arithmetic,
- adders and multiplexers,
- signed and unsigned overflow,
- and status flags.

Worksheet 2 has already given students a first experimental glimpse of
sequential logic, including D latches and D flip-flops. They should therefore
already have a rough idea that several flip-flops can be combined into a
register that stores a multi-bit value.

This is intentional. The details of sequential logic will only be developed
before Worksheet 6. Experience has shown that the distinction between
combinational and sequential logic needs some time to settle, and a first
encounter several sessions earlier helps considerably.


## Repetition Is Intentional

Several ideas in this worksheet have appeared before.

In particular, Worksheet 2 already introduced the useful XOR trick

- control = 0: pass a bit through unchanged,
- control = 1: invert the bit.

Students used this idea there when constructing an adder/subtractor.

Worksheet 4 deliberately introduces the same idea again, first for a single
bit and then for a multi-bit pattern. This repetition is intentional.
Experience has shown that students often understand the XOR trick when they
first see it, but do not yet recognize it later as a general-purpose building
block.

During this session, the same pattern appears several times:

1. selecting between addition and subtraction in the adder,
2. computing the Carry Flag,
3. handling the sign bit of `b` when computing the Overflow Flag.

By the third occurrence, students should ideally begin recognizing the
pattern themselves rather than being told to use an XOR gate.


## Status Flags

The status flags are mostly a review of the lecture videos.

`ZF` and `SF` are usually straightforward. `CF` is more interesting: before
students implement it, I ask them to explain why `Cout` is the Carry Flag for
addition but has to be inverted for subtraction.

This is worth insisting on. Constructing the correct circuit is not the same
as understanding why it works, and this is also a natural topic for an oral
exam.

`OF` tends to be the most difficult flag.

For addition, students should recall the two cases for signed overflow:

- two negative operands produce a non-negative result,
- two non-negative operands produce a negative result.

The important observation is that only the most significant bits of the two
operands and the result are needed.

The transfer step is subtraction. Mathematically, subtraction is implemented
by adding the additive inverse of `b`. Therefore the role of the sign bit of
`b` is reversed. This gives another opportunity to reuse the XOR trick.


## From Mathematical Specification to Hardware

The `ZeroExtend` and `LeftShift` modules are intentionally almost trivial.

The interesting part is not the circuit itself, but the direction in which
the problem is presented. Instead of showing a circuit and asking what it
does, the worksheet specifies a mathematical property using Knuth's notation

    u(a[n-1], ..., a[0])

and asks students to construct hardware satisfying that specification.

This is a small exercise in translating a mathematical model into an
implementation.

It also prepares two components that will immediately become useful when the
instruction format is introduced.


## A First Instruction Format

The instruction format is the first point where the individual exercises
begin to look like parts of a computer.

An instruction consists of eight bits, split into

    Op | X | Y | Z
     2    2   2   2

with `XY` denoting the four bits obtained by concatenating `X` and `Y`.

The notation is borrowed rather shamelessly from Donald Knuth.

At this stage, students do not yet build the instruction decoder. The
`Instruction` module merely uses splitters to expose the individual fields.
The purpose is conceptual: students can already see how only eight bits can
encode both an operation and its operands.

The four operations are

- `Op = 00`: load a 4-bit immediate value into `%Z`,
- `Op = 01`: add a 4-bit value shifted by four positions to `%Z`,
- `Op = 10`: add `%X` and `%Y` and store the result in `%Z`,
- `Op = 11`: subtract `%X` from `%Y` and store the result in `%Z`.

The first two operations together make it possible to construct an arbitrary
8-bit value in a register.

The slightly unusual use of addition for `Op = 01` is deliberate. It makes
the eventual hardware pleasantly simple.


## The Physical Mini-ALU

I bring the physical Mini-ALU to this session whenever possible.

The board already implements the complete datapath that students will finish
in Worksheet 6. Eight switches represent an instruction, and pressing a
button executes it. The four register contents are displayed in hexadecimal.

This makes it possible to enter the instructions from the worksheet manually
even though the students have not yet built the corresponding sequential
circuitry themselves.

For example,

    00001101
    00001001
    10011011

loads `3` into `%1`, loads `2` into `%2`, and computes `%1 + %2 -> %3`.

Students can then try

    11011011

and predict both the resulting register value and the status flags.

The hardware therefore serves as a preview of where the construction is
going rather than merely as a demonstration after everything has already
been explained.


## Looking Ahead to Worksheet 6

Worksheet 2 already introduced D latches and D flip-flops experimentally.
Worksheet 4 deliberately returns to combinational logic.

Before Worksheet 6, the lecture videos will revisit sequential logic more
systematically. In Worksheet 6, students will then build the four 8-bit
registers and the status registers and connect them to the combinational
components developed here.

At that point the instruction format introduced in this worksheet becomes
actual control logic rather than merely notation.


## A First Look at SystemVerilog

By this point, CircuitVerse begins to reach the limit of what is pleasant to
construct by manually placing gates and drawing wires.

This makes the end of the session a good moment for a first look at a
Hardware Description Language.

The goal is emphatically **not** to teach SystemVerilog syntax.

Instead, I use the full adder as an example because students already know
exactly what the corresponding circuit looks like. The Boolean equations can
be written almost directly as SystemVerilog expressions, making the
connection between graphical and textual hardware descriptions visible.

The most important message is:

> SystemVerilog code describes hardware. It is not a program whose statements
> are executed one after another.

For the combinational example, the `always_comb` block describes outputs that
continuously depend on the inputs.

The `assign` statements also provide a convenient opportunity to distinguish
the logical names used in our description (`a`, `b`, `c_in`, `s`, `c_out`)
from the physical names of pins connected to buttons and LEDs.


## FPGA Demonstration

I usually synthesize the full-adder example for an iCE40 FPGA and demonstrate
it during the session.

Three buttons provide `a`, `b`, and `c_in`; two LEDs display `s` and `c_out`.

This closes a useful circle:

    Boolean equations
          ↓
    CircuitVerse circuit
          ↓
    SystemVerilog description
          ↓
    synthesized FPGA hardware

The physical Mini-ALU is implemented in exactly the same way, only on a
larger scale.

Students are not expected to be able to write SystemVerilog after this
session. The intended takeaway is much smaller but, in my view, more
important: once they understand the circuit being described, an HDL should
no longer look mysterious. It is simply another representation of hardware
they already understand.
