# HPC0 --- Session 12: Choosing a String Representation

## Lecturer Notes

### Preparation instead of a lecture video

For this session, students receive a **Preparation Sheet** instead of
the usual lecture video. They should work through it at home before
coming to class.

The preparation sheet reviews null-terminated strings, arrays and
pointers, call by value, and the basic string functions `strlen`,
`strcpy`, and `strcmp`. Its purpose is to establish the background
needed to understand the design problem addressed in Worksheet 12.

This was not originally intended as a different teaching format. The
material had initially been planned in the same way as the other
preparatory material, and the Preparation Sheet started as a pragmatic
substitute for a video. In practice, however, the format had an
unexpected advantage.

At the beginning of the session, I used roughly the first **30 minutes
for small-group discussion of the Preparation Sheet**. Students compared
their answers, asked each other questions, and tried to explain the
examples to one another before we discussed remaining issues together.
This creates considerably more social interaction than simply starting
with another lecturer-led recap.

The format does require some mentoring: I move between the groups,
listen to their discussions, answer questions when necessary, and
occasionally ask a question that points them in the right direction.
With sufficient supervision, however, the preparation sheet becomes more
than a replacement for a video --- it provides a useful basis for peer
discussion.

## Preparation Sheet

The preparation sheet should be completed **before the session**.

Its main purpose is to make the limitations of the temporary string
representation from Worksheet 9 visible:

``` text
type String: array[42] of char;
```

The sheet revisits:

-   null-terminated strings and the terminating null character,
-   the difference between arrays and pointers,
-   call by value in ABC,
-   `strlen`,
-   `strcpy`,
-   `strcmp`,
-   the cost of character-by-character string operations.

The final discussion of `strcmp` leads directly to the central question
of Worksheet 12: if identifiers in a symbol table are compared very
frequently, can we choose a representation that makes equality
comparison cheaper?

## Suggested Session Structure

Start with approximately **30 minutes of group discussion** of the
Preparation Sheet. Students should primarily explain their answers to
each other rather than simply compare final results. Use this time to
identify misconceptions about arrays, pointers, null termination, and
string comparison.

Afterwards, continue with Worksheet 12.

## Step 1 --- Unique Strings

The first step introduces **unique strings (`UStr`)**.

The central invariant is:

``` text
s1 == s2
```

if and only if the two `UStr` values represent the same sequence of
characters.

This is the key design decision of the worksheet. Equality becomes a
pointer comparison, at the cost of making string creation more
expensive.

Students first specify the interface in `ustr.hdr` and write
`xtest_ustr.abc`. The initial linker error is intentional: the interface
and expected behavior are established before `UStrCreate` is
implemented.

The implementation in `ustr.abc` uses a linked list. This deliberately
reuses ideas from Worksheet 9. A new node allocates enough memory for
the node and the complete null-terminated string. Students first
implement storing strings in the list and then add the search that
ensures equal strings are stored only once.

The important observation is the trade-off: `UStrCreate` may have to
search and copy, but later equality tests require only `==`.

## Step 2 --- Bringing Back Our Symbol Table (Preparation)

Students copy the symbol-table files from Session 9 into their `not-abc`
compiler project:

``` text
symtab.hdr
symtab.abc
xtest_symtab.abc
```

They deliberately **do not copy `string.hdr`**.

The resulting compiler error is intentional. It exposes exactly the
dependency that will now be removed: the symbol table still relies on
the temporary fixed-size `String` representation.

## Step 3 --- Changing the Symbol Table Interface

Only the public interface and its user are changed first.

In `symtab.hdr`, students replace the dependency on `string.hdr` by
`ustr.hdr` and replace uses of `String` by `->UStr`.

They then adapt `xtest_symtab.abc`. Expressions such as

``` text
(String)"bar"
```

become

``` text
UStrCreate("bar")
```

At the end of this step,

``` text
abc xtest_symtab.abc
```

should get through compilation and fail only at the linking stage.

