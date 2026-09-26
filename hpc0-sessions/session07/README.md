# HPC0 --- Session 7: Pointers, Structs, Lists, ...

## Lecturer Notes

### Preparation

Before the session, students should watch:

-   [(ABC Examples 8) Structs: First
    Examples](https://www.youtube.com/watch?v=RyXc5Pz7AbM) --- up to
    about 13 min
-   [(ABC Examples 9) Structs: More
    Examples](https://www.youtube.com/watch?v=u-6vep2bu5A) --- up to
    about 21 min
-   [(ABC Examples 10) Dynamic Memory: Some Technical
    Background](https://www.youtube.com/watch?v=QlVOioZq2P0) --- up to
    about 21 min

The worksheet deliberately connects several topics that have appeared
earlier in the course: pointers, the memory layout of a process, stack
frames, `struct` objects, and now dynamic memory. The aim is not to
treat these as isolated language features. Students should increasingly
see them as different views of the same underlying machine model.

## Learning Objectives

After completing the worksheet, students should be able to:

-   distinguish between valid, uninitialized, and null pointers and
    explain why dereferencing an invalid pointer results in undefined
    behavior;
-   relate pointer initialization to storage location, especially global
    variables in the BSS/data segment versus local variables on the
    stack;
-   use `nullptr` deliberately, both as an invalid pointer value and as
    the end marker of a linked structure;
-   allocate memory dynamically with `malloc`, check whether allocation
    succeeded, and use `sizeof` without unnecessarily repeating a type;
-   explain the basic responsibilities associated with `malloc` and
    `free`, including memory leaks, invalid `free`, and double `free`;
-   explain why a self-referential `struct Node` can contain a pointer
    to `Node`;
-   construct and traverse a singly linked list;
-   reason about pointer-manipulating code by drawing memory regions and
    following changes statement by statement;
-   recognize the connection between recursive traversal and the
    recursive structure of a linked list.

## Step 1 --- Invalid Pointers

The first experiment intentionally dereferences two uninitialized
pointer variables: a local pointer `p` and a global pointer `q`.

The important point is that these two variables do **not** start in the
same situation. The global variable has static storage and is
initialized as part of the program image/startup semantics; the local
variable does not receive such an initialization. This gives an
opportunity to reconnect the top-down programming discussion with the
process memory layout from the lecture: BSS/data segment versus stack.

Do not reduce the exercise to "uninitialized pointers crash." In fact,
the interesting case is when the local invalid pointer does **not**
immediately cause a segmentation fault. Students should understand why
this is worse: undefined behavior can remain unnoticed and can be
non-deterministic.

The footnote about the segmentation fault is intentionally more
technical than the main text. At the level of the worksheet, "the
operating system terminates the program" is a useful description. More
precisely, an invalid memory access is detected by the hardware and
subsequently handled by the operating system.

A useful discussion question is: *Where did the bad pointer originate,
and where did the program finally fail?* In a larger program these
locations may be far apart, which is one reason pointer bugs can be
difficult to debug.

## Step 2 --- Null Pointers

The purpose of `nullptr` here is not merely syntactic. It gives students
a deliberate representation for "this pointer currently does not refer
to an object."

Contrast this with the uninitialized local pointer from Step 1. Both
must not be dereferenced, but only one has a deliberately chosen and
recognizable state.

Also point out the connection to linked data structures: later in the
worksheet, `nullptr` will mark the end of a list. Thus the same concept
introduced here as a defensive programming tool becomes part of the
representation of a data structure.

The remark that `nullptr` need not be represented by the numeric value
zero is useful preparation for the later memory diagrams, where zero is
used only as an explicitly stated example for a particular imagined
architecture.

## Step 3 --- A Pattern for Using `malloc`

This step establishes a pattern that students should reuse:

1.  allocate;
2.  check the returned pointer;
3.  only then use the allocated object.

The exit-code exercise deliberately reconnects the program with the
shell (`echo $?`). The value `42` is only for testing and makes it
obvious that students are observing the exit status rather than normal
program output.

The `sizeof` tasks are important. Students should progress from a
hard-coded byte count, through `sizeof(int)`, to the more robust idiom

``` abc
malloc(sizeof(*p))
```

which continues to work when the type of `p` changes.

The final task distinguishes compile-time initialization of a global
variable from an operation that necessarily happens at runtime. This is
another deliberate connection to the memory-layout discussion rather
than an isolated rule of the ABC language.

The footnote about allocation failure is intentionally more nuanced than
"the machine ran out of RAM." System/process limits, virtual address
space, virtual memory, and overcommit make the real situation more
subtle. These details do not need to be developed during the session
unless students ask.

## Step 4 --- Memory Leaks and Using `free`

This step is primarily experimental. The supplied program contains an
invalid `free` and a double `free`, and students should observe that
undefined behavior does not imply one particular visible result.

Encourage students to compare results with neighbors and, where
possible, on different platforms. A crash, an allocator diagnostic, or
an apparently successful run are all useful observations. The important
conclusion is that none of these outcomes makes the program correct.

The three rules in the worksheet separate three issues:

-   every successful allocation should eventually be released;
-   `free` must receive the original allocation address (or `nullptr`),
    not an address inside the block;
-   an allocation must not be released more than once.

The remark about `void` pointers and allocator bookkeeping is meant as a
first implementation-level explanation, not as a specification of how
every allocator works. The diagram should be read as one possible
implementation: metadata may be stored adjacent to the block, allowing
`free` to recover information such as the allocation size from the
pointer alone.

## Step 5 --- A First Singly Linked List

This example is intentionally somewhat unusual: the linked list is built
**without dynamic memory allocation**. The nodes `a`, `b`, and `c`
already exist as global variables.

This separation is pedagogically useful. Students can first understand
the essential idea of a linked list---nodes connected by
pointers---without simultaneously reasoning about object creation and
lifetime on the heap.

The self-reference in

``` abc
struct Node
{
    val: array[8] of char;
    next: -> Node;
};
```

is worth discussing carefully. When the compiler reaches `next`, it does
not yet need to know the size of `Node`; it only needs to know the size
of a pointer. This is a useful distinction between an incomplete object
type and a pointer to that type.

The final task, rearranging the links so that the output becomes
`hello, world!`, should reinforce that the order of nodes in a linked
list is determined by the pointer values, not by the order in which the
objects happen to appear in memory or in the source code.

## Step 6 --- Dynamically Allocated Linked Lists

This step combines the ideas developed separately in the preceding
steps.

The initial example deliberately omits the `malloc` check so that
attention can first remain on the pointer manipulations. The worksheet
explicitly calls this out. Later in the step, students are required to
add the check themselves, reusing the pattern from Step 3.

For the first two nodes, insist on statement-by-statement reasoning:

``` abc
local n1: -> Node = malloc(sizeof(*n1));
n1->val = 42;
n1->next = list;
list = n1;
```

Students should understand that `malloc` creates a memory region, while
`n1` merely stores its address. The assignment `list = n1` does not move
or copy the node; it copies an address.

The central prepend pattern is:

``` abc
n->next = list;
list = n;
```

The first assignment connects the new node to the previous head. The
second changes the head of the list.

### Hint --- Visualizing What Happens

The extended hint is also intended to teach a general technique for
reasoning about low-level programs.

There is no single perfect memory diagram. A useful model leaves out
enough detail to make the important mechanism visible, but not so much
that the model becomes false or misleading. More detail can be added
later when it becomes relevant.

For this worksheet, local variables are represented as distinct stack
locations. This deliberately ignores compiler optimizations such as
keeping values in registers. Later, when functions are implemented in
assembly, students will see more precisely how stack frames and function
prologues can reserve storage for local variables. This is a useful
example of the general teaching problem of hiding technical detail
without lying about the machine.

The diagrams then refine the model one statement at a time. Using
invented concrete addresses such as `1024` is particularly useful: it
emphasizes that the arrows in a pointer diagram are only a graphical
representation of address values stored in memory.

After the complete walkthrough for `n1`, students should construct the
corresponding sequence for `n2` themselves. The final picture should
make it visually clear why the resulting list contains `12` followed by
`42`, and why `nullptr` in the `next` member marks the final node.

### Traversal, Generalization, and Recursion

Removing first one node and then both nodes is intended to make the
empty-list case explicit. Students should see that the traversal loop
handles an empty list naturally because its condition is false
immediately.

When the explicit construction of `n1` and `n2` is replaced by a loop,
the code has become general enough to create an arbitrary number of
nodes. The request for exactly 42 nodes is deliberately playful: the
number itself is irrelevant.

At this point students must add the `malloc` check that was omitted from
the introductory example.

Moving traversal into `printList` revisits call-by-value. The parameter
named `list` is modified during traversal, but this does not modify the
`list` variable in `main`.

The recursive `printListRecursive` then provides a second traversal
model. Ask students to identify the value of `list` in successive calls
and the base case. `printListReverse` should ideally be discovered from
the observation that printing *after* the recursive call reverses the
order.

This also prepares the recursive `freeList` shown on the final page.

## Chillout --- Putting It All Together

The final page deliberately contains no tasks. It shows a compact
version in which the important list operations have been moved into
functions.

Students are not yet expected to derive all of this code independently.
In particular, two ideas are previews of material developed later:

-   `prependToList` receives a pointer to a pointer because it must
    modify the head pointer in `main`. This will later be discussed as
    implementing call-by-reference behavior using call by value.
-   `freeList` recursively frees the remainder of the list before
    freeing the current node. After `free(list)`, evaluating
    `list->next` would no longer be valid.

The recursive `freeList` is deliberately placed after the recursive
printing exercise. Structurally, it uses the same idea as reverse
traversal: perform the recursive operation on `list->next` before acting
on the current node.

For exam preparation, students can return to this page and ask whether
they can explain every line. If the pointer-to-pointer or `freeList`
parts are still unclear, the later linked-list worksheet develops these
topics explicitly.

## Teaching Perspective

The main theme of this session is not linked lists by themselves. It is
the interaction between several concepts that students have encountered
at different levels:

**process memory layout → pointer values → object lifetime → dynamic
allocation → structs → linked data structures → function calls and
recursion**

Whenever possible, make these connections explicit. HPC0 is most useful
when students stop seeing the machine model, assembly, compiler
behavior, and high-level programming as separate subjects.

A particularly useful habit to reinforce throughout the session is:
**when pointer code becomes confusing, draw the memory and change the
drawing one statement at a time.**
