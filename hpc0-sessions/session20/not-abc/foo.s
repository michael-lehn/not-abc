	.text
	loadz 	0, 	%1

	subq 	24, 	%1, 	%1
	call 	main, 	%3
	movq 	16(%1), 	%4
	addq 	24, 	%1, 	%1
	halt 	%4

putchar:
	movq 	%3, 	(%1) 		# store return address
	movq 	%2, 	8(%1) 		# save previous frame pointer
	movq 	%1, 	%2 		# set new frame pointer
	subq 	.loc0, 	%1, 	%1
	// begin of function body
	movq 	24(%2), 	%4
	putc 	%4
	// end of function body
.leave0:
	movq 	%2, 	%1 		# restore stack pointer
	movq 	8(%1), 	%2 		# restore previous frame pointer
	movq 	(%1), 	%3 		# restore return address
	ret 	%3
	.equ 	.loc0, 	0
getchar:
	movq 	%3, 	(%1) 		# store return address
	movq 	%2, 	8(%1) 		# save previous frame pointer
	movq 	%1, 	%2 		# set new frame pointer
	subq 	.loc1, 	%1, 	%1
	// begin of function body
	getc 	%4
	movq 	%4, 	16(%2)
	// end of function body
.leave1:
	movq 	%2, 	%1 		# restore stack pointer
	movq 	8(%1), 	%2 		# restore previous frame pointer
	movq 	(%1), 	%3 		# restore return address
	ret 	%3
	.equ 	.loc1, 	0
diff:
	movq 	%3, 	(%1) 		# store return address
	movq 	%2, 	8(%1) 		# save previous frame pointer
	movq 	%1, 	%2 		# set new frame pointer
	subq 	.loc2, 	%1, 	%1
	// begin of function body
	addq 	24, 	%2, 	%4
	movq 	(%4), 	%4
	addq 	32, 	%2, 	%5
	movq 	(%5), 	%5
	subq 	%5, 	%4, 	%4
	movq 	%4, 	16(%2) 		# store return value
	jmp .leave2
	// end of function body
.leave2:
	movq 	%2, 	%1 		# restore stack pointer
	movq 	8(%1), 	%2 		# restore previous frame pointer
	movq 	(%1), 	%3 		# restore return address
	ret 	%3
	.equ 	.loc2, 	0
main:
	movq 	%3, 	(%1) 		# store return address
	movq 	%2, 	8(%1) 		# save previous frame pointer
	movq 	%1, 	%2 		# set new frame pointer
	subq 	.loc3, 	%1, 	%1
	// begin of function body
	subq 	40, 	%1, 	%1
	loadz 	2, 	%4
	loadz 	7, 	%5
	loadz 	8, 	%6
	addq 	%6, 	%5, 	%5
	imulq 	%5, 	%4, 	%4
	movq 	%4, 	32(%1)
	loadz 	8, 	%4
	loadz 	8, 	%5
	imulq 	%5, 	%4, 	%4
	loadz 	10, 	%5
	addq 	%5, 	%4, 	%4
	loadz 	2, 	%5
	subq 	%5, 	%4, 	%4
	movq 	%4, 	24(%1)
	call 	diff, 	%3
	movq 	16(%1), 	%4
	addq 	40, 	%1, 	%1
	movq 	%4, 	16(%2) 		# store return value
	jmp .leave3
	// end of function body
.leave3:
	movq 	%2, 	%1 		# restore stack pointer
	movq 	8(%1), 	%2 		# restore previous frame pointer
	movq 	(%1), 	%3 		# restore return address
	ret 	%3
	.equ 	.loc3, 	0
