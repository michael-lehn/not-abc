# Session 21 — Assignments

**Not A Bloody Compiler Project · HPC0**

This session extends our compiler with assignment expressions and declarations of global and local variables. It builds directly on the code generator from Sessions 19 and 20 and the expression parser introduced in Session 13.

**Worksheet:** [Session 21 — Assignments](hpc0-session21-en.pdf)

## Learning objectives

Students should be able to:

- distinguish left- and right-associative operators and explain why assignments
  are right-associative;
- extend expression trees and recursive-descent parsing to support assignments;
- distinguish an lvalue (a storage location) from the value computed by an
  expression;
- generate code for assignments while managing temporary registers correctly;
- parse global and local variable declarations and reject malformed
  declarations.

## Preparation

Students should have completed Sessions 19 and 20. In particular, they should
be familiar with the calling convention and code-generator interface
(`genLoadAddr`, `genLoadVar`, `genStore`, `genReleaseReg`, `genAddGlobal`, and
`genAddLocal`). They should also revisit the `parseBinary()` and
`tokenKindPrec()` approach from Session 13.

No new lecture video is required for this worksheet; the relevant foundations
have already been introduced.

## Lecturer notes

### Step 1 — A preview of assignment code generation

Start with `xtest_gen_04.abc`. This is deliberately a review rather than a new
implementation task: the code generator can already produce the instructions
for `x = 42; return x;`, even though the compiler cannot yet parse that source
program. Emphasize the difference between loading an address
(`genLoadAddr`) and loading a value (`genLoadVar`). The generated program
should return exit code **42**.

### Step 2 — Adding assignment expressions

Students add `EXPR_ASSIGN` to the binary expression kinds and extend tree
printing. The braces in `printf("{=} ")` matter for the LuaLaTeX tree
visualization.

Introduce `isLValueExpr()` as a semantic predicate, even though only identifier
expressions currently qualify. `loadExprAddr()` then translates an lvalue into
its address. In the assignment branch of `loadExpr()`, the right-hand side is
evaluated, stored through the left-hand address, and **the right-hand value
register is returned**. Only the address register is released at this point.
This supports nested assignments later; the caller releases the returned
register.

`xtest_expr_assign.abc` is an isolated code-generation test. Its output need
not assemble into a complete executable program.

### Step 3 — Adding assignments to the grammar

This is the conceptual centerpiece of the session. First implement the
seemingly natural grammar:

```text
expr       = assignment
assignment = binary { "=" binary }
```

Its `while`-based parser builds a **left-associative** tree for `a = b = 42`,
equivalent to `(a = b) = 42`. Have students generate `tree.tex` and inspect the
*incorrect* tree before discussing the fix. The outer assignment's left operand
is not an lvalue.

Students then change the grammar to:

```text
assignment = binary [ "=" assignment ]
```

The recursive right-hand side produces `a = (b = 42)`. Encourage students to
derive the corresponding parser change themselves rather than supplying it
immediately. Afterwards, they add the `isLValueExpr(left)` check when `=` has
been recognized and before consuming it. Compare a useful parser diagnostic
with an assertion failure during code generation.

Test valid and invalid cases, including `a = b = 42`, `42 = a`, and `(a + b) =
42` (with identifiers appropriately declared in the test context).

The first complete source-level test in `examples/ws21_assign.not-abc` assigns a function parameter and returns it. Its expected exit code is **42**.

### Step 4 — Global and local variable declarations

Students extend `parser.abc`, not `parseexpr.abc`. Global declarations belong
at the top level; local declarations are parsed within compound statements. The
`parseGlobal()` example serves as a template for `parseLocal()` using
`genAddLocal()`.

The expanded `examples/ws21_assign.not-abc` copies arguments through global and
local variables and returns `A - B`. With `foo(42, 84)`, the expected exit code
is **42**.

The worksheet intentionally does not yet address nested block scope. Avoid
introducing that complexity prematurely; it can be revisited when `if` and
`while` statements introduce additional compound blocks.

### Step 5 — A small hole in our parser

End with a negative test: `global;` is incorrectly accepted by the initial
implementation, despite the grammar requiring at least one identifier. Students
insert `expected(IDENTIFIER);` at the appropriate places in both declaration
parsers. They should also reject `global x,;` and `local a,;` — checking only
immediately after `global` or `local` is insufficient; the check is also needed
after a comma.

This makes a useful closing discussion: testing a parser means checking that it
**rejects invalid programs**, not merely that it accepts valid ones.

## Suggested classroom discussion

- Why does a `while` loop naturally construct left-associative trees, whereas
  recursion on the right produces right-associative assignments?
- Why is an identifier currently an lvalue, but `a + b` is not?
- Why must the assignment expression return the assigned value, and who owns
  the returned register?
- What is the difference between syntax checking, semantic checks, and
  assertions for internal compiler invariants?
- Why should tests include malformed declarations and expressions?

## Scope of this session

Comparison operators (`==`, `!=`, `<`, `<=`, `>`, `>=`) are **not** introduced
here. This worksheet focuses on assignments, associativity, lvalues, and
global/local variable declarations.

*HPC0 — Not A Bloody Compiler Project*
