# HPC0 --- Worksheet 5: From Control Flow to Memory

## Lecturer Notes

### Preparation

Before working on this worksheet, students should have watched the
following videos:

- [ABC Examples 5 --- Arrays and a simple stack
    implementation](https://www.youtube.com/watch?v=iaRQqnH2RII)
- [ABC Examples 6 --- First Contact with Pointers](https://www.youtube.com/watch?v=WZFlNR6-fqM)
- [ABC Examples 7 --- Pointer Arithmetic: Exploring the Connections
    Between Pointers and
    Arrays](https://www.youtube.com/watch?v=rdIRLqWEfIs)

The worksheet assumes that students have already encountered arrays,
addresses, pointers, dereferencing, and pointer arithmetic in these
videos. The purpose of the worksheet is not to introduce all of this
syntax from scratch, but to make the underlying memory model concrete
through experiments.

Worksheet 3 should already have established the connection between
function calls, local variables, recursion, and stack frames. In
particular, students should have seen that several invocations of the
same recursive function can coexist and that each invocation has its own
data.

### Main idea of the worksheet

The worksheet develops one continuous line of thought:

**array → stack → stack frames → memory locations → addresses → pointers
→ reinterpretation of memory → code addresses → function pointers**

The first half deliberately starts with something very concrete: an
array and an integer `stackSize`. Students can see that `pop()` does not
physically erase anything. It merely changes which part of the
underlying storage is currently considered to belong to the stack.

This observation is then reused when discussing function calls. A stack
frame that is left should not be imagined as being "erased"; its storage
simply ceases to belong to the active call. The faded stack frames in
the figure are intended to reinforce exactly this interpretation.

The second half changes perspective from *values stored in memory* to
*addresses of memory*. Pointer-to-pointer examples are introduced early
on purpose. Students have already seen them in the videos, and treating
`**q` as an ordinary repeated application of dereferencing helps avoid
making multiple indirection appear mysterious.

The later steps extend the same idea to program code: functions also
have addresses. Function pointers therefore provide a natural endpoint
for the worksheet and connect memory back to control flow.

------------------------------------------------------------------------

## Step 1 --- Building a Stack with an Array

Students begin with the supplied implementation of `push()` and `pop()`.

Before they modify anything, ask them to explain the two statements

``` text
stack[stackSize++] = val;
return stack[--stackSize];
```

in words.

The important point is that the stack is represented by **two things
together**:

-   the underlying array, and
-   `stackSize`, which determines which part of that array currently
    belongs to the stack.

Students should not yet need a sophisticated notion of a stack pointer.
`stackSize` is enough to establish the essential idea.

The capacity check

``` text
sizeof(stack) / sizeof(stack[0])
```

is worth discussing briefly. It also prepares the ground for later
reasoning about object sizes and addresses.

## Step 2 --- Accessing the Top of the Stack

Students implement `top()`.

The expected implementation is essentially

``` text
fn top(): int
{
    assert(stackSize > 0);
    return stack[stackSize - 1];
}
```

The conceptual question is more important than the code:

-   `top()` observes the top element.
-   `pop()` observes the top element **and changes the logical extent of
    the stack**.

In particular, `top()` leaves `stackSize` unchanged whereas `pop()`
decrements it.

Do not yet answer the question of whether `pop()` "deletes" the value.
Step 4 is designed to make students discover this themselves.

## Step 3 --- Inspecting the Stack

The supplied `info()` function makes the abstract stack visible.

Students should use it after each `push()` and `pop()` and connect the
displayed elements to the current value of `stackSize`.

This is mainly a preparation step for Step 4. If students finish
quickly, ask what `info()` is *not* showing.

## Step 4 --- What Does `pop()` Actually Do?

This is an important conceptual step.

Students extend `info()` so that it displays both

-   the active part of the stack, and
-   the remaining elements of the underlying array.

After

``` text
push(3);
push(4);
pop();
```

they should observe something like

``` text
stack: [3] | [4] [0] [0] [0]
```

The value `4` has not been erased. Only `stackSize` has changed.

A useful question is:

> What will happen to the `4` when another value is pushed?

The expected answer is that the corresponding array element will simply
be overwritten.

This distinction between **storage still containing bits** and **storage
still belonging to a live object/data structure** is one of the central
ideas of the worksheet.

## Step 5 --- Using Our Stack for Function Calls

This step connects the simple array-based stack to the stack-frame
discussion from Worksheet 3.

Be explicit that the exercise does **not** implement a real call stack.
It simulates only one small aspect of it: storing the parameter `n` for
each active invocation of `foo()`.

Students transform calls conceptually from

``` text
foo(3);
```

to

``` text
push(3);
foo();
```

and obtain the current value of `n` through `top()`.

The crucial moment is the return path. `pop()` makes the value belonging
to the returning invocation inactive, but the bits remain in the
underlying array.

Encourage students to call `info()` both when entering and when leaving
`foo()`. After all recursive calls have returned, ask them to compare
the underlying array with the faded stack frames in the figure.

The intended conclusion is:

> Leaving a stack frame does not require its bytes to be erased. The
> storage simply ceases to belong to that active invocation and may
> later be reused.

This is also a good place to distinguish the worksheet's simplified
stack from an actual ABI-level call stack without going into ABI details
yet.

## Step 6 --- Pointers and Pointers to Pointers

The pointer exercise should be treated primarily as a **memory-diagram
exercise**, not as a syntax exercise.

Before running the program, students should draw four memory locations:

``` text
a = 42
b = 123
p = &a
q = &p
```

and represent the relationships with arrows.

The central chain is

``` text
q  →  p  →  a
```

so that

``` text
*p
**q
```

both access `a`.

The "magic" statement should redirect `p`:

``` text
p = &b;
```

Afterwards the chain is

``` text
q  →  p  →  b
```

and consequently both `*p = 13` and `**q = 31` modify `b`.

This is a useful place to emphasize that `q` itself does not have to
change. It still points to `p`; what changed is the address stored *in*
`p`.

When students print addresses, exact numerical addresses are irrelevant
and will vary between runs/platforms. What matters are the
relationships:

``` text
p == &a        // initially
q == &p
*q == p
**q == *p
```

The purpose of introducing a pointer to a pointer this early is
deliberate: repeated dereferencing should feel like repeated application
of a simple operation, rather than like a fundamentally new concept.

## Step 7 --- Type Casts: Interpreting Memory Differently

The central idea is that an address alone does not say how the bytes
beginning at that address should be interpreted. The pointer type
supplies this information to the compiler.

With

``` text
a: int = 0x12345678
```

students first inspect ordinary character data and then deliberately
reinterpret the address of `a` as a pointer to `char`.

The compiler should initially reject assigning `&a` directly to a
`-> char`, because `&a` has pointer-to-`int` type. The explicit cast
tells the compiler to treat the same address as a pointer to `char`.

Students can then inspect the individual bytes of `a`.

This naturally exposes **byte order / endianness**. Do not prescribe the
observed order in advance. Let students run the program and infer it
from the output. On a little-endian machine they will typically see the
least significant byte first.

This is also a good opportunity to stress that the cast does not
rearrange the bytes of `a`. It changes how memory at that address is
accessed/interpreted.

The `objdump` part prepares the transition from data stored as bytes to
instructions stored as bytes.

## Step 8 --- Addresses and Machine Instructions

The key conceptual transition is:

> Memory contains bytes. Some bytes represent data; other bytes
> represent machine instructions.

Students obtain the address of `main`, cast it to a character pointer,
and inspect the first bytes beginning at that address.

They then compare these bytes with the machine-code bytes displayed by
`objdump`.

Exact instruction sequences must not be treated as fixed. They depend on
compiler, compiler version, optimization settings, target architecture,
executable format, and possibly other build options.

The invariant idea is simply:

-   `main` has an address,
-   machine instructions occupy memory,
-   the bytes read through the pointer correspond to the bytes that form
    the machine code of `main`.

This step reconnects the memory discussion to the low-level execution
model developed elsewhere in HPC0.

## Step 9 --- Function Pointers

The final step brings the worksheet back to **control flow**.

If a function has an address, that address can be stored in a variable.
The type of the function pointer describes the function signature.

With

``` text
local msg: -> fn(val: int): int;
msg = &german;
local foo: int = (*msg)(12);
```

students should identify three separate ideas:

1.  `&german` is the address of code.
2.  `msg` stores that address.
3.  Dereferencing/calling through `msg` transfers control to that code.

The exercise showing that the parameter name is irrelevant to the
function signature is useful because it separates **type information**
from mere naming.

`selectLang()` then makes the important step from storing a code address
to **computing which code address should be used**.

Conceptually:

``` text
input
  ↓
selectLang()
  ↓
function address
  ↓
msg
  ↓
(*msg)(value)
```

The final `scanf()` exercise connects pointers to a familiar library
function. `scanf` needs `&a` because it must modify the caller's object
rather than merely receive its current value.

The final program combines input, a function returning a function
pointer, indirect calls, and ordinary integer arguments. It is
deliberately a small form of dynamic dispatch.

A useful closing question is:

> At the beginning of the worksheet, `stackSize` determined which data
> was currently active. At the end, `msg` determines which code will be
> executed. What do these examples tell us about addresses and values in
> a machine-level view of a program?

------------------------------------------------------------------------

## Common difficulties

Students may say that `pop()` "deletes" an element. Ask them to
distinguish the abstract stack from the underlying array and to use
`info()` as evidence.

Students may confuse the **address stored in a pointer** with the
**memory location occupied by the pointer variable itself**. Memory
diagrams with a separate box for every variable usually resolve this.

For `q: -> -> int`, insist on following one arrow at a time:

``` text
q      address of p
*q     value stored in p
**q    integer reached through p
```

When printing or comparing addresses, students may focus on the
numerical values. Redirect attention to equality and relationships
between addresses.

For type casts, avoid suggesting that the cast converts the stored
integer into characters. The bytes remain unchanged; the access type
changes.

For function pointers, students may regard code addresses as
fundamentally different from the addresses encountered earlier. At this
level, the useful unifying model is that both data and code occupy
memory and can be referred to by addresses, while their types determine
how the program uses those addresses.

## Suggested pacing

Steps 1--4 should move relatively quickly because arrays and the basic
stack implementation were already covered in the preparation video.

Spend more discussion time on Step 5, because it connects the concrete
stack to the conceptual stack frames from Worksheet 3.

Steps 6--7 are the core pointer exercises. Encourage students to draw
memory before executing code.

Steps 8--9 provide the payoff: the same address-based model is extended
from data to machine instructions and finally to indirect control flow.

If time becomes short, preserve the conceptual sequence rather than
spending too long on platform-specific details of `objdump`.

## Take-away

By the end of the worksheet, students should have a concrete mental
model in which

-   arrays occupy contiguous storage,
-   a stack can be represented by storage plus information describing
    its active part,
-   leaving a stack entry/frame does not imply erasing its bytes,
-   variables occupy memory locations with addresses,
-   pointers store addresses,
-   pointer types determine how memory is accessed,
-   pointer arithmetic connects addresses with array indexing,
-   machine instructions are also stored as bytes at addresses, and
-   function addresses can be stored and used for indirect control flow.

This prepares the ground for later worksheets in which these ideas are
no longer simulated only at the programming-language level but are
connected to the processor and its instruction set.
