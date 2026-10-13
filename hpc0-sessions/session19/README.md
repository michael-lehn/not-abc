# HPC0 — Session 19: Calling Conventions (Part II) + Code Generator

This session continues the bottom-up part of HPC0. We revisit the ULM calling
convention from Worksheet 14, introduce a frame pointer, make room for local
variables, and extend the code generator to maintain stack offsets using the
symbol table.

## Worksheet

- [Session 19 worksheet](hpc0-session19-en.pdf)

The worksheet is intended to be worked through in order. Students first write
and run ULM assembly by hand, then translate what they have learned into
changes to the compiler's code generator.

## Lecturer Notes

### The main idea: from manual assembly to code generation

The central connection in this session is between the stack layouts students
have already constructed by hand and the information that a compiler must
maintain to generate the same code automatically. Do not rush straight to
`gen.abc`: the manual assembly exercises are what make the later implementation
understandable.

### Revisiting the calling convention

Start by distinguishing **arguments** (values provided by the caller) from
**parameters** (variables used by the callee). Draw the stack before and after
a call to `sum(12, 30)`.

The key motivation for a frame pointer is not that it points somewhere
different at function entry. Initially `%1` and `%2` have the same value. The
advantage is that `%2` remains fixed even when `%1` changes during execution.
Both the caller and callee can then use the same numerical offsets, relative to
different registers.

With the new layout, the return address and old frame pointer occupy offsets 0
and 8, the return-value slot is at 16, and parameters start at 24. Local
variables will occupy negative offsets relative to `%2`.

### Step 1 — Putting it all together again

Students implement `sum` and `main` in ULM assembly using the new prologue and
epilogue. Ask them to identify which responsibilities belong to the caller and
which belong to the callee. The caller reserves the call frame; the callee
saves the return address and old frame pointer and establishes the new frame
pointer.

The prologue and epilogue should look the same for `sum` and `main`, regardless
of the number of parameters. Verify the result by assembling and running the
program: the expected exit code is **42**.

### Step 2 — Local variables and forward references

The artificial local variable `r` makes the stack-frame layout concrete. Its
offset is `-8(%2)`; parameters remain at positive offsets. The extra store and
load are intentionally not optimized away. The goal is a simple, systematic
method for generating correct code, not efficient assembly.

The `.equ .loc0, 8` trick deserves attention. When generating the function
prologue, the compiler does not yet know how many local variables will appear.
It can emit `subq .loc0, %1, %1` immediately and define `.loc0` only after the
function body has been processed. Emphasize the difference between a symbol
used in assembly and the value assigned to it later.

Again, the expected exit code is **42**, both before and after replacing the
literal stack size with `.loc0`.

### Step 3 — Bringing back the symbol table

This is an intentional return to a module from Session 9. Students add
`genFuncDefParam` and `genAddLocal` to the public code-generator interface and
start with stub implementations. They then build `xtest_gen_locals` and inspect
its output.

At this point the old prologue and epilogue are still generated and the symbol
table contains no entries. That is expected: the step establishes the interface
and a test before implementing the new behavior.

### Step 4 — A quick & dirty implementation

The worksheet deliberately provides a simple implementation using internal
global state: `fnDefCount`, `paramOffset`, `localVarOffset`, and `inFnDef`.

This is not presented as an ideal long-term design. It keeps the moving parts
visible while students connect the assembly patterns to code generation.
`fnDefCount` selects `.loc0`, `.loc1`, etc.; the two offsets track the next
parameter and local-variable slot; `inFnDef` guards the beginning and end of
function definitions.

At function end, the code generator emits the `.equ` directive, clears local
symbols, and resets its offsets for the next function. An easy-to-miss
practical detail is that `gen.abc` now needs the appropriate symbol-table
header. The build is a useful check that students have noticed the new
dependency rather than copied the code mechanically.

### Step 5 — Offsets in the symbol table

The implementations of `genFuncDefParam` and `genAddLocal` are supplied. The
learning task is to recognize that they store exactly the offsets previously
assigned by hand: `a` at 24, `b` at 32, and local `r` at -8.

Run `xtest_gen_locals` and inspect the generated assembly and printed
symbol-table entries. The final `.equ .loc0, 8` should agree with the one
eight-byte local variable. The printed symbol-table lines are diagnostic output
in this test, not valid assembly instructions.

### Teaching emphasis and what comes next

Global-variable support is intentionally deferred. At this point, completing
the mechanism for parameters and local variables is a useful stopping point.

As the compiler grows, students should repeatedly revisit existing modules
rather than stay in one file until everything is finished. Encourage a
practical rhythm: find the relevant module, understand enough of it for the
current task, make a focused change, build and test, and move on. Navigating a
growing codebase is itself a learning objective.

The boxing analogy at the end of the worksheet is deliberate: **get in, do your
job, and get out** — and become faster with practice.

## License

*HPC0 — Not A Bloody Compiler Project*
