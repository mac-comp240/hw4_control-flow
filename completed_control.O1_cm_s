	.file	"control.c"
	.text
	.globl	check_val
	.type	check_val, @function
check_val:
.LFB0:
	.cfi_startproc
	movl	$0, %eax
	testl	%edx, %edx
	js	.L1
	movswl	%di, %edi
	movswl	%si, %esi
	leal	10(%rdi,%rsi), %eax
	leal	(%rax,%rax,2), %ecx
	leal	(%rax,%rcx,4), %eax
	cmpl	%edx, %eax
	cmovl	%edx, %eax
.L1:
	ret
	.cfi_endproc
.LFE0:
	.size	check_val, .-check_val
	.ident	"GCC: (GNU) 8.3.1 20190311 (Red Hat 8.3.1-3)"
	.section	.note.GNU-stack,"",@progbits
