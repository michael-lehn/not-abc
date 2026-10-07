G   getc    %1
    subq    0xFF,   %1,     %0
    jz      H
    putc    %1
    jmp     G
H   halt    0
