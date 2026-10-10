    .text
    loadz   0,      %1

    call    main,   %3
    halt    0

putchar:
    subq    8,      %1,     %1
    movq    %3,     (%1)

    movq    8(%1),  %4
    putc    %4

    movq    (%1),   %3
    addq    8,      %1,     %1
    ret     %3

main:
    subq    8,      %1,     %1
    movq    %3,     (%1)

    subq    8,      %1,     %1
    loadz   '!',    %4
    movq    %4,     (%1)
    call    putchar,%3
    addq    8,      %1,     %1

    subq    8,      %1,     %1
    loadz   '\n',   %4
    movq    %4,     (%1)
    call    putchar,%3
    addq    8,      %1,     %1

    movq    (%1),   %3
    addq    8,      %1,     %1
    ret     %3
