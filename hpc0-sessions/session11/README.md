# Worksheet 11 --- Let there be a Lexer

## Lecturer Notes

This worksheet starts the lexer part of **A Bloody Compiler Project**.
The students now begin to turn the small compiler pieces they have
already seen into a more clearly separated compiler architecture.

## Preparation

Before the session, students should watch:

### [A Bloody Compiler Project (Part 1): Lexer](https://www.youtube.com/watch?v=DjmUt35Ef8c)

The video is about 27 minutes long. It serves two purposes.

First, it gives a short overview of the components that we are going to
build during the compiler project. It is worth connecting this
explicitly to **Worksheet 1**: the students have, in fact, already
written a first compiler without necessarily thinking of it that way. In
that first version, parsing and code generation were mixed together ---
code was generated directly in the parser. From this point on, we start
separating the different compiler components more cleanly.

Second, the video introduces **finite automata** as the conceptual model
behind lexical analysis. The emphasis is deliberately practical rather
than formal. The state graphs are particularly useful here: students
should learn to look at such a graph and turn it into code that consumes
a character stream and recognizes tokens.

For mathematicians, one can make the slightly provocative point that the
pictures are enough for our purpose: they can reconstruct the formal
definition of a finite automaton themselves. :-) What matters for this
project is that they understand what the states and transitions mean
well enough to implement the corresponding recognizer.

## Main Goals of the Session

The worksheet begins with the very small lexer from the lecture video
and gradually turns it into the lexer that will be used throughout the
remaining compiler project.

The important conceptual development is:

-   characters become **tokens**;
-   a token becomes more than just a `TokenKind`: it acquires a **source
    position** and a **textual value**;
-   the lexer learns to recognize increasingly realistic token classes;
-   one-character tokens lead naturally to tokens requiring a small
    amount of lookahead;
-   the implementation remains deliberately simple enough that the
    connection to the finite-state diagrams stays visible.

The worksheet also deliberately revisits several language concepts that
the students have encountered before: scope, arrays and pointers, enums,
structs, `switch`, `size_t`, `sizeof`, assertions, undefined behavior,
and recursion.

## Suggested Flow

### Steps 1--3: Establish the Token Interface

Step 1 uses `tokenKindStr` to simplify the test program and introduces
`switch`. This is also an opportunity to revisit scope: the parameter
`token` of `tokenKindStr` and the global variable `token` are different
variables.

The exercises on fall-through, enum values, and exhaustiveness checking
are worth actually trying. In particular, the value `42` demonstrates
that an enum variable is not restricted to the named enum constants.

Step 2 introduces the `default` label and lets students choose between
the two styles of implementing `tokenKindStr`. There is intentionally no
prescribed "best" style here; the important point is that they
understand the control flow and then use a style consistently.

Step 3 is deliberately small: add `ASTERISK`. It checks whether students
have understood that adding a token affects several places --- the enum,
lexer implementation, `tokenKindStr`, and tests.

### Steps 4--5: Source Positions

These two steps deliberately separate **interface design** from
**implementation**.

In Step 4, `Token` becomes a struct containing the token kind and its
position. The test is adapted *before* the feature is implemented. At
this point the reported positions are still `0.0`; that is intentional.

Step 5 introduces `nextCh()`. This is an important little abstraction:
character input and position tracking are now coupled in one place.
After whitespace has been skipped, `currentPos` gives the position at
which the next token begins.

Tabs are deliberately not handled correctly. There is no need to turn
this into a discussion of terminal tab stops unless students ask.

### Steps 6--7: Preserving the Token Text

The token gets a small fixed-size character array. The dimension is
deliberately only 13: twelve usable characters plus the terminating
zero. The limitation is supposed to become painful.

Step 6 again changes the interface and test before implementing the
feature. Ask why `token.val` initially appears as an empty string and
whether relying on this is defined behavior.

Step 7 contains an intentionally crude implementation using the global
variables `updateVal` and `lengthVal`. Do not beautify this too early
--- it is useful precisely because the mechanics are visible.

The buffer-overflow exercise is important. Students should first observe
what happens without a bounds check. The proposed assertion is then
intentionally wrong by one element because space is also required for
the terminating zero. Let them find and fix this.

This is a good place to emphasize that an assertion can prevent
undefined behavior only if the asserted condition is actually correct.

### Step 8: Tidying Up

`isDigit` is a tiny refactoring, but it prepares the style used in the
following recognizers. There is no need to spend much time here.

### Step 9: Punctuators

This is intentionally somewhat tedious.

The important new idea is that some punctuators consist of two
characters. For `<`, the lexer must consume the first character and then
inspect the next one to distinguish `LESS` from `LESS_EQUAL`.

Only `<` / `<=` is demonstrated. Students should implement the analogous
cases themselves.

The repetitive nature of the work is intentional. The remark at the end
of the step foreshadows a later idea: if a table describes enough
repetitive code, one might write a program that reads the table and
generates the code.

`GATTER` is an intentionally old-school German name for `#`. Students
are explicitly free to use `HASH` instead.

### Step 10: Identifiers

An identifier starts with a letter or `_` and may then contain letters,
digits, and underscores.

`isLetter` should still mean "is a letter"; `_` can be handled
explicitly in the conditions. Together with `isDigit`, this keeps the
individual helper functions simple while forcing students to formulate
the actual identifier rule.

Make sure `tokenKindStr` and the test program are extended as well.

### Step 11: String and Character Literals

The first implementation is intentionally restricted.

Strings do not yet need escape sequences, and character literals contain
exactly one character. Students who want to support escapes already may
do so, but this should not become a requirement for everyone.

The important part is that the lexer recognizes the token kind and
preserves the corresponding textual value so that the behavior can be
tested.

### Chillout: Single-Line Comments

The final feature should feel easy.

The `/` case is extended so that `//` skips characters until newline or
end-of-file. After the comment has been consumed, the lexer simply
executes

``` abc
return getToken();
```

This gives a relaxed little recurrence of **recursion** at the end of
the worksheet: after ignoring something that does not produce a token,
the lexer asks itself for the next token.

The `EOF` condition matters for a comment on the final line of a file
that has no terminating newline.

## Didactic Remarks

A central theme of the worksheet is **test first, implementation
second**. Source positions and token values are both added to the
interface and test program before their implementation is completed.
This makes intermediate states observable and gives students a concrete
target.

Another theme is that the lexer is not presented as a mysterious
compiler component. It is just a program that repeatedly looks at the
current character, changes state, consumes characters, and eventually
reports a token. The finite-state graphs from the video provide the
mental model; the `if`, `while`, and helper functions in the worksheet
are the implementation.

Do not worry if the resulting lexer is not yet elegant. At this stage,
transparency is more valuable than abstraction. Later sessions can
improve the architecture once students have built and understood the
machinery themselves.

## Expected Result

At the end of the session, students should have a lexer that can track
source positions and token text and recognize decimal literals,
identifiers, string and character literals, the punctuators listed in
the worksheet, and single-line comments.

More importantly, this is no longer an isolated lexer exercise: it is
the lexer that will be used in the remaining sessions of **A Bloody
Compiler Project**.
