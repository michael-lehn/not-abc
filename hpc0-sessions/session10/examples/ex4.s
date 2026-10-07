        call    foo,    %1
        halt    0

foo:
        putc    'f'
        putc    'o'
        putc    'o'
        putc    '\n'

        call    bar,    %1

        ret     %1

bar:
        putc    'b'
        putc    'a'
        putc    'r'
        putc    '\n'

        ret     %1
