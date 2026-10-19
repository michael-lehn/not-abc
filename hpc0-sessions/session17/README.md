# Session 17 — From Parsing to Code Generation

## Preparation: No Video This Time

There is **no preparation video** for this session. Instead, please revisit the
worksheets and the code you developed in earlier sessions. You do not need to
solve every exercise again, but you should be able to explain the main ideas
and recognize the interfaces you implemented.

In particular, review:

- **Session 10 — Code Generator:** `gen.hdr`, `gen.abc`, register allocation,
  and generating ULM assembly instructions.
- **Session 13 — Expression Trees and Parser:** recursive expression trees,
  `printExprTree()`, and how a grammar becomes a recursive-descent parser.
- **Session 14 — Calling Conventions and Code Generator:** stack frames, return
  values, `genFuncDefBegin()`, `genFuncDefEnd()`, and the functions for
  generating calls.
- **Session 16 — Memory Layout, Structs & Unions:** the extended `Expr`
  representation, `EXPR_CALL`, argument lists, and the associated constructors.

It is also worth revisiting the grammar work from **Session 15**, particularly
how optional and repeated grammar constructs translate into `if` statements and
loops.

## Worksheet

**[Worksheet 17 — From Parsing to Code Generation](hpc0-session17-en.pdf)**

In this session, we connect components that we have been building separately:
the parser constructs expression trees, the code generator translates them into
ULM assembly, and the resulting programs can be assembled and executed. We then
extend the parser and code generator to support function calls.

The challenge is not primarily writing lots of new code. It is understanding
how the pieces fit together — and being able to trace what happens from an
input expression all the way to an executing program.

## Lecturer Notes — Big Challenge, Big Reward

This session is an integration milestone. Students must move between grammar
rules, recursive data structures, register allocation, assembly instructions,
and calling conventions. That is demanding, even though much of the code
already exists.

The preparation is therefore deliberately a review rather than another video.
Encourage students to bring their earlier worksheets and inspect their own
implementations when they get stuck. The point is to *reuse and understand*
previous work, not to rediscover every detail from scratch.

The worksheet provides code where doing so helps keep the focus on integration,
but leaves important connections for students to discover and test themselves.
In particular, the transition from arithmetic expressions to function calls
builds directly on Sessions 14 and 16.

The reward is substantial: by the end, students are no longer merely printing
expression trees or inspecting isolated assembly fragments. They can generate
executable ULM programs that evaluate expressions and even produce visible
output with `putchar()` — rather than communicating results only through an
exit code.

**Big challenge, big reward:** many small pieces from previous sessions finally
become one working system.

*HPC0 — Not A Bloody Compiler Project*
