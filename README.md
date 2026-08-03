# not-abc

`not-abc` is a tiny, self-hosting programming language and compiler. The
language is deliberately minimal: it has only 64-bit values, no static type
checking, and only a handful of built-in functions. The entire compiler is
written in `not-abc` itself.

The project is intended for educational purposes. It demonstrates that a
surprisingly small language is sufficient to implement a complete compiler.

**Note:** This project uses hard tabs with a tab width of 8. If the code looks
misaligned on GitHub, append `?ts=8` to the URL or configure your GitHub tab
width accordingly.

## Work in Progress: Teaching Material

I am currently translating the teaching material for my undergraduate course
**Introduction to High Performance Computing (HPC0)** into English. This is an
ongoing effort and will take some time, but I try to make regular progress
whenever my schedule allows.

The translated worksheets, lecturer notes, and additional teaching material can
be found here:

- [HPC0 Sessions](hpc0-sessions/README.md)
  - [Session 00 – Getting Ready](hpc0-sessions/session00/README.md)
  - [Session 01 – Top-Down: Experiments with ABC](hpc0-sessions/session01/README.md)

## Language Overview

A `not-abc` program consists of global variables and function definitions.

Supported language features include:

- global and local variables
- functions (may be called before they are defined)
- `while` loops
- `if` / `else`
- integer, character and string literals
- arithmetic, comparison and logical operators
- pointers

The grammar is:

```text
top-level     = { global | fn } EOI
global        = "global" identifier { "," identifier } ";"
local         = "local" identifier { "," identifier } ";"
fn            = "fn" identifier "(" ")" compound-stmt

compound-stmt = "{"
                  { expr-stmt | local | while-stmt | if-stmt }
                "}"

expr-stmt     = expr ";"

while-stmt    = "while" "(" expr ")" compound-stmt

if-stmt       = "if" "(" expr ")" compound-stmt
                [ "else" compound-stmt ]

expr          = logical-or { "=" expr }

logical-or    = logical-and { "||" logical-and }
logical-and   = equality { "&&" equality }
equality      = relational { ( "==" | "!=" ) relational }
relational    = additive { ( "<" | "<=" | ">" | ">=" ) additive }
additive      = term { ( "+" | "-" ) term }
term          = prefix { ( "*" | "/" | "%" ) prefix }

prefix        = ( "-" | "&" | "*" | "#" | "!" ) prefix
              | factor

factor        = decimal-literal
              | character-literal
              | string-literal
              | identifier [ "(" [ expr { "," expr } ] ")" ]
              | "(" expr ")"
```

## Data Model

All variables are 64-bit values.

A value may be interpreted either as

- a signed 64-bit integer, or
- a pointer.

The language performs **no static type checking**. The programmer is
responsible for using values consistently.

The unary operators are:

- `&` — address-of (like C)
- `*` — dereference 8 bytes
- `#` — dereference a single byte
- `-` — arithmetic negation
- `!` — logical negation

## Functions

Every function returns a 64-bit value.

There is **no `return` statement**. Instead, the value of the **last evaluated
expression** becomes the function's return value.

Functions may be called before they are defined.

The compiler does **not** check whether a function is called with the correct
number of arguments. Calling a function with too few or too many arguments
results in undefined behavior.

Execution always starts in `main()`.

## Built-in Functions

The language provides four built-in functions that interface directly with the
operating system:

- `putchar(ch)` writes the least significant byte of `ch` to standard output.
- `ch = getchar()` reads one byte from standard input, sign-extends it to 64
  bits, and returns `-1` on end-of-file.
- `p = malloc(size)` allocates `size` bytes on the heap and returns a pointer,
  or `0` if the allocation fails.
- `free(p)` does nothing if `p` is `0`. Otherwise `p` must be a pointer
  previously returned by `malloc()`.

## Hello World

```c
fn print(s)
{
    while (#s) {
        putchar(#s);
        s = s + 1;
    }
}

fn println(s)
{
    print(s);
    putchar('\n');
}

fn main()
{
    println("hello, world!");
}
```

