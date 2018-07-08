@R0
D=M

// n = R0
@n
M=D

// i = 1
@i
M=1

// sum = 0
@sum
M=0

(LOOP)
@i
D=M
@n
D=D-M

// if i > n goto STOP
@STOP
D;JGT

@sum
D=M
@i
D=D+M
@sum
// sum = sum + i
M=D
@i
// i = i + 1
M=M+1
@LOOP
0;JMP


(STOP)
@sum
D=M
@R1
M=D

(END)
@END
0;JMP
