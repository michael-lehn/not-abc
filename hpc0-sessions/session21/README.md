# Session 21 — Assignments

**Not A Bloody Compiler Project · HPC0**

This session extends our compiler with assignment expressions and declarations
of global and local variables. It also uncovers a register-preservation bug
across function calls and introduces caller-side register saving and restoring.
The session builds on the code generator from Sessions 19 and 20 and the
expression parser introduced in Session 13.

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
  declarations;
- explain why live registers must be preserved across function calls and
  implement caller-side saving and restoring on the stack.

## Preparation

Students should have completed Sessions 19 and 20. In particular, they should
be familiar with the calling convention and code-generator interface
(`genLoadAddr`, `genLoadVar`, `genStore`, `genReleaseReg`, `genAddGlobal`, and
`genAddLocal`). They should also revisit the `parseBinary()` and
`tokenKindPrec()` approach from Session 13.

No new lecture video is required for this worksheet; the relevant foundations
have already been introduced. For Steps 6 and 7, students should recall the
ULM stack pointer, function-call stack layout, and register allocation from
earlier sessions. Have the ULM debugger available.

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

The first complete source-level test in `examples/ws21_assign.not-abc` assigns
a function parameter and returns it. Its expected exit code is **42**.

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

Introduce a negative test: `global;` is incorrectly accepted by the initial
implementation, despite the grammar requiring at least one identifier. Students
insert `expected(IDENTIFIER);` at the appropriate places in both declaration
parsers. They should also reject `global x,;` and `local a,;` — checking only
immediately after `global` or `local` is insufficient; the check is also needed
after a comma.

This makes a useful discussion: testing a parser means checking that it
**rejects invalid programs**, not merely that it accepts valid ones.

### Step 6 — What’s wrong?

The new `examples/ws21_registers.not-abc` test assigns the result of `getchar()`
to a local variable `ch`, echoes it with `putchar(ch)`, and returns `ch`.
Students should compile and execute the program **before** receiving the fix.
Encourage them to use the ULM debugger to follow the generated assembly.

The important observation is that code generation loads the address of `ch`
into a register (typically `%4`) *before* generating the call to `getchar()`.
The callee may overwrite that register. When the caller resumes, the address
needed for the assignment has been lost, so the store may target the wrong
location. This is a calling-convention bug, not a parsing bug.

Let students describe what they see in the debugger. Avoid immediately
explaining `saveRegs()` or `restoreRegs()`; that diagnosis belongs to Step 7.

### Step 7 — Function Calls: Saving and Restoring Registers

Introduce the simplified calling convention: registers from `%4` onward are
callee-clobbered, so the caller must preserve any live values across a call.
The worksheet supplies `savedReg`, `numSavedReg`, `saveRegs()`, and
`restoreRegs()`; students wire the helpers into `genCallBegin()` and
`genCallEnd()` at the specified points.

The intended order is important:

1. Before preparing the call frame, emit instructions to save currently used
   registers onto the stack.
2. Prepare arguments and call the function; retrieve its return value into a
   newly allocated register before restoring the caller's registers.
3. Remove the call frame, restore the saved registers, and return the register
   containing the call result.

In the supplied implementation, `savedReg` records the register-usage snapshot
from the time of `saveRegs()`, while `numSavedReg` determines the space used on
the stack. The emitted assembly saves and restores register contents; the
arrays themselves belong to the *compiler*, not to the generated program.

**Test:** Rebuild and rerun `examples/ws21_registers.not-abc`. With input `A`,
the program should echo `A`; its return value is the character code (65 for
ASCII `A`). This checks both the assignment and the subsequent use of `ch`.

**Stack drawing:** Ask students to sketch the stack with `%4` live immediately
before the call and after returning. Have them identify the saved `%4`, the
call frame and return-value slot, and the changes to `%1`. The drawing should
show how `%4` is restored while the return value remains in a separate
register.

**Neighbor discussion:** Why can't `restoreRegs()` consult `usedReg` directly?
`genCallEnd()` allocates a register for the return value in the meantime, so
`usedReg` no longer represents the set of registers saved before the call.
`savedReg` is the snapshot of that earlier set.

**Implementation boundaries:** This teaching implementation assumes the
save/restore bookkeeping is not itself nested; one global snapshot cannot
represent multiple outstanding save operations. It also assumes a free
register is available for the call result. These limitations are worth knowing
but need not become additional worksheet tasks.

## Suggested classroom discussion

- Why does a `while` loop naturally construct left-associative trees, whereas
  recursion on the right produces right-associative assignments?
- Why is an identifier currently an lvalue, but `a + b` is not?
- Why must the assignment expression return the assigned value, and who owns
  the returned register?
- What is the difference between syntax checking, semantic checks, and
  assertions for internal compiler invariants?
- Why should tests include malformed declarations and expressions?
- Why can a program compile successfully but still fail because of a calling
  convention violation?
- Why is the set of live registers at call entry different from the set of
  allocated registers when `genCallEnd()` restores them?

*HPC0 — Not A Bloody Compiler Project*
