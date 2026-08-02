# Session 00 — Getting Ready

Unlike the other sessions, Session 00 does not have a worksheet.

Its purpose is simply to make sure that every student starts the course with a
working development environment. In practice, this means installing the
required software, testing the tools, and solving the inevitable installation
problems before the actual course begins.

Students are, of course, welcome to install everything beforehand. Instructions
are available for Windows (WSL), macOS, and Ubuntu Linux. However, no
preparation is expected. Students can simply arrive with their laptops, and we
will get everything working together.

Experience from previous years suggests that software installation is one of
the few things in computer science that occasionally resists scientific
explanation. Two students may have identical hardware and operating systems,
yet completely different problems. Or no problems at all.

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
