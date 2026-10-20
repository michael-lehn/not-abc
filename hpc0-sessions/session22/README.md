# HPC0 — Session 22: Control Structures

This session brings together the bottom-up work on ULM assembly and the
top-down work on our compiler. Students revisit the control-flow
transformations from Session 3, extend the code generator with labels and
jumps, add `if`/`else` and `while` statements to the parser, and finally
implement comparison operators throughout the compiler.

## Worksheet

- [Session 22 worksheet](hpc0-session22-en.pdf)

Work through the worksheet in order. The progression is deliberate: **control
flow with `goto` → generated jumps and labels → structured statements →
comparisons as expressions → parser integration**. The examples are written in
ABC and not-abc, and the generated ULM assembly is assembled and executed with
the existing course tools.

## Lecturer Notes

### Review — Back to Session 3: Control Flow with Jumps (page 1)

Begin with `xtest_review_ws03_if.abc` and `xtest_review_ws03_if_goto.abc`. Both
express the same `if`/`else` behavior; the second makes the control flow
explicit with a conditional jump to `elseLabel`, an unconditional jump to
`doneLabel`, and two label definitions. Ask students to trace both possible
paths and predict the final value of `x`.

This is not a new concept introduced out of nowhere: the course returns to an
idea from almost twenty sessions earlier, now with the machinery to generate
its assembly implementation.

### Step 1 — From Goto to Code Generation (page 2)

Students create `xtest_gen_05.abc`, which directly calls the code generator to
emit a program equivalent to the earlier `if`/`else` example. Give them time to
inspect the test *before* implementing the missing functions.

Discussion prompts from the worksheet:

- Why are both `elseLabel` and `doneLabel` needed?
- What would happen without `genJump(doneLabel)` at the end of the first
  branch?
- Why does `genJumpIfFalse(xVal, elseLabel)` jump when `xVal` is zero?
- Why is `genReleaseReg(xVal)` safe immediately after emitting the conditional
  jump?

The final question reinforces the distinction between **emitting instructions
at compile time** and **executing them later**. Releasing a generator register
does not erase the value used by an already emitted instruction.

### Step 2 — Extending the Code Generator Interface (page 3)

Students add `GenLabel`, `genGetLabel()`, `genDefLabel()`, `genJump()`, and
`genJumpIfFalse()` to `gen.hdr`, with assertion stubs in `gen.abc`. The
interface is intentionally minimal: do not introduce `genJumpIfTrue()` just
because it might be useful someday. Each operation has a concrete use in the
current test.

### Step 3 — Implementing Jumps and Labels: Assertion Chasing (page 3)

Run `xtest_gen_05` and follow its assertions in sequence:

1. `genGetLabel()` allocates unique numeric IDs from a global `labelCount`. The
   postfix increment intentionally makes the first ID **0**.
2. `genJumpIfFalse()` emits a subtraction into `%0` to update the ULM status
   flags without keeping the result, followed by `jz .LID`.
3. `genJump()` emits an unconditional `jmp .LID`.
4. `genDefLabel()` emits the matching `.LID:` definition in the text segment.

The `.L0`, `.L1`, ... naming convention should be visible in the generated
assembly. Emphasize that the labels are **generated symbols**, not names taken
from the source program.

After implementing the functions, regenerate, assemble, and execute the
program. With `x = 42`, the `then` branch sets `x` to **0**, so the exit code
is **0**. Changing the initial assignment to `x = 0` selects the `else` branch,
yielding exit code **1**.

`genInit()` is intended to be called once per generated program; enforcing that
invariant with a static guard is possible but not part of this exercise.

### Step 4 — Adding If Statements to Our Compiler (pages 4–5)

The target is `examples/ws22_if.not-abc`. The grammar adds an `if-stmt` with an
optional `else` branch; the latter may itself be another `if-stmt`, permitting
`else if` chains.

The worksheet **provides** `parseIfStmt()` but deliberately leaves its
integration to the students. They must identify the required forward
declaration and update the appropriate compound-statement parsing logic. This
is a good opportunity to ask how the parser recognizes which statement form
comes next.

Walk through the generated control flow: evaluate the condition, jump to the
`else` label if false, emit the `then` body, jump over the optional `else`
body, then define the final label. The code still works when there is no `else`
branch, although the unconditional jump and labels are not optimized away.

Students should compile and execute the example, then design their **own** test
with an `if` statement lacking an `else` branch. Avoid supplying that test
immediately; choosing a discriminating condition and observable return value is
part of the task.

**Demonstration, not an additional task:** `examples/ws22_printInt.not-abc`
already prints `1234`, `1`, and `0` using recursion, arithmetic, `putchar`, and
nested `if` statements—without `printf`. Comparison operators are still on the
TODO list at this point.

### Step 5 — Adding While Loops to Our Compiler (page 6)

The grammar now includes `while-stmt`, and the worksheet provides the complete
`parseWhileStmt()` implementation. As with `parseIfStmt()`, students must
integrate it into the parser themselves.

