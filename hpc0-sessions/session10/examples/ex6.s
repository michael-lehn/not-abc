        loadz   0,      %1

        loadz   42,     %3
        call    foo,    %2
        halt    0

foo:
        subq    8,      %1,     %1
        movq    %2,     (%1)

	subq	1,	%3,	%0
	jz	.foo.ret

	subq	1,	%3,	%3

        putc    'f'
        putc    'o'
        putc    'o'
        putc    '\n'

        call    foo,    %2

.foo.ret:
        movq    (%1),   %2
        addq    8,      %1,     %1
        ret     %2