## Building the Compiler

The compiler itself is distributed as LLVM IR.

```sh
clang -o not-abc not-abc.ll
```

## Compiling Programs

`not-abc` reads source code from **stdin** and writes LLVM IR to **stdout**.

```sh
./not-abc < foo.abc > foo.ll
clang -o foo foo.ll
```

## Example

A more substantial example is available in `examples/factorial.abc`.

## Arrays and Structs (Hack)

`not-abc` has neither arrays nor structs.

However, string literals are stored in the writable data segment with 8-byte
alignment. This makes it possible to reuse them as blocks of memory.

Likewise, `malloc()` can be used to build dynamic data structures. See
`examples/list.abc` for a simple linked-list implementation.

## Self-Hosting

The file `examples/not-abc.abc` contains a compiler for the `not-abc` language
written in `not-abc` itself.

```sh
./not-abc < examples/not-abc.abc > not-abc-compare.ll
diff not-abc.ll not-abc-compare.ll
```

If the generated LLVM IR is identical, the compiler has successfully compiled
itself. In other words: **not-abc is self-hosting.**


## Bootstrap Compiler

The self-hosting compiler contained in this repository was bootstrapped using a
compiler written in **ABC**.

That compiler can be found in the companion repository

https://github.com/michael-lehn/abc-llvm/tree/main/not-abc

The companion project contains a considerably more readable implementation of
the compiler because it still makes use of structures, enumerations, and member
access. It also includes both the LLVM and ULM code-generation backends used in
the course.

The initial `not-abc.ll` contained in this repository was generated by compiling
`examples/not-abc.abc` with the ABC implementation.




# Background

`not-abc` was developed as part of my undergraduate course *Introduction to
High Performance Computing* at Ulm University.

The goal of the course is to teach students how computers and compilers
actually work. Instead of presenting these topics one after another, the course
develops them in parallel.

The first half of the semester alternates between a **bottom-up** and a
**top-down** perspective. Eventually, both approaches meet in the middle:
students understand both how modern hardware executes programs and how
high-level source code is translated into machine code.

### Bottom-up: Building a Computer

Starting from NAND gates, students construct increasingly complex hardware
components:

- logic gates such as AND, OR and XOR,
- flip-flops,
- adders,
- registers,
- a simple ALU,
- and finally a complete processor.

The processor is controlled by an 8-bit instruction set and is gradually
extended throughout the course. Once completed, students gain practical
experience writing assembly programs for their own processor, including
arithmetic, functions, stack frames and control flow.

The hardware used in the course is generated using the ULM generator:

https://github.com/michael-lehn/ulm-generator

### Top-down: Building a Compiler

In parallel, students program in **ABC**, a small C-like programming language
developed specifically for the course.

https://github.com/michael-lehn/abc-llvm

Although considerably smaller than C, ABC supports most language features
needed for systems programming, including functions, local and global
variables, pointers, recursive data structures, dynamic memory allocation,
recursion, and dynamic dispatch. The language intentionally omits much of C's
historical complexity while preserving the fundamental ideas. Its purpose is
not to replace C, but to make the essential concepts easier to understand.

Over the past few years, we have consistently observed that students who first
learned these concepts in ABC transitioned remarkably smoothly to C and, in
subsequent semesters, to modern C++. Once the underlying ideas are understood,
learning C and C++ becomes largely a matter of learning additional language
features rather than fundamentally new concepts.

Rather than solving isolated exercises, each programming assignment contributes
a reusable component of a larger software system. Students develop linked lists
for symbol tables, trees for expression trees, recursive-descent parsers, code
generators, and many of the building blocks that eventually become part of a
complete compiler.

The objective is to let students experience how large software systems evolve
from many small, understandable steps. By the time they begin writing the
`not-abc` compiler, most of the required infrastructure has already been
implemented by the students themselves throughout the semester.


### The Result

Towards the end of the semester, the two strands come together.

