# Session 00 — Getting Ready

Unlike the later sessions, Session 00 is not about introducing new programming
concepts. Its purpose is to ensure that everyone starts Session 01 with a
working development environment.

Students are, of course, welcome to install everything beforehand. Instructions
are available for Windows (WSL), macOS, and Ubuntu Linux. However, no
preparation is expected. Students can simply arrive with their laptops, and we
will get everything working together.

Experience from previous years suggests that software installation is one of
the few things in computer science that occasionally resists scientific
explanation. Two students may have identical hardware and operating systems,
yet completely different problems—or no problems at all.

For that reason, Session 00 is intentionally relaxed. We bring power strips,
students bring their laptops, and together we make sure everyone is ready for
Session 01.

Interestingly, there is usually another group of students as well. Many of them
already know me from previous mathematics courses and are curious to see what a
programming course taught by a mathematician looks like. Quite a few install
everything before the semester even starts. This is extremely helpful, because
they often end up assisting fellow students during the installation session.

By the end of Session 00, everyone should have a working Unix environment,
Neovim (or nano), the ABC compiler, and all supporting tools installed. From
Session 01 onwards, we can focus entirely on programming.

## Installation

The installation scripts used in the course are maintained in separate
repositories.

- **macOS**
  - https://github.com/michael-lehn/hpc0-macos-software

- **Ubuntu Linux**
  - https://github.com/michael-lehn/hpc0-ubuntu-software

The Ubuntu setup is also used for **Windows** via **WSL (Windows Subsystem for
Linux)**.

The goal of these repositories is to reduce the installation process to a
single command whenever possible. Keeping the installation separate from the
course material allows the setup to evolve independently as operating systems,
package managers, and compiler versions change over time.

## Lecturer Notes

Unlike the later sessions, Session 00 already includes a small worksheet. Its
purpose is not to teach new concepts but to verify that the installation was
successful. Students work through a few simple tasks:

- using the terminal,
- creating and editing a source file,
- compiling and running a small C program,
- compiling and running a small ABC program.

This serves two purposes.

First, students whose installation already works immediately become familiar
with the basic development workflow:

> edit → compile → run → fix errors

Second, it allows us to focus our attention on the comparatively small group of
students whose installation still causes problems. Instead of waiting for
everyone to finish, the rest of the class already starts working through the
worksheet.

I also hand out a printed Vim cheat sheet during this session. Students are
free to continue using Nano throughout the course, but those who are curious
about Neovim already have a compact reference available from day one.
