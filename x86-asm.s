        .text
        .globl  _start

# ------------------------------------------------------------
# Entry point
# ------------------------------------------------------------

_start:
        call    main

        # exit(main_return_value)
        movq    %rax, %rdi              # exit status
        movq    $60, %rax               # SYS_exit
        syscall


# ------------------------------------------------------------
# int64_t main(void)
# ------------------------------------------------------------

main:
	pushq   %rbp
        movq    %rsp, %rbp
	# local vars
	subq	$8, %rsp		# ch has address %rsp
	# begin of function body 

	# ch = getchar() + 1
	call	getchar
	addq	$1,  %rax
	movq	%rax,	(%rsp)


        # putchar(ch)
	movq	(%rsp),	%rax
	pushq	%rax			# firt argument
        call    putchar
        addq    $8, %rsp                # remove argument

        movq    $42, %rax               # return 42

	# end of function body 
	movq    %rbp, %rsp
        popq    %rbp
        ret


# ------------------------------------------------------------
# int64_t putchar(int64_t ch)
#
# Stack on entry:
#
#       0(%rsp)   return address
#       8(%rsp)   ch
# ------------------------------------------------------------

putchar:
        movq    $1, %rax                # SYS_write
        movq    $1, %rdi                # file descriptor stdout
        leaq    8(%rsp), %rsi           # address of low byte of ch
        movq    $1, %rdx                # number of bytes
        syscall

        movq    8(%rsp), %rax           # return ch
        ret

# ------------------------------------------------------------
# int64_t getchar(void)
#
# Return value:
#   %rax = character read (0...255)
#         -1 on EOF or error
# ------------------------------------------------------------

getchar:
        subq    $8, %rsp                # Allocate temporary storage

        movq    $0, %rax                # SYS_read
        movq    $0, %rdi                # File descriptor: stdin
        movq    %rsp, %rsi              # Address of input buffer
        movq    $1, %rdx                # Read one byte
        syscall

        cmpq    $1, %rax                # Was exactly one byte read?
        jne     .getchar_eof

        movzbq  (%rsp), %rax            # Zero-extend byte to 64 bits
        addq    $8, %rsp                # Release temporary storage
        ret

.getchar_eof:
        movq    $-1, %rax               # Return EOF
        addq    $8, %rsp                # Release temporary storage
        ret
