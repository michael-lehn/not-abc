# Session 8 — ULM on Paper

## Lecturer Notes

This session is one of the highlights of HPC0, even though students do not work at a computer. There is deliberately **no conventional worksheet**: the activity is meant to be experienced in person. Students become the processor and execute a program by hand, one instruction at a time.

## Preparation

Students should watch the introductory video before the session:

- [ULM (Ulm Lecture Machine) on Paper](https://www.youtube.com/watch?v=oL7ePbjtdmQ)

A separate review video shows the paper activity and then demonstrates how the
same program—and longer programs—run in hardware on a Lattice iCE40UP5K FPGA:

- ["ULM on Paper" and the "ULM on iCE" (Lattice iCE40UP5k FPGA)](https://www.youtube.com/watch?v=ZLhX-sCP4pU)

### Printable materials

- **`ULMonPaper-HowTo.pdf`** — memory and register conventions, the four stages
  of the von Neumann instruction cycle, the instruction set used in the
  exercise, and an ASCII table.
- **`ULMonPaper - InitialState.pdf`** — the starting machine state: memory
  containing the program, `%IP`, `%IR`, general-purpose registers, flags, an
  output device, and an instruction-cycle counter.

### Physical materials

Provide each student (or small group) with:

- A printed initial-state sheet, punched for a binder.
- A transparent, writable overlay (e.g. overhead-projector film), punched to match the sheet.
- Small writable adhesive labels/stickers and a pen.
- A binder in which successive machine states can be kept aligned.
- The printed How-To document, including the instruction set and ASCII table.

Punching both the paper and the transparent overlay is important: the register
and memory positions must remain aligned as new layers are added.

## In-class activity — Become the CPU

The starting sheet represents a machine with a program already loaded into
memory. Memory addresses and bytes are shown in hexadecimal, along with the
instruction pointer `%IP`, the instruction register `%IR`, general-purpose
registers, and status flags.

Students repeatedly carry out the **von Neumann cycle** described in the How-To
document:

1. **Fetch.** Read the 32-bit instruction from the four memory bytes starting
   at the address in `%IP`. Write the fetched instruction into `%IR` on a new
   label on the transparent overlay.
2. **Decode.** Find the bit pattern in the instruction-set table and identify
   the operation and its operands.
3. **Execute.** Perform exactly the specified operation by hand. For every
   changed register, flag, or memory location, place a new label at its
   position and write the new value. For example, if an instruction adds two
   register values and stores the result in a register, calculate that result
   and update the destination register.
4. **Increment.** **Only if `%IP` was not modified during execution**, advance
   `%IP` by four bytes. The physical clue is wonderfully simple: if no new
   label was placed over `%IP` during execution, it must be incremented. If the
   instruction changed `%IP`, do not increment it again.

After stage D, advance the instruction-cycle counter and begin the next cycle.
Continue until a `halt` instruction is executed in the execute stage. Record
its exit code.

**Important:** Do not erase the previous state. Keep the old paper/overlay
states in order and add a fresh layer for each successive state. The resulting
stack of sheets is a *flipbook* of the program's execution: students can trace
how the machine evolved, instruction by instruction.

## The program and its output

The loaded program is a small **Hello World** demonstration. In the hands-on
activity, students execute only enough of it to output the first character,
**`H`**. Simulating every character by hand would take too long. The
output-device field on the sheet makes the I/O effect visible without requiring
an actual computer.

This is also a nice moment to contrast the paper CPU with real hardware:
conceptually the machine performs the same sequence of fetch, decode, execute,
and instruction-pointer updates, but the hardware does it vastly faster. The
review video makes this connection tangible by running the same program, as
well as longer programs, on an FPGA.

## Mentoring and discussion

This session benefits from active supervision. Encourage students to consult
the instruction-set description rather than guessing what an instruction means.
In particular, watch for:

- Reading four **bytes** to form one 32-bit instruction, while `%IP` advances
  in steps of four.
- Distinguishing the instruction's encoding from its effect on registers,
  flags, memory, and output.
- Treating `%0x0` as the special zero register: writes to it have no effect.
- Updating the status flags when the instruction-set specification requires it.
- Handling branches correctly: a changed `%IP` must **not** be incremented
  again.
- Keeping each successive state legible and aligned so the execution history
  can be reconstructed.

The goal is not to finish as quickly as possible. It is to understand, at the
level of individual state changes, what it means for a processor to *execute* a
program.

## Why this session matters

Students have previously worked with digital logic and registers. Here those
components come together as a programmable machine: a stored program, an
instruction register, an instruction pointer, a register file, and a precisely
specified instruction cycle. Later, when students write assembly code, build
compiler components, and run programs on the ULM, they can connect those
abstractions to something they have literally done with their own hands.

A video can demonstrate the result. **The paper, transparencies, and stickers
are what make the experience memorable.**
