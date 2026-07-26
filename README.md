# not-abc

`not-abc` is a tiny, self-hosting programming language and compiler. The language is deliberately minimal: it has only 64-bit values, no static type checking, and only a handful of built-in functions. The entire compiler is written in `not-abc` itself.

The project is intended for educational purposes. It demonstrates that a surprisingly small language is sufficient to implement a complete compiler.

## Language Overview

A `not-abc` program consists of global variables and function definitions.

Supported language features include:

- global and local variables
- functions (may be called before they are defined)
- `while` loops
- `if` / `else`
- integer, character and string literals
- arithmetic, comparison and logical operators
- pointers

The grammar is:

```text
top-level     = { global | fn } EOI
global        = "global" identifier { "," identifier } ";"
local         = "local" identifier { "," identifier } ";"
fn            = "fn" identifier "(" ")" compound-stmt

compound-stmt = "{"
                  { expr-stmt | local | while-stmt | if-stmt }
                "}"

expr-stmt     = expr ";"

while-stmt    = "while" "(" expr ")" compound-stmt

if-stmt       = "if" "(" expr ")" compound-stmt
                [ "else" compound-stmt ]

expr          = logical-or { "=" expr }

logical-or    = logical-and { "||" logical-and }
logical-and   = equality { "&&" equality }
equality      = relational { ( "==" | "!=" ) relational }
relational    = additive { ( "<" | "<=" | ">" | ">=" ) additive }
additive      = term { ( "+" | "-" ) term }
term          = prefix { ( "*" | "/" | "%" ) prefix }

prefix        = ( "-" | "&" | "*" | "#" | "!" ) prefix
              | factor

factor        = decimal-literal
              | character-literal
              | string-literal
              | identifier [ "(" [ expr { "," expr } ] ")" ]
              | "(" expr ")"
```

## Data Model

All variables are 64-bit values.

A value may be interpreted either as

- a signed 64-bit integer, or
- a pointer.

The language performs **no static type checking**. The programmer is responsible for using values consistently.

The unary operators are:

- `&` — address-of (like C)
- `*` — dereference 8 bytes
- `#` — dereference a single byte
- `-` — arithmetic negation
- `!` — logical negation

## Functions

Every function returns a 64-bit value.

There is **no `return` statement**. Instead, the value of the **last evaluated expression** becomes the function's return value.

Functions may be called before they are defined.

The compiler does **not** check whether a function is called with the correct number of arguments. Calling a function with too few or too many arguments results in undefined behavior.

Execution always starts in `main()`.

## Built-in Functions

The language provides four built-in functions that interface directly with the operating system:

- `putchar(ch)` writes the least significant byte of `ch` to standard output.
- `ch = getchar()` reads one byte from standard input, sign-extends it to 64 bits, and returns `-1` on end-of-file.
- `p = malloc(size)` allocates `size` bytes on the heap and returns a pointer, or `0` if the allocation fails.
- `free(p)` does nothing if `p` is `0`. Otherwise `p` must be a pointer previously returned by `malloc()`.

## Hello World

```c
fn print(s)
{
    while (#s) {
        putchar(#s);
        s = s + 1;
    }
}

fn println(s)
{
    print(s);
    putchar('\n');
}

fn main()
{
    println("hello, world!");
}
```

## Building the Compiler

The compiler itself is distributed as LLVM IR.

```sh
clang -o not-abc not-abc.ll
```

## Compiling Programs

`not-abc` reads source code from **stdin** and writes LLVM IR to **stdout**.

```sh
./not-abc < foo.abc > foo.ll
clang -o foo foo.ll
```

## Example

A more substantial example is available in `examples/factorial.abc`.

## Arrays and Structs (Hack)

`not-abc` has neither arrays nor structs.

However, string literals are stored in the writable data segment with 8-byte alignment. This makes it possible to reuse them as blocks of memory.

Likewise, `malloc()` can be used to build dynamic data structures. See `examples/list.abc` for a simple linked-list implementation.

## Self-Hosting

The file `examples/not-abc.abc` contains a compiler for the `not-abc` language written in `not-abc` itself.

```sh
./not-abc < examples/not-abc.abc > not-abc-compare.ll
diff not-abc.ll not-abc-compare.ll
```

If the generated LLVM IR is identical, the compiler has successfully compiled itself. In other words: **not-abc is self-hosting.**
