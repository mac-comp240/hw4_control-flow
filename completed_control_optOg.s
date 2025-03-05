	.file	"control.c"
	.text
	.globl	check_val
	.type	check_val, @function
check_val:
.LFB0:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	js	.L3
	movswl	%di, %edi
	movswl	%si, %esi
	leal	10(%rdi,%rsi), %eax
	leal	(%rax,%rax,2), %ecx
	leal	(%rax,%rcx,4), %ecx
	movl	%ecx, %eax
	cmpl	%ecx, %edx
	jg	.L4
	ret
.L3:
	movl	$0, %eax
	ret
.L4:
	movl	%edx, %eax
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
	movl	$0, %eax
	jmp	.L6
.L7:
	movslq	%esi, %rcx
	addl	(%rdi,%rcx,4), %eax
	addl	$1, %esi
.L6:
	cmpl	%edx, %esi
	jle	.L7
	ret
	.cfi_endproc
.LFE1:
	.size	sum_nums, .-sum_nums
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
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
