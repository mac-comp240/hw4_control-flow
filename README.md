# Determine the C code

The Makefile creates 2 versions of assembly code for a function called `check_val` that you should create inside the file called control.c. This function takes in some arguments of various types and does some arithmetic on them, using code coding style that avoids implicit casting and never narrows any variables. It returns a value whose type you will need to determine.


## Version 1 of the assembly: less optimized

Note that one version of the assembly has been compiled with the -Og flag into a file called control.no_cm_s and the code for `check_val` in it looks like this:

```
check_val:
.LFB0:
	.cfi_startproc
	testq	%rdx, %rdx
	js	.L3
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addq	%rdi, %rsi
	movq	%rsi, %rax
	salq	$4, %rax
	subq	%rsi, %rax
	addq	$24, %rax
	cmpq	%rdx, %rax
	jg	.L4
	rep ret
.L3:
	movl	$0, %eax
	ret
.L4:
	movq	%rdx, %rax
	.p2align 4,,4
	ret
	.cfi_endproc
```

### Some notes about this assembly

<!--
There is one oddity in this code that needs a small amount of explanation: the instruction called `rep ret`. Apparently the gcc compiler will create code with this type of return when a return is done immediately after a jump. (You could look up info about this if you are curious- it is due to just a couple of AMD processor models that did not behave well in this situation.) You can simply treat it as a return.
-->


In general you can ignore the *indented* assembly directives that begin with a 'dot', such as the .cfi_XXX directives and the .p2align directive. This latter one sometimes gets added by the compiler to ensure that instructions can get fetched and decoded efficiently.


You will need to look up and recall what the js instruction does, and the testq just ahead of it.

## Version 2 of the assembly: contains conditional move statements

The other version of the assembly code has been compiled with the -O1 option in file control.O1_cm_s, and its `check_val` code looks like this:

```
check_val:
.LFB0:
	.cfi_startproc
	testq	%rdx, %rdx
	js	.L3
	movslq	%edi, %rdi
	movslq	%esi, %rsi
	addq	%rdi, %rsi
	movq	%rsi, %rax
	salq	$4, %rax
	subq	%rsi, %rax
	addq	$24, %rax
	cmpq	%rdx, %rax
	cmovg	%rdx, %rax
	ret
.L3:
	movl	$0, %eax
	ret
	.cfi_endproc
```

Your goal is to fill in the empty file check_val.c with code the when compiled with make creates the assembly code given.

There are copies of the assembly code files with `completed_` in their name for reference. 

## Important Notes

- Put your name in the control.c file.

- There are two if statements in the code that produced the assembly files that you are given. 

- Pay attention to the types of the input parameters (you will have to determine how many there are) and the type of the return value of the function.

