    call    foo,    %1
    call    bar,    %1
    call    foo,    %1
    call    bar,    %1

    halt    0

foo:
    call    bar,    %1
    putc    'f'
    putc    'o'
    putc    'o'
    putc    '\n'
    ret     %1

bar:
    putc    'b'
    putc    'a'
    putc    'r'
    putc    '\n'
    ret     %1
