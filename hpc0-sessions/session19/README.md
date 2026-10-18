# HPC0 — Session 19: Calling Conventions (Part II) + Code Generator

This session continues the bottom-up part of HPC0. Students revisit the calling convention introduced in Session 14, introduce a **frame pointer**, make room for **local variables**, and update the code generator to use the new stack layout. The session ends by reconnecting the code generator to the symbol table from Session 9 and preparing support for `return` statements in Session 20.

## Worksheet

- [Session 19 worksheet](hpc0-session19-en.pdf)

The worksheet is designed to be worked through in order: first write and execute ULM assembly by hand, then implement the same conventions in `gen.abc`. The hand-written assembly is not a detour; it provides the concrete reference against which the generated assembly can be checked.

## Lecturer Notes

### The central idea: a stable frame pointer

Begin by revisiting the calling convention from Worksheet 14, using `diff(72, 30)`. Distinguish **arguments**, the values supplied by the caller, from **parameters**, the names used by the callee. Unlike addition, subtraction is not commutative: exchanging the two arguments changes the result. `diff` is therefore a better test of argument order than `sum`.

In the old convention, the callee pushed the return address, changing the offsets at which it accessed parameters. In the new convention, the **caller reserves the entire call frame**, including slots for the return address, saved frame pointer, return value, and arguments. The **callee stores the return address and previous frame pointer** in those slots and sets `%2` to the current `%1`.

The essential distinction is that `%1` is the **stack pointer** and may move, while `%2` is the **frame pointer** and stays fixed during the function body. The caller uses offsets relative to `%1`; the callee uses the *same numerical offsets* relative to `%2`:

| Slot | Caller (relative to `%1`) | Callee (relative to `%2`) |
| --- | --- | --- |
| Return address | `0(%1)` | `0(%2)` |
| Saved frame pointer | `8(%1)` | `8(%2)` |
| Return value | `16(%1)` | `16(%2)` |
| First argument / parameter | `24(%1)` | `24(%2)` |
| Second argument / parameter | `32(%1)` | `32(%2)` |

For `n` arguments, the caller reserves `8 * (n + 3)` bytes. Argument or parameter `k` has offset `8 * (k + 3)`; local variable `k` has offset `-8 * (k + 1)` relative to `%2`. The diagrams and tables in *Our Calling Convention at a Glance* (page 6) are the reference for the later code-generator tasks.

### Step 1 — Putting It All Together (Again!)

Students implement `diff` and `main` directly in ULM assembly using the new convention. The startup code calls `main`; `main` calls `diff(72, 30)`; `diff` returns `a - b`. The expected exit status is **42**.

Focus discussion on the division of responsibilities:

- The caller reserves space and places arguments at `24(%1)` and `32(%1)`.
- The callee saves `%3` and the previous `%2`, then establishes `%2` as the frame pointer.
- The callee accesses parameters at `24(%2)` and `32(%2)` and writes the result to `16(%2)`.
- The epilogue restores `%1` from `%2`, then restores the previous frame pointer and return address.

The startup code does not initialize `%2`. This is intentional: it never reads the frame pointer; `main` saves its previous value but does not depend on what that value is.

Point out that the hand-written functions fall through directly into their epilogues. A general code generator cannot rely on this: a `return` statement may occur anywhere in a function. It must store a register value at `16(%2)` and jump to a shared `.leave...` label. This foreshadows `genReturn()` in Step 4.

### Step 2 — Making Room for Local Variables

Students extend `diff` with `local r: u64`, assign `r = a - b`, and return `r`. This is still a hand-written assembly exercise; the parser does **not** yet support this program.

The callee allocates eight bytes with `subq 8, %1, %1` and accesses `r` at `-8(%2)`. Its parameter offsets remain unchanged. The generated-looking sequence deliberately stores the result to memory and then reloads it. Although redundant, these operations demonstrate a simple, systematic implementation rather than an optimizing one. The function now also explicitly jumps to `.leave.diff` before the epilogue. The expected exit status remains **42**.

The second task introduces a useful single-pass code-generation trick:

```asm
subq .loc0, %1, %1
...
.equ .loc0, 8
```

The prologue is emitted before the compiler knows how many local variables will be declared. The assembler resolves the forward reference when `.loc0` is defined after the function body. Each generated function will need its own `.locID` symbol. The shared `.leaveID` label provides the corresponding return target.

