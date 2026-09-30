# Session 9 — Building a Symbol Table

## Lecturer Notes

### Before the Session

Students should watch:

- [ABC Examples 11 — Translation Units and Header Files](https://www.youtube.com/watch?v=S_u4fnajp78)

The video is only about 12 minutes long and introduces the mechanics needed in
the second half of this worksheet: separate translation units, header files,
and the distinction between declarations and definitions.

Students do **not** need to work through the worksheet before the session.
It can nevertheless be useful to briefly look through it in advance.

## Main Idea of This Session

From a programming point of view, surprisingly little in this worksheet is
fundamentally new. Much of the session deliberately revisits singly linked
lists, dynamic memory, pointers, and functions from earlier sessions.

The important change is the **context**.

Instead of manipulating a linked list merely as an exercise in data
structures, students use one to implement a small but realistic component of
a compiler: a **symbol table**.

This is intentional. The session should help students make the transition from

> "I know how a linked list works."

to

> "I can use a linked list as an implementation technique for a larger
> software component."

The linked-list implementation chosen here is certainly not an efficient
implementation of a symbol table. That is part of the point: at this stage,
simplicity and reuse of known concepts are more important than choosing the
best data structure.

## Revisiting Linked Lists

The first part of the worksheet continues the work from Session 7.

Students complete and improve the small linked-list implementation by

- moving functionality into functions,
- fixing `prependToList`,
- implementing `freeList`,
- printing a list recursively and in reverse order,
- searching a list, and
- implementing an intentionally inefficient `appendToList`.

This repetition is deliberate. Students should become sufficiently comfortable
with linked lists that the data structure itself is no longer the main
difficulty when the symbol table is introduced.

The inefficient implementation of `appendToList` is particularly useful for
discussion. It makes the cost of traversing a singly linked list visible and
motivates the general question of how the representation of a data structure
affects the complexity of its operations.

## `readonly`

The worksheet also introduces `readonly`.

The motivation comes directly from the existing list code: a function such as
`printList` should inspect a list but should not modify its nodes. `readonly`
allows us to express this intention in the type system and lets the compiler
detect accidental modifications.

The worksheet then briefly generalizes the idea beyond pointers and uses a
conditional expression to initialize a `readonly` local variable.

The goal here is not merely to introduce another keyword. Students should see
`readonly` as a way to make an interface express what a function is and is not
allowed to do.

## From a List to a Symbol Table

The second half gives the linked list a concrete application.

The symbol table stores information about global and local variables. Students
gradually implement operations for

- adding global and local identifiers,
- detecting duplicate definitions,
- looking up identifiers,
- retrieving information about an identifier,
- handling the precedence of local over global definitions,
- printing the stored information, and
- discarding local symbols when they are no longer needed.

This also provides a first concrete example of **name lookup and shadowing**:
a local variable may have the same name as a global variable, and lookup must
prefer the local definition. After the local symbols are removed, the global
definition becomes visible again.

This is deliberately still a very small symbol table. More sophisticated data
structures such as hash tables are not needed for the learning objective of
this session.

## Interface and Implementation

This is the first session in which the students work with more than one
translation unit.

The short video before the session prepares them for this, but the worksheet
makes the distinction concrete.

The symbol table exposes its interface through `symtab.hdr`, while its internal
representation and implementation live in `symtab.abc`. The test program only
needs to know the interface.

An important part of the exercise is that students first compile

    abc -c xtest_symtab.abc

successfully even though the symbol-table functions have not yet been
implemented. They then try to create an executable and encounter linker
errors.

Only afterwards is `symtab.abc` added and both translation units are compiled
and linked together.

This is worth emphasizing during the session. The students should experience
the distinction between

- having enough information to **compile a call**, and
- having an actual **definition that can be linked**.

There is deliberately no Makefile hiding these steps yet. Students should
first understand what has to be compiled and linked before automating it.

## The Test Program

The supplied test program remains unchanged while the students implement the
symbol table step by step.

Initially it fails almost immediately. As more functions are implemented, more
and more assertions succeed and execution progresses further through the test.

This gives the session a small taste of **test-driven development**, although
TDD itself is not introduced as a separate topic here.

The important experience is simply:

> implement one part, compile, run the test, observe the next failure, continue.

This also gives students immediate feedback about their progress without
requiring a fully working symbol table from the beginning.

## A First Encounter with Strings

Strings are intentionally treated only briefly in this session.

For now,

    type String: array[42] of char;

is sufficient for the symbol table. Students also encounter `strcmp` when they
need to compare identifiers.

This representation is deliberately simplistic and has obvious limitations.
Those limitations should **not** be resolved here.

Strings will be treated carefully in Session 12.

This follows an important didactic principle of the course:

> **Do not explain the solution to a problem before students know the problem.**

At this point, students first need a genuine reason to use strings. Identifier
names in a symbol table provide exactly such a reason.

When strings are revisited in Session 12, students will already have used the
simple fixed-size representation in a real application. They can then ask much
more meaningful questions:

- Why should every string reserve space for 42 characters?
- What happens when an identifier is longer?
- Why are strings copied into every node?
- What alternatives are there?
- Which representation is more efficient, flexible, or safe?

The shortcomings of the representation used here therefore are not an
accident. They provide motivation for the later session.

## Teaching Perspective

The worksheet combines several ideas that students have encountered separately
before:

- linked lists and dynamic memory,
- pointers and `readonly`,
- conditional expressions,
- strings and `strcmp`,
- compiler symbol tables,
- interface versus implementation,
- translation units and linking,
- and incremental testing.

Most individual programming steps are intentionally modest. The challenge is
to see how these pieces fit together into a small software component with a
clear interface and a concrete purpose inside a compiler.

That integration is the main learning objective of the session.
