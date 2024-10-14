	.file	"control.c"
	.text
	.globl	check_val
	.type	check_val, @function
check_val:
.LFB0:
	.cfi_startproc
	endbr64
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
	.globl	sum_nums
	.type	sum_nums, @function
sum_nums:
.LFB1:
	.cfi_startproc
	endbr64
	cmpl	%edx, %esi
	jg	.L7
	movslq	%esi, %rcx
	leaq	(%rdi,%rcx,4), %rax
	subl	%esi, %edx
	addq	%rcx, %rdx
	leaq	4(%rdi,%rdx,4), %rcx
	movl	$0, %edx
.L6:
	addl	(%rax), %edx
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L6
.L4:
	movl	%edx, %eax
	ret
.L7:
	movl	$0, %edx
	jmp	.L4
	.cfi_endproc
.LFE1:
	.size	sum_nums, .-sum_nums
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
