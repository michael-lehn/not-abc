# Session 03 — Lecturer Notes

Before this session, students should watch (and actively follow along with) the
following videos:

- [Unix Shell](https://www.youtube.com/watch?v=j30E8p7iPbM&t=2s)
- [Control Structures... Explained with Evil `goto` Statements!](https://www.youtube.com/watch?v=6wk3CDYIhCE)

## The Goal of This Session

At first glance, this worksheet appears to jump between unrelated topics.

Students experiment with the Unix shell, investigate the lifetime of variables,
discuss scope, parameter passing, `goto` statements, flow charts, control
structures, recursion, and the call stack.

This is intentional.

The common theme is not the programming language itself, but a much deeper
question:

> **What actually happens when a program executes?**

Throughout the worksheet, students repeatedly observe program behavior before
learning how it is implemented. Later, during the Bottom-Up part of the course,
they will build exactly these mechanisms themselves in assembly language.

In other words, this worksheet deliberately trains intuition first and
implementation second.

## Why the Shell?

The shell is much more than a convenient way of starting programs.

Throughout HPC0, students continuously interact with the operating system
through the shell: creating directories, organizing projects, compiling
programs, running executables, and later logging into HPC systems via SSH.

For that reason alone, becoming comfortable with the shell is worthwhile.

The video also introduces the notion of **tokens**. This may seem like
an odd choice for a shell tutorial, but it turns out to be surprisingly
useful later in the course.

For example, when I ask students to enter

``` text
ls -l
```

a surprising number initially type

``` text
ls-l
```

because they have not yet internalized that the command actually
consists of two tokens:

-   `ls` (the command),
-   `-l` (an option).

Once students later start writing a compiler, they already have an
intuitive understanding that programs often process streams of tokens
rather than raw text. Reusing terminology in different contexts makes
later concepts much easier to introduce.

## Why Teach `goto`?

This is usually the most controversial part of the session.

Many programming courses avoid mentioning `goto` altogether.

I intentionally do the opposite.

Structured control flow did not appear out of nowhere. It was invented because
unrestricted jumps make programs difficult to understand. I generally prefer
not to explain a solution before students have experienced the underlying
problem.

There is also a practical reason.

Later in HPC0, students will implement a compiler. The source language contains
`if` statements and loops. The generated machine code does not. At the machine
level, everything reduces to conditional and unconditional jumps.

A C-style `goto` is therefore much closer to assembly language than a `while`
loop.

Understanding this relationship early makes compiler construction much less
mysterious later.

## Why Lifetime, Scope, and the Call Stack?

The worksheet then shifts toward functions.

Again, this may initially seem like another unrelated topic.

In reality, students are gradually collecting observations that will later be
explained by one single implementation technique: **the call stack**.

They observe that

- local variables appear and disappear,
- global variables behave differently,
- function parameters are copies (concept: *call by value*),
- recursive function calls work naturally,
- every active function has its own local variables.

At this point, students are not yet expected to understand *how* this works.

Instead, they simply collect experimental evidence.

Only later, during the Bottom-Up sessions, they will implement stack frames
themselves in assembly language and realize that every one of these
observations follows naturally from a surprisingly simple mechanism.

## A Small Pedagogical Trick

Some students wonder why the worksheet mixes together so many apparently
unrelated concepts.

The answer is simple.

We are not trying to teach isolated language features.

We are trying to build the mental model that eventually allows students to
understand how a compiler translates a high-level language into machine code.

One could almost say that the worksheet is preparing their neural network.

The explanations come later.

