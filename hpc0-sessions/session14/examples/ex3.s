	.text
        loadz   0,      %1

        subq    8,      %1,     %1
        call    main,   %3
        movq    (%1),   %4
        addq    8,      %1,     %1
        halt    %4

sum:
        subq    8,      %1,     %1
        movq    %3,     (%1)

        movq    24(%1), %4
        movq    16(%1), %5
        addq    %4,     %5,     %4
        movq    %4,     8(%1)

        movq    (%1),   %3
        addq    8,      %1,     %1
        ret     %3

main:
        subq    8,      %1,     %1
        movq    %3,     (%1)

        subq    24,     %1,     %1
        loadz   12,     %4
        movq    %4,     16(%1)
        loadz   30,     %4
        movq    %4,     8(%1)
        call    sum,    %3
        movq    (%1),   %4
        addq    24,     %1,     %1
        movq    %4,     8(%1)

        movq    (%1),   %3
        addq    8,      %1,     %1
        ret     %3