This is a useful checkpoint: the interface and the client agree before
the implementation is touched.

## Step 4 --- Using Unique Strings in the Symbol Table

The actual modification of `symtab.abc` is intentionally small.

Students replace `String` by `->UStr` and, in the helper function
`isInList`, replace the old `strcmp`-based equality test by pointer
equality.

The complete test can then be built with

``` text
abc xtest_symtab.abc symtab.abc ustr.abc
```

and should run correctly.

Ask students to study the test program once more and identify where its
output would change if identifier equality no longer worked correctly.
The point is not merely to obtain a passing program, but to understand
what the test actually verifies.

## Step 5 --- Changing the Lexer Interface

The files

``` text
lexer.hdr
lexer.abc
xtest_lexer.abc
```

should already be present in `not-abc` from Session 11.

Again, change the interface first. In `lexer.hdr`, the old fixed-size

``` text
type TokenVal: array[13] of char;
```

is removed, `ustr.hdr` is included, and `Token.val` becomes a `->UStr`.

After this interface change,

``` text
abc xtest_lexer.abc
```

should again reach only linker errors.

This creates the next design problem: a `UStr` is an excellent
representation for a **finished** token value, but it is unsuitable for
constructing a token character by character.

## Step 6 --- Adapting the Lexer Implementation

Introduce

``` text
global internalVal: array[13] of char;
```

as an internal construction buffer in `lexer.abc`.

`nextCh` now appends characters to `internalVal` rather than directly to
`token.val`.

Rename the previous `getToken` implementation to `getToken_`. The new
externally visible `getToken` becomes a small wrapper:

``` text
fn getToken(): TokenKind
{
    getToken_();
    token.val = UStrCreate(internalVal);
    return token.kind;
}
```

This cleanly separates two roles:

-   `internalVal` is used while **constructing** a token.
-   `token.val` represents the **finished** token.

Rebuild and test with

``` text
abc xtest_lexer.abc lexer.abc ustr.abc
```

before proceeding.

## Step 7 --- Letting Tokens Grow

The lexer still has the old 12-character limit because `internalVal` is
a fixed-size array. The final step removes this restriction.

Include

``` text
@ <stdlib.hdr>
```

and replace the fixed-size buffer by

``` text
global internalVal: ->char;
global internalValCapacity: u64;
```

Both globals are initially zero because they reside in the BSS segment.

`nextCh` uses `realloc` whenever more capacity is required. The growth
rule

``` text
internalValCapacity = 2 * internalValCapacity + 1;
```

produces capacities

``` text
0 -> 1 -> 3 -> 7 -> 15 -> ...
```

and avoids a special case for the initially empty buffer.

This is a good point to emphasize that `realloc` may return a different
address and that the returned pointer must therefore be assigned back to
`internalVal`.

Finally, rebuild with

``` text
abc xtest_lexer.abc lexer.abc ustr.abc
```

and test with identifiers substantially longer than the former
12-character limit.

## Main Ideas to Emphasize

The worksheet is less about strings themselves than about **choosing
representations according to the operations that matter**.

For the symbol table, equality comparison is frequent, so unique strings
make equality extremely cheap.

For the lexer, the requirements are different while a token is being
constructed. A dynamically growing buffer is appropriate there. Once
construction is complete, the token is converted to the representation
needed by the rest of the compiler.

This contrast is intentional: there is no universally best string
representation. The appropriate data structure depends on what we want
to do with it.

A second recurring theme is **interface before implementation**. Both
the symbol table and the lexer are changed in stages so that students
can observe which compilation or linking errors remain after each
modification. The deliberately broken intermediate states are part of
the exercise, not accidents.

## Files Used in This Session

Students should end up working with:

``` text
ustr.hdr
ustr.abc
xtest_ustr.abc

symtab.hdr
symtab.abc
xtest_symtab.abc

lexer.hdr
lexer.abc
xtest_lexer.abc
```

The compiler-project files should be kept in the `not-abc` directory (or
repository, for students already using Git).
