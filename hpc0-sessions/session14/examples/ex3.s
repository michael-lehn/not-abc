        .text
        loadz   0,      %1

        subq    8,      %1,     %1
        call    main,   %3
        movq    (%1),   %4
        addq    8,      %1,     %1
        halt    %4

diff:
        subq    8,      %1,     %1
        movq    %3,     (%1)

        movq    16(%1), %4           # fetch a
        movq    24(%1), %5		 # fetch b
        subq    %5,     %4,     %4   # subtract b from a
        movq    %4,     8(%1)

        movq    (%1),   %3
        addq    8,      %1,     %1
        ret     %3

main:
        subq    8,      %1,     %1
        movq    %3,     (%1)

	subq    24,     %1,     %1
        loadz   72,     %4
        movq    %4,     8(%1)
        loadz   30,     %4
        movq    %4,     16(%1)
        call    diff,   %3
        movq    (%1),   %4
        addq    24,     %1,     %1

        movq    %4,     8(%1)

        movq    (%1),   %3
        addq    8,      %1,     %1
        ret     %3
