// Program flips values of RAM[0] and RAM[1]

// set D equal to values of register 1
@R1
D=M

// find next available register and store value and use variable 'temp' to access it
@temp
M=D

//  Give register 1 register 0's value
@R0
D=M
@R1
M=D

// Give register 0 the value we stored in temp
@temp
D=M
@R0
M=D

// End program with an infinite loop
(END)
@END
0;JMP
