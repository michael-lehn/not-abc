    loadz   0,      %2

G   getc    %1
    subq    0xFF,   %1,     %0
    jz      H
    subq    '9',    %1,     %0
    ja      H
    subq    '0',    %1,     %0
    jb      H
    mulw    10,     %2,     %2
    subq    '0',    %1,     %1
    addq    %1,     %2,     %2
    jmp     G

H   halt    %2
