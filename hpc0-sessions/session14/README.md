# Session 14 — Calling Conventions (Part I) + Code Generator

## Preparation

Students **can and should read the worksheet before the session**. In
particular, they should watch the following lecture video beforehand:

- [Assembly Recipes for Coders: Using the Stack for Function Calls](https://www.youtube.com/watch?v=x_9Bt1LAYN8)

The video provides the background for the stack-based function-call patterns
used throughout the worksheet. Students should also have their `not-abc`
project from the previous sessions and the code generator from Session 10
available. The worksheet explains how to copy the code generator into `not-abc`
and, if necessary, reinstall the tools for `hpc0.isa`.

## Lecturer Notes

### Teaching approach

This session connects two strands of HPC0: the **bottom-up** understanding of
assembly and the stack, and the **top-down** development of a compiler.
Students first write assembly by hand, agree on a simple calling convention,
and only then encode the recurring patterns in their code generator.

The worksheet deliberately uses a simple convention: every value occupies eight
bytes, and every function call reserves a return-value slot, even when the
function does not return a value. The convention is designed for clarity rather
than efficiency or compatibility with a production ABI.

### Steps 1–3: Develop the calling convention by hand

- **Step 1 — From Instructions to Functions:** Replace direct `putc`
  instructions with calls to `putchar`. Use the stack diagrams to distinguish
  what the caller prepares from what the callee sees after its prologue.
- **Step 2 — Returning Values from Functions:** Add `getchar` and a
  return-value slot. Emphasize the reversal of responsibility: for arguments
  the caller writes and the callee reads; for return values the callee writes
  and the caller reads.
- **Step 3 — Putting It All Together:** Implement `sum(12, 30)` in assembly and
  verify the exit status **42**. This establishes the unified stack layout that
  the code generator will use. In particular, argument offsets differ before
  and after the callee's prologue. The worksheet deliberately postpones
  improving this pattern.

Allow students to reason through the diagrams before explaining the offsets. It
is more valuable that they can reconstruct the layout than memorize a
particular number.

### Steps 4–5: Transfer the patterns to the code generator

**Step 4** integrates the code generator from Session 10 into `not-abc`,
extends `genInit()` with startup and simple I/O routines, and removes the
obsolete `genExit()` interface. This is also a small lesson about how interface
changes affect dependent code. Students then introduce function-definition and
function-call APIs as stubs containing assertions.

**Step 5** implements those stubs incrementally. The first assertion identifies
the next missing piece; after implementing it, students compile and run again
to encounter the next one. The sequence is intentional: `genFuncDefBegin()`,
`genCallBegin()`, `genCallEnd()` for `getchar`, `genCallAddArg()` for
`putchar`, and finally `genFuncDefEnd()`.

Points worth emphasizing:

- Code-emitting functions call `setSegment(TEXT)` before producing text-segment
  instructions.
- The actual `call` instruction is emitted by `genCallEnd()`, not
  `genCallBegin()`.
- `CallInfo` stores the function name and argument count between these
  operations.
- For `numArgs` arguments, argument position `argPos` is placed at offset `8 *
  (numArgs - argPos)` relative to the caller's stack pointer. For two
  arguments, positions 0 and 1 are at `16(%1)` and `8(%1)`.
- The test is not finished merely because the generator runs: redirect its
  output to assembly, assemble it with `ulmas`, and execute it with `ulm`.

### Step 6: An unsupported feature should fail visibly

The final step is deliberately about **error detection, not feature
completion**. The new test attempts to generate `putchar(getchar())`. Because
the current implementation has only one global `CallInfo`, the inner
`genCallBegin()` overwrites information about the outer call. Initially, the
generator silently emits incorrect assembly: two calls to `getchar` and none to
`putchar`.

Students then add an assertion to `genCallBegin()` and clear `callInfo.fnName`
in `genCallEnd()`. The original test should continue to work, while the
nested-call test should now fail with an assertion.

The key lesson is that **an explicit failure is preferable to silently
generated incorrect code**. Supporting nested calls will require a more capable
representation of pending calls; that is left for a later session.

## Expected Outcome

By the end of the session, students should be able to explain caller and callee
responsibilities, draw the relevant stack layouts, generate and execute
assembly for simple function calls, and recognize why a compiler must detect
unsupported constructs instead of silently miscompiling them.

The worksheet intentionally leaves open both a better approach to stack-frame
addressing and support for nested function calls. These are natural starting
points for subsequent sessions.