The critical distinction from `if` is the placement of `condLabel`: the
condition's **generated code** must appear at the top of the loop, so execution
returns to it on every iteration. `doneLabel` is the exit target when the
condition evaluates to zero. Ask students to trace the generated sequence, not
just the parser source.

Build and run `examples/ws22_readint.not-abc`. It reads characters until a
newline, converts decimal digits into an integer, and prints the result using
`printInt`. Try `0` and several multi-digit nonnegative numbers. This first
version uses `while (ch - '\n')` because comparison operators have not yet been
implemented.

The worksheet's `parseWhileStmt()` uses the specific diagnostic `compound for
while body expected`; it is worth pointing out how parser error messages become
more useful as new statement forms are added.

### Step 6 — Generating Code for Comparison Operators (pages 6–7)

Introduce comparisons as **expressions producing integer values**: `a > b`
evaluates to `1` when true and `0` otherwise. Reconnect this to Session 3 by
showing the conceptual `goto trueLabel` / assign `0` / `goto doneLabel` /
assign `1` pattern.

Students extend `GenInstr` with `GEN_EQ`, `GEN_NE`, `GEN_LT`, `GEN_LE`,
`GEN_GT`, and `GEN_GE`. The helper `condInstr()` maps these cases to ULM
conditional jumps (`jz`, `jnz`, `jlt`, `jle`, `jgt`, `jge`). The new
`genInstr()` cases subtract the operands to set flags, then generate the two
possible integer results.

The provided code is an **excerpt to integrate**, not a complete replacement
for `genInstr()`. In particular, students must understand where `dest` comes
from in the existing implementation. They should also check operand order
against the ULM `subq` convention: the worksheet emits `subq right, left,
dest` so the flags correspond to `left - right`.

Create `xtest_gen_06.abc`, generate assembly, assemble, and execute it. The
initial `GEN_GT` test for `2 > 1` should return exit code **1**. Then exercise
all six operators with left operands smaller than, equal to, and greater than
right operands. For additional confidence, include negative values where
supported by the existing test setup. Testing only `2 > 1` would not detect
several plausible mistakes.

### Step 7 — Adding Comparison Operators to Expression Trees (page 8)

Add six new `ExprKind` cases to the binary group. Modify the existing
`xtest_expr_gen.abc` to construct the expression `20 < 22`, print its tree as
an assembly comment, and generate its code.

Initially an assertion is expected. Students update two places in `expr.abc`:

- `printExprTree()` must print the six operators in braces (`{<}`, `{<=}`,
  `{==}`, etc.), preserving the formatting required by the later LaTeX tree
  visualization.
- `loadExpr()` maps each new expression kind to its corresponding `GenInstr`
  operation.

Run the test again and inspect both the comment and the assembly. Then vary the
test to cover **all six** new expression kinds. The worksheet deliberately does
**not** ask for `make tree.tex` yet: the parser has not been extended at this
point. The returned generator register is released with
`genReleaseReg(loadExpr(expr))`.

The short review at the end of page 8 recalls Worksheet 13: `parseBinary()` was
designed so that adding **left-associative** binary operators mostly requires
updating two helper functions. Contrast this with the **right-associative**
assignment operator from Worksheet 21, which needed its own parsing rule.

### Step 8 — Adding Comparison Operators to the Parser (pages 9–10)

Students extend `exprKindFromToken()` to map tokens to the new `ExprKind` cases
and `tokenKindPrec()` to assign precedence:

| Operators | Precedence |
| --- | ---: |
| `*`, `/`, `%` | 13 |
| `+`, `-` | 12 |
| `<`, `<=`, `>`, `>=` | 10 |
| `==`, `!=` | 9 |

The lower number means lower binding strength. Comparisons are left-associative
in this parser; the expression `1 < 2 <= 3 > 4 >= 5 != 6 == 1` is intentionally
a useful tree-structure test, **not** a chain of mathematical inequalities.
Have students use `make tree.tex` to inspect the generated tree, then try
combinations with arithmetic operators.

Finally, update `examples/ws22_readint.not-abc` to use `if (n == 0)`, `if (n /
10 > 0)`, and `while (ch != '\n')`. Compile and run with several nonnegative
inputs, including zero. The program is deliberately not a full numeric-input
parser: it assumes decimal digits and does not handle a leading minus sign.

### What's Next? (page 10)

End with the tempting expression:

```c
if (ch >= '0' && ch <= '9') {
    // ...
}
```

Why not simply treat `&&` and `||` as ordinary eager binary operators? Their
**short-circuit evaluation** makes them different: the right operand may not be
evaluated at all. This sets up a later session without prematurely introducing
a new implementation.

### Teaching emphasis

This worksheet is a good demonstration of the course's two complementary
directions: bottom-up from flags and jumps, and top-down from grammar rules and
expression trees. Encourage students to inspect the **generated assembly**,
predict **exit codes**, and explain **control-flow paths** to each other. The
provided code blocks are scaffolding, not an instruction to stop reasoning
about their integration.

*HPC0 — Not A Bloody Compiler Project*
