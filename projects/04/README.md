# Learning Machine Language

## Goal

This project is to get used to using a machine language. A machine language is an agreed upon set of mnemonics that are assembled into agreed-upon binary codes to perform operations. Machine Language is used to manupulate a memory using a processor and a set of registers. 

## The Computer Architecture so far

It is a 16 bit machine consisting of the following:
```

Data memory: RAM - An addressable sequence of registers
Instruction memory: ROM - An addrssable sequence of registers
Processing: ALU capapble of performing a certain number of computing operations
Program counter: PC, Holding an address
Control: The instruction memory is loaded with a sequence of 16-bit instructions, one per memory location, beginning at address 0.
Instructions sets: Of which there are two types:
	- A-instruction: Where the value is a number or symbol referring to a number (The A register will contain the register number and M will contain the value stored at the register)
	- C-intruction:  Where the instruction specifies a destination to equal a computation and then optionally a jump to another part of the program.
```
## A & C Instructions

The A-intruction is used to set the A register to a 15 bit value:

Binary: 0vvv vvvv vvvv vvvv (where v = 0 or 1)

For example the instruction @10 will set register A to the value of 10. We use this register for three reasons:
	- As the only means to enter a constant value into the computer
	- sets the stage for a C-instruction to manipulate a register numbered A
	- sets the stage for a C-instruction that specifies a jump by loading the address of jump destination to the A register

The C ins#####################################

##Commands used in this project

A-command: @value 
C-command: dest = comp ; jump 
// are optional
Where:
comp = ```0 , 1 , -1 , D , A , !D , !A , -D , -A , D+1 ,
A+1 , D-1, A-1 , D+A , D-A , A-D , D&A ,
D|A , M , !M , -M ,M+1, M-1 , D+M , D-M ,
M-D , D&M , D|M```
dest = ```M , D , MD , A , AM , AD , AMD, or null```
jump = ```JGT , JEQ , JGE , JLT , JNE , JLE , JMP, or null```

In the command ```dest = comp; jump```, the jump materialzes
if (comp jump 0) is true. For example, in D=D+1,JLT,
we jump if D+1 < 0

## Project Specifications

In this project I have built two programs, ```Mult.asm``` and ```Fill.asm```. 

```Mult.asm``` computes the value contained in R0 (register 0) multiplied with the value contained in R1 (register 1) and stores it in R2 (register 2). The program assumes that both R0 >= 0 and R1 >= 0.  

```Fill.asm``` Runs a program that listens the the keyboard input and when a key is pressed the program will change every pixel on the screen to black. The screen should remain black until the key is let go. When the key is let go the screen should return to black.