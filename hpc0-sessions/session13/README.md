# Session 13 – A Bloody Compiler Project: Let There Be Trees … and a Parser

## Preparation

Before this session, students should have watched:

- [A Bloody Compiler Project (Part 2): Parser and Code Generator](https://www.youtube.com/watch?v=t8V7_O7R0PY&t=5s)

Students should also have taken a **good look at the worksheet before coming to class**. They do not need to understand every detail in advance, but they should already be familiar with the overall structure of the session and the code that will be discussed and implemented.

## Lecturer Notes

This session is an important transition in the compiler project.

In the video, the parser generates assembly code directly while parsing arithmetic expressions. This is deliberately changed in the worksheet: parsing and code generation are separated, and the parser constructs **expression trees** instead.

The session therefore introduces both a new data structure and a small architectural change to the compiler.

### Start from the Interface

A central idea of the first part is to think about **how we want to use a data structure before deciding how to implement it**.

The worksheet therefore starts with expressions such as

```abc
createIntegerExpr(2)
```

and

```abc
createBinaryExpr(EXPR_MUL,
    createIntegerExpr(2),
    createIntegerExpr(3))
```

before `struct Expr` is designed.

The small program `xtest_expr.abc` is written before the implementation as well. This establishes the desired interface first and gives us something that can be compiled and tested while the implementation is developed incrementally.

This is a useful development pattern that will occur repeatedly in the compiler project.

### Expression Trees as Dynamic Data Structures

Expression trees build directly on ideas students have already encountered with linked lists:

- nodes are allocated dynamically,
- nodes refer to other nodes through pointers,
- the number of nodes is not known in advance,
- recursively defined structures naturally lead to recursive algorithms.

The functions `printExprTree` and `releaseExpr` are deliberately closely related. Both traverse the same recursive structure but perform different operations while doing so.

The visualization with LaTeX and `forest` is useful here. It turns the internal pointer structure into something students can inspect directly and compare with the expression they intended to construct.

### A Small Design Decision Before Parsing

Before connecting the expression trees to the parser, the representation of integer literals is changed from `u64` to `->UStr`.

The technical change is small. The more important teaching point is **why one might think of making such a change before it becomes necessary**.

The lexer already represents the spelling of an integer literal as a unique string. Reusing this representation makes the parser simpler.

This is a good opportunity to point out that software design involves experience and intuition. As in mathematics, such intuition develops by studying solutions, understanding why they work, and solving many problems oneself. Students should not necessarily expect to anticipate every useful design decision at this stage.

### Connecting Lexer, Parser, and Expression Trees

The parser is then separated into

- `parser.hdr`,
- `parser.abc`,
- and `xtest_parser.abc`.

The grammar initially remains exactly the one developed in the video:

```text
expr   = term { "+" term }
term   = factor { "*" factor }
factor = decimal-literal
       | "(" expr ")"
```

Likewise, the recursive-descent structure with `parseExpr`, `parseTerm`, and `parseFactor` remains almost unchanged.

The important difference is what the parser produces: instead of emitting assembly instructions and returning register numbers, it constructs expression-tree nodes and returns pointers to them.

This comparison with the video is worth emphasizing. Students should see that separating parsing from code generation does **not** require throwing away the parser they already understand.

### Let Students Inspect the Trees

Students should test both valid and invalid expressions and use `printExprTree` together with LaTeX to visualize some of the resulting trees.

In particular, expressions such as

```text
2 + 3 + 4
```

are useful. Students should understand why repeatedly executing

```abc
left = createBinaryExpr(EXPR_ADD, left, right);
```

produces the tree structure that it does.

Do not develop operator associativity fully here. The shape of these trees will become useful when associativity is discussed later.

### From Token Kinds to Expression Kinds

The helper function

```abc
exprKindFromToken(...)
```

introduces a small but useful separation between the representation used by the lexer (`TokenKind`) and the representation used by expression trees (`ExprKind`).

It is intentionally an internal function of `parser.abc` and therefore does not belong in `parser.hdr`.

This is also another opportunity to reinforce the distinction between the public interface of a translation unit and implementation details.

### The Main Idea of the Final Step

The most important observation before the final step is that `parseExpr` and `parseTerm` are structurally the same.

Give students some time to notice this themselves.

The introduction of

```abc
tokenKindPrec(...)
```

first replaces explicit tests for `PLUS` and `ASTERISK` with precedence values without otherwise changing the parser.

Only after this intermediate step are `parseExpr` and `parseTerm` replaced by the more general recursive function

```abc
parseBinary(prec)
```

This progression is deliberate.

The new implementation may initially look more complicated, but students should walk through a simple example such as

```text
2 + 3 * 4
```

starting with

```abc
parseBinary(1)
```

and compare it with the previous implementation.

The key observation is:

> Previously, operator precedence was encoded in the structure of the parsing functions themselves. Now precedence is represented as data.

This makes the parser considerably easier to extend with additional binary operators such as `-`, `/`, `%`, and others.

### Looking Ahead

By the end of this session, several components are already involved in building even a small test program:

```text
abc xtest_parser.abc parser.abc lexer.abc ustr.abc expr.abc
```

Typing this command is deliberately allowed to become somewhat annoying.

Students should begin to feel that manually keeping track of all translation units and dependencies does not scale. A later session on **Makefiles** will address exactly this problem.

## In-Class Focus

The session should not become an exercise in copying code as quickly as possible. Leave time for students to compare implementations, explain code to one another, draw trees, and walk through the parser by hand.

In particular, useful discussion points are:

- declaration vs. definition of a function,
- why forward declarations are necessary,
- public interface vs. implementation details,
- how recursive data structures lead to recursive algorithms,
- how the parser constructs expression trees,
- how the tree for a sequence of operators grows,
- where operator precedence was encoded in the original parser,
- and how `parseBinary` turns that structure into a more general mechanism.

The final question — asking students to describe the grammar implemented by the generalized parser — is deliberately open-ended. It is a good check of whether they have understood the transformation rather than merely reproduced the code.
