# HPC0 Sessions

  - [Session 00 – Getting Ready](session00/README.md)
  - [Session 01 – Top-Down: Experiments with ABC](session01/README.md)

As mentioned in the top-level `README.md`, the `not-abc` language and compiler
were developed as part of my undergraduate course **Introduction to High
Performance Computing** at Ulm University.

This directory contains the teaching material used during the course.

The course was taught in a **flipped classroom** format.

Before each meeting, students watched a collection of short videos introducing
the concepts that would be needed during the next session. The videos were not
pure lectures. Instead, they contained many practical examples, including live
programming, and students were encouraged to follow along by writing the code
themselves.

However, learning to program entirely at home is difficult for beginners.
Problems that look trivial to an experienced programmer can easily become
insurmountable obstacles for someone writing their first programs.

For that reason, the actual programming happened during two-hour classroom
sessions. Students brought their own laptops, and I worked with them
individually until everyone had successfully implemented the exercises on their
own.

The sessions are led by me, together with a teaching assistant who usually
completed the course only a few years earlier. Having recently gone through
exactly the same learning process, they often remember very well where
beginners struggle and can provide a perspective that complements my own.

The worksheets probably convey the atmosphere better than any description
could. In essence, however, a session is simply a room full of people trying to
write software. Some students collaborate, others prefer to work quietly on
their own, and everyone is free to switch between these modes whenever they
like.

Meanwhile, the two of us walk around the room answering questions. Sometimes
the discussion is about compiler design or computer architecture. Sometimes it
is about a missing semicolon. Both are perfectly valid questions. There are no
"stupid questions" during a session.

One advantage of this format is that every semester is different. The videos
remain largely unchanged, but the classroom sessions evolve continuously. The
worksheets are adjusted, explanations change, and discussions naturally follow
the interests and questions of the current group of students. Teaching a small
group makes it possible to respond to individual difficulties instead of
following a fixed script.

The goal was never to present finished solutions, but to help every student
arrive at them independently.

A typical course consists of around **20 students**. No previous programming
experience is assumed.

Designing such a course is surprisingly similar to teaching first-year
mathematics. One cannot simply present all concepts at once. Every session must
start from ideas that students already understand, introduce only a few new
concepts, reinforce important principles through repetition, and prepare the
foundation for future sessions.

In our case, this challenge was called **Tuesday and Friday**. During the
summer semester we met every Tuesday and Friday for two hours. Between these
meetings, students prepared by watching the videos.

The complete course consists of **26 sessions**, numbered **Session 00** to
**Session 25**.

All lecture videos are already available in English (spoken by a German
mathematician with a noticeable accent—but hopefully understandable). The
session worksheets currently exist only in German. I plan to translate them
into English gradually as time permits and make them available here.

Each session directory will also contain a small `README.md` with **lecturer
notes**. These are not part of the student material. Instead, they describe the
motivation behind individual sessions, explain how particular topics fit into
the overall course design, and record observations that may be useful for
others teaching a similar course.

If these materials help someone build a similar course—or simply provide ideas
for teaching programming from first principles—that would make me very happy.


## From here on, we may agree to disagree.

Up to this point, most readers will probably agree with the goals of the course.
From here on, we may start to disagree about the means.

Most people agree on the overall goal: helping students become confident
programmers who understand what computers actually do.

The interesting discussions usually begin when it comes to *how* to achieve
that goal. Different instructors make different choices. The decisions below
reflect my own teaching philosophy and many years of experimenting with this
course.

### Unix from day one

All programming is done in a Unix environment.

Students using Windows install WSL together with Ubuntu. macOS is supported
directly, and students already using Linux are free to use whichever
distribution they prefer.

The goal is not to teach Linux for its own sake. It is simply the environment
in which most of the tools we discuss naturally live.

### The terminal is the primary interface

Students spend most of the course working in a terminal.

Part of the motivation is practical. Early in the course we write assembly
programs before introducing any runtime library. At that point, there is no
`printf()`. The easiest way to observe whether a program behaves correctly is
often through its exit status.

More importantly, the shell exposes what is actually happening. Compiling,
running programs, redirecting input and output, connecting tools through pipes,
and automating tasks become explicit actions instead of hidden button clicks.

In my experience, this gives students a much better mental model of how a
computer system works.

### Full-screen terminal

During the sessions the terminal typically occupies the entire screen.

This is not because graphical interfaces are bad—I happily use them for many
tasks myself—but because reducing distractions helps students focus on the
program they are currently writing and understanding.


### A deliberately small editor choice

Officially, only **Neovim** and **nano** are supported.

Neovim is, in my opinion, one of the best tools ever created for manipulating
text. As programs become larger, students constantly refactor code, move
functions, rename variables, duplicate blocks, and experiment with different
ideas. Efficient text manipulation makes these iterations almost effortless.

Modal editing also turns out to be a surprisingly intuitive real-world example
of a finite state machine long before we formally introduce that concept.

Nano represents almost the opposite end of the spectrum. It is deliberately
simple and can be learned within minutes, but it offers very little support for
large-scale editing.

Every year, however, a few students choose to stay with nano throughout the
entire course. I genuinely admire that, even though I would not want to do it
myself. Because editing is comparatively slow, they naturally develop the habit
of thinking carefully before making changes. Instead of relying on rapid
editing and experimentation, they often aim to get things right on the first
attempt.

Neither approach is inherently better. They simply cultivate different habits
while students are learning to program.

After the course, students are of course free to use whichever editor or IDE
they prefer.