Before proceeding, use the summary on pages 6–7 to connect the stack diagrams, the offset formulas, and the standard prologue/epilogue.

### Step 3 — Updating Our Code Generator: Function Calls

This step intentionally begins with a **working regression test**: `xtest_gen_01.abc` generates a program that reads a character using `getchar` and echoes it using `putchar`.

Have students first build and run the original version:

```sh
make
./xtest_gen_01 > foo.s
ulmas -o foo foo.s
ulm foo
```

They should also inspect `foo.s` with `cat foo.s`. As they update individual generator functions, the test will temporarily stop working because the caller, callee, and built-in functions no longer agree about the calling convention. This is expected and is worth observing, not hiding. Encourage students to rebuild, regenerate, inspect, and run after each change.

**Task 1: Callee-side generation.** Update `genFuncDefBegin()` and `genFuncDefEnd()`. The generator tracks `fnDefCount`, `paramCount`, `localVarCount`, and `inFnDef`. The latter, together with assertions, enforces a simple state transition between being inside and outside a function definition. `fnDefCount` gives each function matching, unique `.locID` and `.leaveID` labels. `localVarCount` determines the eventual `.equ .locID, 8 * localVarCount` directive. At this stage, functions with no local variables produce a zero-byte allocation.

**Task 2: Caller-side generation.** Update `genCallBegin()`, `genCallAddArg()`, and `genCallEnd()`. Compare each implementation directly with the page-6 formulas. The caller reserves `8 * (numArgs + 3)` bytes, places argument `argPos` at `8 * (argPos + 3)(%1)`, reads the return value from `16(%1)`, and releases the call frame. In particular, the argument offset no longer depends on the total argument count: arguments are now stored in their natural order.

**Task 3: Built-in functions.** Finally update `genInit()`, which emits startup code and the built-in `putchar` and `getchar` functions. These built-ins now use `genFuncDefBegin()` and `genFuncDefEnd()` for their prologues and epilogues, while a few instructions are still emitted directly with `printf()` as a deliberate shortcut. `putchar` reads its argument from `24(%2)`; `getchar` writes its result to `16(%2)`. The startup code uses the register returned by `genCallEnd()` rather than assuming a fixed return register. Once all three tasks are complete, the character-echo test should work again.

An important teaching point is that the built-ins and user-generated functions now share the same function-definition machinery. Their `.locID` and `.leaveID` labels are allocated from the same counter.

### Step 4 — Preparing for Variables and Return Statements

This step is a bridge to Worksheet 20, not yet a complete parser implementation. Add the public declarations `genFuncDefParam()`, `genAddLocal()`, and `genReturn()` to `gen.hdr`, and include `symtab.hdr` in `gen.abc`.

The test `xtest_gen_ex3.abc` manually generates a function `diff` with parameters `a` and `b`, one local variable `r`, and a return of the constant `42`. This deliberately brings back the **symbol table from Worksheet 9**. The new functions translate the callee offset formulas into calls to `symtabAddLocal()`:

| Name | Role | Offset relative to `%2` |
| --- | --- | --- |
| `a` | First parameter | `24` |
| `b` | Second parameter | `32` |
| `r` | First local variable | `-8` |

`genReturn(val)` stores the given register at `16(%2)` and emits a jump to the current `.leaveID` epilogue. At the end of a function, `genFuncDefEnd()` must call `symtabFreeLocals()` so parameters and locals do not leak into the symbol table for the next function. The final `.equ` value for the test function is eight bytes, matching its single local variable.

**Do not expect this test to produce a complete executable program.** It does not call `genInit()` or generate a `main` function in the output assembly. Instead, inspect the offsets printed by `symtabPrintLocals()` and check the emitted return-value store and jump by eye—the worksheet's “good old eyeball test.” The generated program will be made executable in Worksheet 20.

### Teaching emphasis and what comes next

The progression is deliberate: **understand the stack layout → implement it by hand → express it as formulas → teach the code generator those formulas → reconnect the symbol table**. Reusing earlier modules is part of the lesson, not an inconvenience.

Worksheet 20 will build on this work by extending the parser to handle variables in expressions and `return` statements. At the end of Session 19, students have prepared the code-generator mechanisms and tested their bookkeeping, but they have not yet completed that parser integration.

## License

*HPC0 — Not A Bloody Compiler Project*
