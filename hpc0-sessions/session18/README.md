# Session 18 — From Expressions to Programs

**Not A Bloody Compiler Project — HPC0**

[Worksheet 18](hpc0-session18-en.pdf)

## Overview

This session marks an important milestone: students turn the components
developed in previous sessions into a compiler that can translate complete
*not-abc* programs into executable ULM assembly code.

The language is still deliberately small. Programs consist of parameterless
function definitions whose bodies contain expression statements. Nevertheless,
the final examples can call functions, perform arithmetic, and produce visible
output.

## Learning objectives

Students learn to:

- Extend a grammar incrementally, from end-of-input to complete programs with
  function definitions and expression statements.
- Implement a recursive-descent parser for the program-level grammar.
- Reuse the existing expression parser and code generator rather than
  duplicating them.
- Distinguish parsing into expression trees from parsing with immediate code
  generation.
- Use `stdin`, `stdout`, and `stderr` appropriately in a compiler workflow.
- Extend the expression grammar to support character literals already
  recognized by the lexer.

## Preparation and dependencies

Students should have completed the earlier compiler worksheets, especially the
lexer (Session 11), expression parsing (Session 13), function calling
conventions and code generation (Session 14), build system (Session 15), and
expression code generation (Session 17).

The existing expression parser is named `parseexpr.abc` / `parseexpr.hdr`. The
new `parser.abc` / `parser.hdr` handles function definitions and statements.
The `expected()` helper from Session 17 is reused by the new parser.

The Makefile should build `not-abc` from `not-abc.abc` and the compiler
modules. The Neovim course configuration should recognize the `.not-abc`
extension.

## Teaching notes

### Step 1 — Our First not-abc Program

Begin with two examples: an empty `main()` and a `main()` that calls
`putchar(65)` and `putchar(10)`. The first is a minimal parsing target; the
second provides a visible result once expression statements work.

Have students inspect the tokens with `xtest_lexer`. This is a good moment to
remind them that the lexer already recognizes the keyword `fn` and the required
punctuators. Work from previous worksheets is now being reused rather than
rewritten.

### Step 2 — Setting Up Our Parser

Introduce the target grammar, but resist implementing it all at once. Students
create `not-abc.abc`, `parser.hdr`, and a deliberately nonfunctional
`parseTopLevel()` stub.

The executable already emits startup assembly through `genInit()`. Because
`parseTopLevel()` returns `false`, it also reports an error. Demonstrate how
redirecting `stdout` to a file leaves the diagnostic on `stderr` visible in the
terminal. This is the first point in the course where the distinction serves an
immediate practical purpose.

### Step 3 — Our First Grammar Rule

Start with `top-level = EOI`. The implementation is almost trivial, but it
establishes the contract of `parseTopLevel()`: it returns whether the input
satisfies the grammar. Use `echo "" | ./not-abc`, `/dev/null`, and `echo $?` to
practice shell workflows and exit status checking.

The generated assembly is not yet a complete executable program: startup code
refers to `main`, but an empty source file defines no such function. This
motivates the next extension.

### Step 4 — Parsing Function Definitions

Extend the grammar to allow zero or more function definitions with empty
bodies. Supply `parseCompoundStmt()` and leave `parseFn()` and the repetition
in `parseTopLevel()` for students to implement.

Emphasize the distinction between returning `false` because a grammar rule does
not start at the current token and reporting an error once the parser has
committed to a rule but encounters a missing required token. Encourage students
to work independently; the next step supplies a possible implementation.

### Step 5 — From Parsing to Code Generation

Present a reference implementation for comparison, not as a mandatory
replacement for working student code. Discuss the `while (parseFn())` loop,
`expected()`, error reporting, and the need to include headers for `fprintf()`
and `exit()`.

Students then add `genFuncDefBegin()` and `genFuncDefEnd()` at the indicated
locations. Pay attention to when `token.val` holds the function name: it must
be passed to `genFuncDefBegin()` before advancing the lexer. The empty `main()`
can now be assembled and executed.

### Step 6 — Putting It All Together

Add `parseExprStmt()` and extend `parseCompoundStmt()` to recognize a sequence
of expression statements. Ask students to arrange parsing functions and forward
declarations in grammar order.

This is the central architectural lesson of the worksheet:

- `parser.abc` parses functions and statements **and generates code
  immediately**.
- `parseexpr.abc` parses expressions into trees; `loadExpr()` subsequently
  generates code from those trees.

The two approaches coexist in one compiler. Students should trace how
`parseExpr()`, `loadExpr()`, `genReleaseReg()`, and `releaseExpr()` fit
together. The second example should now print `A` and a newline.

### Step 7 — Character Literals: Almost for Free

Let students first compile the third example and encounter the diagnostic
`3.13: 'RPAREN' expected`. Ask them to identify which token is actually present
and why the expression parser stops there. The diagnostic is technically useful
but not yet very friendly.

The lexer already recognizes character literals. Extend the `factor` rule and
the relevant condition in `parseFactor()` so that character literals are
handled like decimal literals. The example with `foo()` calling `bar()` should
print `foobar` followed by an additional newline.

**Implementation check:** This one-line parser change depends on the existing
literal-to-assembly path correctly handling character-literal spellings,
including the escape `\n`. Verify that behavior in the course compiler before
teaching this as an entirely parser-only change.

End by committing and pushing the new compiler files and examples.

## Suggested checks and discussion

- Does the lexer distinguish `FN` from `IDENTIFIER`?
- Why does the parser initially accept empty input but produce assembly with an
  undefined `main`?
- What is the difference between `return false` and `expected(...)` followed by
  an error?
- Why must the function name be used before the next `getToken()`?
- Why is it useful to send assembly to `stdout` and diagnostics to `stderr`?
- Which parser builds trees, and which parser generates code directly?
- Why does adding a character literal require so little new parser code?

## Scope and limitations

This session deliberately avoids variables, parameters, local declarations,
control structures, and general return statements. Those features will be
introduced incrementally in later sessions. The goal here is not a full
language but a complete and understandable compilation path from source file to
running ULM program.

---

*HPC0 — Not A Bloody Compiler Project*
