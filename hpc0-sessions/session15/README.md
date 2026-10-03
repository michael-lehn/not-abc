# Session 15 -- A Bloody Compiler Project: Build System & Pimpin' the Grammar

In this session, the compiler project starts to feel like a larger
software project. We first put the existing compiler sources under
version control, introduce a small build system, and then use that
infrastructure while extending the language.

## Preparation

Before the session, students should have watched:

-   [A Bloody Compiler Project (Part 2): Parser and Code
    Generator](https://www.youtube.com/watch?v=t8V7_O7R0PY&t=5s)
-   [More on Translation Units](https://youtu.be/Z6AxGWIQLWk)

Students should also take a quick look at the worksheet before class.

The videos provide the background we will build on in this session. In
particular, *More on Translation Units* prepares the ground for the
build-system part: students should already have an idea of source files,
translation units, object files, and linking. The goal here is not to
introduce these concepts through `make`, but to let `make` automate a
process they already understand.

## Lecturer Notes

### Step 1 -- Putting Our Compiler Project under Version Control

This is the first time Git is introduced formally in the course.

The scope is deliberately small. Students should understand the basic
workflow

`add` → `commit` → `push`

and, more importantly, why version control is useful for a project that
is becoming valuable enough that losing a working version would hurt.

Students who already use Git can help others. There is no need to turn
this into a general Git lecture. More advanced Git features are better
introduced later when an actual problem creates a reason to use them.

The slightly dramatic exercise of deleting the local copies and cloning
the repository again is intentional: students should experience that the
repository really contains what they need to recover their project.

### Step 2 -- Two Useful Command-Line Tools: `curl` and `wget`

This is not intended as a lesson about all the options of `curl` and
`wget`.

The main point is that students should have used both tools once and
become comfortable with the idea that command-line tools can be explored
when needed using `--help`, `man`, and a little experimentation.

The different default behavior when downloading an already existing file
gives a small concrete reason to look at options rather than memorize
commands.

At the end of the step, the provided `Makefile` becomes part of the
students' own repository.

### Step 3 -- Let `make` Do the Work

The order in this step is deliberate: **observe first, explain
afterwards**.

Students first run `make` and inspect what was generated. In particular,
connect the object files in `obj` to the preparation video on
translation units. The files in `dep` provide a first visible
representation of dependencies; students do not need to understand their
complete syntax.

Then let them experiment. `touch` is useful here because it lets us
simulate editing a file without changing its contents. Students should
observe what happens when

-   nothing has changed,
-   an implementation file changes,
-   a header file changes,
-   generated files are removed with `make clean`, and
-   a source file used by several test programs changes.

Only after these experiments does the worksheet name and explain the
idea of an **incremental build**.

It is worth spending some discussion time here. The goal is not merely
that students know the command `make`, but that they understand *why*
only certain translation units are recompiled and *why* some executables
then have to be relinked.

### Step 4 -- Extending the Grammar

This step deliberately makes the students glad that they have a
Makefile.

The grammar is extended with `-`, `/`, and `%`, but no new precedence
levels are introduced. This revisits `parseBinary(prec)` from Worksheet
13 and gives students another opportunity to understand how precedence
is represented by the numerical values returned by `tokenKindPrec`.

The implementation follows a "first domino" strategy. Rather than
listing all necessary changes beforehand, we make one meaningful change
and let compile-time errors, runtime assertions, and tests expose the
consequences.

This produces an important progression:

1.  the program compiles, but an assertion fails at runtime;
2.  the next change produces a compile-time error;
3.  after fixing that, another runtime assertion exposes an incomplete
    implementation;
4.  a simple test appears to work;
5.  a slightly better test reveals a wrong expression tree;
6.  another bug remains invisible in the output and only causes a memory
    leak.

This is a good place to emphasize that

**compiles → runs → produces plausible output**

still does not imply that a program is correct.

Encourage students to use the expression-tree output actively. The test
`2 - 2 / 2` is especially useful because it also revisits precedence and
the tree representation.

### Step 5 -- Making `ExprKind` Less Error-Prone

The range markers `EXPR_BINARY`, `EXPR_BINARY_END`, `EXPR_PRIMARY`, and
`EXPR_PRIMARY_END` introduce a small defensive-programming pattern.

Do not present the pattern merely as a clever enum trick. It is
motivated directly by the bugs encountered in the previous step: code
that encoded assumptions such as "binary expression kinds happen to
range from `EXPR_ADD` to `EXPR_MUL`" silently became wrong when the enum
was extended.

Students should work out the numerical enum values themselves. This is
both a useful C refresher and makes the range checks much less magical.

The `default: assert(0)` cases are equally important. The idea is that
future extensions should fail visibly if a new node kind has not been
handled consistently.

The final `releaseExpr` task reconnects this structural issue with
resource management: a bug can be real even when the program still
prints the correct result.

### Step 6 -- Adding Keywords to the Lexer

The final step extends the lexer so that identifiers such as `fn` and
`if` can be recognized as keywords.

This deliberately builds on the unique-string machinery introduced
earlier. Because keyword strings and identifier strings are represented
by `UStr`, keyword recognition can use pointer equality.

There are several useful discussion points packed into the new
`getToken` implementation:

-   why `getToken` is a wrapper around the generated lexer function,
-   why the keyword strings cannot simply be initialized by calling
    `UStrCreate` in their global declarations,
-   why `first` has static storage duration while remaining local to the
    function,
-   and why the keyword lookup is written as an `if`--`else if` chain
    rather than a `switch`.

Students may add all keywords immediately, or deliberately go through
the extension process once or twice. The latter can be useful because
missing pieces reveal themselves naturally.

The initial lexer test intentionally produces `??` for recognized
keywords. This shows that recognizing a new token kind is only one part
of extending the lexer; the code that prints token kinds must also know
about the new values.

By the end of the session, the lexer should recognize:

`fn`, `if`, `while`, `global`, `local`, `else`, and `do`.

## In-Class Focus

This worksheet contains several topics, but they are connected by one
recurring idea: **dependencies**.

Git records successive states of a project. `make` tracks dependencies
between files and build products. Extending the grammar reveals
dependencies between lexer tokens, parser logic, expression-tree
representation, tests, and resource management.

The session works best if students are given time to predict what will
happen before running a command, and then compare that prediction with
what actually happens. Especially in Steps 3--5, the discussion around
unexpected behavior is more important than getting through the worksheet
quickly.
