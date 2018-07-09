//draw a rectangle on screens top left corner

@SCREEN
D=A

@addr // addr = 16384 (screens base address)
M=D

// n = ram[0]
@0
D=M
@n
M=D

@i
M=0 // i = 0

(LOOP)
@i
D=M

@n
D=D-M

@END
D;JGT

@addr
A=M
M=-1

@i
M=M+1
@32
D=A
@addr
M=D+M
@LOOP
0;JMP

(END)
@END
0;JMP
