# Session 16 --- Memory Layout, Structs & Unions

## Lecturer Notes

### Preparation

There is currently **no preparation video** for this session. The
worksheet is designed so that the first experiments can be carried out
directly in class.

If a preparation video is added later, **Steps 1 and 2** are good
candidates:

-   `struct` vs. `union` and overlapping memory regions
-   inspecting the same bytes through different types
-   byte order and Little Endian vs. Big Endian

Even with such a video, the results and conclusions of these experiments
should be revisited and consolidated during the in-class session.

### Teaching Idea

This worksheet deliberately starts with the **physical memory layout**
before returning to the compiler project.

Students should learn to reason about details such as addresses,
offsets, alignment, padding, overlapping `union` members, and byte
order. The goal is not that every later data-structure sketch contains
all of these details. Quite the opposite: students need to understand
the details well enough to decide consciously which of them are relevant
and which can be omitted.

There is a useful analogy with a mathematics degree. Students already work with
functions, derivatives, vectors, and linear systems at school before courses
such as Analysis and Linear Algebra examine the foundations and details
carefully. In later courses, the emphasis changes again: in Differential
Equations, for example, one must recognize which of these details matter for
the problem at hand, while Functional Analysis takes familiar concepts and
generalizes them to a much broader setting.

This distinction becomes important later in the worksheet. The
memory-layout diagrams in the first part are intentionally precise,
while the sketches for expression trees focus on pointers and logical
relationships between nodes. Simplification should be a conscious
abstraction, not a black box.

### Steps 1--2 --- `union` and Byte Order

Let students **experiment and draw first** before discussing the result.

In Step 1, students compare the layout with and without the `union`. The
spoiler diagrams are intentional: students first produce their own
sketches and then compare them with a consistent notation that will be
reused throughout the worksheet.

Step 2 uses an array of eight `char` values to expose the individual
bytes of the `double`/`u64` representation. The purpose is not a
detailed treatment of IEEE 754 or endianness. These examples are used to
establish the habit of looking at the actual representation in memory.

When discussing the results, make sure that students can explain:

-   why the members of a `union` have the same address,
-   why the size of the union is determined by the storage needed for
    its members,
-   how the bytes observed through `x.c` relate to the hexadecimal
    representation of `x.i`,
-   what distinguishes Little Endian from Big Endian.

### Step 3 --- Padding and Alignment

This is the transition from isolated experiments back to the compiler
project.

The important part is that students **measure the layout of `Expr`
themselves** rather than merely being told about padding. Let them
complete the diagram before explaining the gap between `kind` and the
pointer members.

The short discussion of alignment and padding is intentionally not
exhaustive. The main conclusion for this course is:

> The size and layout of a `struct` cannot in general be obtained by
> simply adding the sizes of its members.

### Step 4 --- Using a `union` in `Expr`

Now the earlier experiments become useful rather than merely
illustrative.

The current `Expr` representation reserves memory for alternatives that
are never needed simultaneously. Students first replace these
alternatives by a `union` and measure the effect on the layout. They
then extend `Expr` with the fields needed by the upcoming compiler work
and draw the complete layout themselves.

This is also a good point to emphasize the difference between a
**memory-layout diagram** and a later **data-structure sketch**. Both
are useful, but they answer different questions.

### Steps 5--7 --- Function Calls and Argument Lists

The function-call extension deliberately begins with a test program. The
test specifies the interface and the desired output before the
implementation exists.

The workflow is again driven by observable problems:

1.  compiler error because `createCallExpr` is undeclared,
2.  linker error because the declared functions are not implemented,
3.  design the required data structure on paper,
4.  implement the constructors,
5.  runtime assertion because `printExprTree` does not yet support the
    new node kinds,
6.  finally fix `releaseExpr` to avoid memory leaks.

The sketches are intentionally less detailed than the earlier
memory-layout diagrams. At this point the relevant information is **what
points where**.

The argument representation combines two structures students already
know: an expression tree and a singly linked list. `addArgExpr` prepends
argument nodes, while `arg.pos` records the original argument position.
Consequently, printing the list recursively in reverse order restores
the source order.

### Step 8 --- Unary Expressions

The final step should require substantially less guidance.

By now students have seen the recurring pattern for extending the
expression-tree representation. They receive a test program and a common
constructor signature, but implement `createUnaryExpr`, the
corresponding `printExprTree` support, and the unary case in
`releaseExpr` themselves.

This step is intended as a transfer exercise. Once the three general
expression groups --- unary, binary, and primary --- are in place,
adding further concrete expression kinds becomes largely mechanical. The
important design work has already been done.

### In-Class Emphasis

Do not rush the drawings. A central objective of this session is that
students become comfortable switching between two levels of abstraction:

-   **physical representation:** bytes, addresses, offsets, alignment,
    padding, and overlapping storage;
-   **logical representation:** nodes, pointers, trees, and linked
    lists.

Students should know the first level well enough that they can
deliberately omit it when the second level is what matters.
