# Decoding Control Flow from Assembly

## Overview

The goal of this assignment is to practice the mapping between C code and 
assembly, focusing on code that includes a conditional, nested conditional,
or loop structure, and may include array accesses. You can easily convert 
C code into assembly using the `gcc`. Here, you will once again go the other 
direction: decode assembly code for a function and write the C code that generates
**identical assembly!**

You will create a C code file that contains nothing other than two function
definitions. **While not required, you _may_** create an additional main program code
file so that you can make sample calls to the function to check how it works.


### Rubric

* Overall (2 pts)
    - The `control.c` file contains two function definitions, no include statements,
    no main function; it does include a descriptive comment at the top with your name in it.

* `check_val` (20 pts)
    - Correct function name, correct number and type of input parameters and return value
    - Correct types for local variables
    - Correct control structures (conditionals and loops, nested or not, array accesses)
    - Correct arithmetic calculations
    - Explicit casting if needed

* `sum_nums` (14 points)
   - Correct function name, correct number and type of input parameters and return value
    - Correct types for local variables
    - Correct control structures (conditionals and loops, nested or not, array accesses)
    - Correct arithmetic calculations
    - Explicit casting if needed

### Starter Files

* `completed_control_opt0g.s`
    - This file contains target assembly code for the base level of optimization,
    with comparisons, jumps, and conditional jumps. It contains code for two separate
    functions. You need to determine C code that would generate this exact assembly
    (**and** the assembly in the next file).
* `completed_control_opt01.s`
    - This file contains target assembly code for the Level 1 optimization.
    This code was generated from the same starting C code as the previous file:
    you should determine C code that matches **both** these files.
* `Makefile`
    - This makefile contains targets for generating assembly code for two
    optimization levels at the same time, based on your definition of the file 
    `control.c`. It implements `make compare` just like the previous assignment, which
    will check both the files above against the two new `.s` files it creates.

### Execution

As always, the graders should be able to build, check, and clean your code:

```
make clean
make
make compare
```

The last command should, ideally, print **nothing**!

### Checking your work

The `make compare` command works just as on the previous assignment. It will use
the `diff` shell program to compare the provided assembly to what the compiler
makes for your C program. First run `make`, and then run `make compare`. 

(See homework 3 for more discussion of how `diff` works, or look up its documentation!)

## Tasks to Complete

### Task 1: Understand the assembly code

- Make a copy of the each of the completed assembly files: `completed_control_opt0g.s` and 
`completed_control_opt01.s`. This is so that you can add notes and comments to the 
copy, without changing the original file.

- Determine the number and type of input parameters to each function, and the
type of the return value. For input parameters: look for registers that are **used** without
first being given a value.
- For each line, determine the effect of the line, tracking data moving around, and 
write the result in pseudocode
- This code may use `lea` to compute arithmetic, **or** to compute a memory address

You will create a C code file that contains nothing other than two function 
definitions. **While not required, you _may_** create an additional main program code
file so that you can make sample calls to the three functions to check what they do.

### Task 2: Write the C functions

- Create the C functions, making sure to use the correct type and number of input
parameters and the correct return type
- Look at the steps in the assembly language, and determine a condensed number of steps
for your C code
    - Sometimes the assembly code may cast between types (seen as a combination of different
    register sizes in a single instruction). Use **explicit casting** in your C code
    when this happens.
    - Be prepared to try different ways to condense the code if needed
    - Use reasonable variable names and good coding style throughout!

