.text
    loadz   0,      %1

    subq    24,     %1,     %1
    call    main,   %3
    movq    16(%1), %4
    addq    24,     %1,     %1
    halt    %4

sum:
    movq    %3,     (%1)	# store return address
    movq    %2,     8(%1)	# store current frame pointer
    movq    %1,     %2		# set new frame pointer
    subq    .loc0,  %1,	    %1	# space for local variables

    // begin of function body
    movq    32(%2), %4
    movq    24(%2), %5
    addq    %4,     %5,     %4
    movq    %4,	    -8(%2)	# store result in local variable

    movq    -8(%2), %4		# return local variable
    movq    %4,     16(%2)
    // end of function body

    movq    %2,     %1		# restore previous stack pointer
    movq    8(%1),  %2		# restore previous frame pointer
    movq    (%1),   %3		# restore return address
    ret     %3

    .equ    .loc0,  8		# space for local variables

main:
    movq    %3,     (%1)	# store return address
    movq    %2,     8(%1)	# store current frame pointer
    movq    %1,     %2		# set new frame pointer

    subq    40,     %1,     %1
    loadz   12,     %4
    movq    %4,     32(%1)
    loadz   30,     %4
    movq    %4,     24(%1)
    call    sum,    %3
    movq    16(%1), %4
    addq    40,     %1,     %1

    movq    %4,     16(%2)

    movq    %2,     %1		# restore previous stack pointer
    movq    8(%1),  %2		# restore previous frame pointer
    movq    (%1),   %3		# restore return address
    ret     %3

