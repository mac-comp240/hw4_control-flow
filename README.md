# Decoding Control Flow from Assembly

In this assignment, you will create a C function called `check_val` inside the
file `control.c`. This function takes in some arguments of various types and
does some arithmetic on them, using a coding style that avoids implicit casting
and never narrows any variables. It returns a value whose type you will need to
determine. Your goal is to create a `control.c` that compiles into the assembly
code provided.

A Makefile has been provided for you. This Makefile will compile `control.c`
into assembly at two different levels of optimization.


There are copies of the assembly code files with `completed_` in their name for reference. 


## 1: Less Optimized Assembly

The first version of the assembly is compiled with the -Og flag into a
file called `control.no_cm_s`. Study the assembly in the completed version of
that file carefully.

## 2: Conditional Move Assembly 

The other version of the assembly code his compiled with the -O1 option into the
file `control.O1_cm_s`. Study the completed version of this file carefully.

# Important Notes

- Put your name in the `control.c` file.

- There are two if statements in the code that produced the assembly files that
  you are given. 

- Pay attention to the types of the input parameters (you will have to determine
  how many there are) and the type of the return value of the function.

- In general you can ignore the *indented* assembly directives that begin with a
  'dot', such as the `.cfi_XXX` directives.

- You will need to look up and recall what the jump, compare, and test
  instructions do.