Students extend the compiler to generate code for the processor they built
themselves. At this point they have experienced the complete toolchain—from
logic gates to assembly language, from parsing source code to code generation.

`not-abc` is the language used for the final step. It is deliberately minimal,
yet expressive enough to implement a complete compiler. The compiler included
in this repository is written in `not-abc` itself, making the language
self-hosting.

### From Frontend to Machine Code

The compiler developed during the course ultimately supports multiple
code-generation backends.

One backend generates code for the custom ULM processor that the students built
themselves during the hardware part of the course. This demonstrates the
complete path from a high-level programming language down to a processor whose
architecture is fully understood.

To show that exactly the same compiler frontend can also target real-world
hardware, a second backend generates LLVM IR. LLVM's optimizing toolchain can
then produce native executables for a wide range of architectures and operating
systems without requiring any changes to the compiler frontend.

This separation between frontend and backend also illustrates one of the
fundamental ideas of compiler construction: once a language has been parsed and
represented internally, supporting additional target architectures mainly
requires implementing new code generators.

### How `not-abc.abc` Was Created

The compiler contained in `examples/not-abc.abc` was **not** written from
scratch by students. That would simply have been too much for a single
semester.

Instead, it was assembled from the components developed throughout the course.
Students implemented the lexer, parser, symbol table, expression trees, and
much of the code generator as individual assignments in **ABC**. These
components were then combined into a single compiler.

The resulting program was subsequently transformed into valid `not-abc` code by
removing language features that `not-abc` itself does not provide. Enumeration
constants became integer constants, and structure member accesses were
rewritten as explicit pointer arithmetic. For example,

```c
foo->bar
```

became

```c
*(foo + 8)
```

if `bar` resides at offset 8, while

```c
foo.bar
```

became

```c
*(&foo + 8)
```

Although this transformation makes the code considerably harder to read,
students can still recognize many of the components they implemented
themselves. The compiler therefore serves as a bridge between the higher-level
abstractions used during the course and the minimal language required for
self-hosting.

Perhaps more importantly, it also demonstrates why seemingly "low-level" topics
such as memory layout, structure offsets, and pointer arithmetic were covered
in more detail than might initially have appeared necessary.

## A Mathematical Perspective

This course is taught as part of the mathematics curriculum rather than as a
software engineering course.

The teaching philosophy follows the way mathematics is traditionally developed.
Instead of starting with general frameworks or abstract principles, we begin
with small, concrete examples. Each example solves a real problem with only the
concepts that are already available. As new problems arise, students naturally
discover recurring patterns, leading to increasingly general abstractions.

Ironically, this description is itself rather abstract. Almost everyone agrees
with it in principle, but its practical consequences become much clearer
through an example.

Before introducing finite state machines, many students have already worked
with one without realizing it. Throughout the course, most students use Neovim,
whose different editing modes provide an intuitive example of state-dependent
behavior. Later, they implement a simple lexer for the teaching language. At
that point, they have encountered the same underlying idea in two entirely
different contexts before it is finally introduced as the mathematical concept
of a finite state machine.

Only then do we introduce the general mathematical concept of finite state
machines. Once students already have an intuition for the problem, the formal
description of deterministic and nondeterministic finite automata, together
with their equivalence to regular languages, becomes much easier to understand.
Mathematics no longer appears as an arbitrary formalism, but as a precise
language for describing something students already understand intuitively.

This pattern repeats throughout the course: experience first, abstraction
afterwards.

The objective is not merely to teach students how to use existing tools, but to
develop the ability to understand, analyze, and construct them from first
principles. Building a compiler is therefore not an end in itself. It is an
exercise in abstraction, decomposition, recursion, data structures, algorithms,
and systematic reasoning.

In mathematics, we seldom study a subject simply because it is immediately
useful. We study it because it sharpens our way of thinking. Practical
usefulness is usually a welcome consequence rather than the primary motivation.

This philosophy is reflected throughout the course—from constructing a
processor out of logic gates to writing a self-hosting compiler.
