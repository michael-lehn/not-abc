        loadz   0,      %1

        call    foo,    %2
        halt    0

foo:
        subq    8,      %1,     %1
        movq    %2,     (%1)

        putc    'f'
        putc    'o'
        putc    'o'
        putc    '\n'

        call    bar,    %2

        movq    (%1),   %2
        addq    8,      %1,     %1
        ret     %2

bar:
        subq    8,      %1,     %1
        movq    %2,     (%1)

        putc    'b'
        putc    'a'
        putc    'r'
        putc    '\n'

        movq    (%1),   %2
        addq    8,      %1,     %1
        ret     %2
