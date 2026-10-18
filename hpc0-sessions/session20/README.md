# HPC0 — Session 20: Variables and Assignments

## Lecturer Notes

This session continues the *Not A Bloody Compiler Project*. The compiler
already has a frame-pointer-based calling convention, a symbol table, and
code-generator routines for function parameters, local variables, and return
values. The aim now is to connect these components: first by compiling `return`
statements and functions with parameters, then by adding access to variables in
generated code and expression trees.

**Teaching approach:** The worksheet is designed for hands-on work, with short
explanations, incremental modifications, and executable tests. Encourage
students to predict what each change should do before rebuilding and inspecting
the generated assembly.

## Preparation

Students should have completed the preceding compiler worksheets, particularly
the work on expression trees, recursive-descent parsing, the symbol table
(Session 9), and the calling convention/code generator (Session 19). They
should be able to build `not-abc` with `make` and use `ulmas` and `ulm` to
assemble and execute generated code.

The examples in this worksheet are intentionally small. The exit status **42**
provides a quick end-to-end check, but inspecting the generated assembly
remains important.

## Walkthrough

### Step 1 — Our First Return Statement

Start with `examples/ws20_return.not-abc`:

```abc
fn main()
{
    return 42;
}
```

Extend the grammar with `return-stmt`, implement `parseReturnStmt()`, and allow
it in `parseCompoundStmt()`. This step joins expression parsing, `loadExpr()`,
`genReturn()`, and register/expression cleanup. Rebuild and run:

```sh
./not-abc < examples/ws20_return.not-abc > foo.s
ulmas foo.s
ulm a.out
echo $?
```

The expected exit status is **42**. Ask students to find the store to the
return-value slot and the jump to the shared function epilogue in `foo.s`.

### Step 2 — Making Error Messages Useful

Use the invalid statement `return;` to motivate a shared `error()` function
that prints the current token's row and column. Unlike `expected(tokenKind)`,
it can report a missing *expression*. Have students replace the older
`fprintf(stderr, ...)` / `exit(1)` combinations where appropriate. The
pedagogical point is that useful diagnostics are part of a compiler, not an
optional afterthought.

### Step 3 — Functions with Parameters

Extend the function grammar to accept an optional comma-separated parameter
list. The parser calls `genFuncDefParam()` for each parameter; the symbol table
detects duplicate names.

The first `examples/ws20_diff.not-abc` intentionally returns a constant from
`diff(a, b)`. The parameters are registered but not yet read. This isolates
parameter parsing and call generation from variable access. The executable
should still return **42**.

### Step 4 — Loading and Storing Variables (Preparation)

Expand `xtest_gen_ex03.abc` to exercise global variables, parameters, locals,
address loading, memory loads, and memory stores. Before coding, ask students
to reconstruct the equivalent ABC program from the sequence of generator calls.
This reverses the usual direction of compilation and makes the purpose of each
API operation concrete.

Add declarations to `gen.hdr` for `genAddGlobal()`, `genLoadAddr()`, `genLoadVar()`, `genFetch()`, and `genStore()`. Students supply their own stubs in `gen.abc` and rebuild.

### Step 5 — Loading and Storing Variables (Implementation)

Implement the generator operations incrementally:

- `genAddGlobal()` registers a name and emits aligned storage in the BSS
  segment.
- `genLoadAddr()` obtains symbol information and emits either a global-label
  address or a frame-pointer-relative address. Parameter and local offsets come
  from the symbol table.
- `genFetch()` reads memory through an address register; `genStore()` writes to
  memory through one.
- `genLoadVar()` combines address loading with fetching a value.

The ULM ISA uses unsigned immediate operands for `addq` and `subq`, hence the
separate treatment of positive and negative offsets. Students should inspect
the assembly as well as verify exit status **42**.

**Register ownership is the central discussion point here.** `genLoadVar()`
releases the temporary address register before calling `genFetch()`, allowing
the allocator to reuse it. This works because releasing an allocation does not
itself overwrite the machine register. Discuss why the register must not be
overwritten before the generated fetch uses its address.

The worksheet's **Hunting Register Leaks** task should remain a genuine
exercise. In `xtest_gen_ex03.abc`, the result register is released, but
`genInstr(GEN_SUB, genLoadVar("x"), genLoadVar("r"))` leaves its two operand
registers allocated. Likewise, the registers returned by `genConstant()` when
passed to `genCallAddArg()` need to be released after use. Have students
identify these leaks and rewrite the test with explicit temporary registers and
matching `genReleaseReg()` calls. A small example may still produce the correct
exit status even when register bookkeeping is wrong; larger expressions can
exhaust the register pool.

### Step 6 — Adding Identifier Expressions

Introduce `EXPR_IDENTIFIER`, its constructor, and the relevant cases in
expression printing and `loadExpr()`. The test `xtest_expr_var.abc` checks that
an identifier node can be constructed, printed, compiled as a variable load,
and released. Point out that the `identifier` field already exists in the
`Expr` structure; this step connects existing representation to behavior.

Ask why `releaseExpr()` needs no additional case for identifiers: the existing
handling of primary-expression storage already covers this representation,
assuming the implementation from earlier sessions.

### Step 7 — Identifiers in Expressions

Finally, update `parseFactor()` so an identifier followed by `(` denotes a
function call, while a bare identifier denotes a variable reference. The parser
checks that the identifier is defined before creating an identifier-expression
node.

Now change `diff(a, b)` to `return a - b;`. The supplied arithmetic arguments
produce the expected exit status **42**, and—unlike addition—subtraction makes
the order of parameters observable. This is the first end-to-end test in the
session that actually reads function parameters.

## Discussion prompts

- Why do we need both a variable's **address** and its **value**?
- Why are local-variable offsets looked up in the symbol table rather than
  hard-coded in the parser?
- What is the difference between a syntactically valid identifier and a
  declared variable?
- Who is responsible for releasing registers returned by code-generator
  functions?
- Why can a program return the correct result while the generator still has
  register leaks?
- How does one token of lookahead distinguish a function call from a variable
  reference?

## Scope and next steps

Despite the broader worksheet title, this session **does not yet implement
parsing of local/global variable declarations or assignment statements** in the
source language. It prepares the code generator for those operations and
introduces *reading* variables in expressions. Keep this distinction explicit
when discussing the learning objectives or planning the next worksheet.

*HPC0 — Not A Bloody Compiler Project*
