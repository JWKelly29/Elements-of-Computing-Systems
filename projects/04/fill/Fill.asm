// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.



/// MY CODE BELOW ///


// These variables will be used to determine if the loops to change the colour
// of the screen should be run. Without them the white loop would be run over and over again
// while a keyboard input is not pressed, and black loop while it is pressed. The loops only
// need to be run once.

@screenBlack
M=0
@clearScreen
M=1

// This is the main loop which will be run continuously, checking if the a Keyboard input is pressed

(KBDLOOP)

// set a variable to reference screen. sc gets altered in the WHITELOOP and BLACKLOOP.
@SCREEN
D=A
@sc
M=D

// The screen is a memory map of 8k bits starting at location 16384. n tells us how many bits we need to alter.
@8000
D=A
@n
M=D


// We will determine if i - n > 0 at the end of each loop (this will happen when i = 8001).
// If so we have run the loop over 8000 bits and may jump back to KBDLOOP
@i
M=1

// is a key being pressed
@KBD
D=M

// jump to ISSCREENBLACK if KBD is > 0, meaning a key is pressed.
@ISSCREENBLACK
D;JGT
// jump to ISCLEARSCREEN if KBD is = 0, meaining a key is not pressed.
@ISCLEARSCREEN
D;JEQ

// jump back to start if for some reason none of the above conditions are met.
@KBDLOOP
0;JMP


(ISSCREENBLACK)
// if screen is already black jump back to KBDLOOP else jump to BLACKLOOP
@screenBlack
D = M
@BLACKLOOP
D;JEQ

@KBDLOOP
0;JMP

(ISCLEARSCREEN)
// if screen is already clear jump back to KBDLOOP else jump to WHITELOOP
@clearScreen
D = M
@WHITELOOP
D;JEQ

@KBDLOOP
0;JMP


(ENDBLACKLOOP)
// set screenBlack to 1 and clearScreen to 0 to so this loop does not run a again.
@screenBlack
M=1
@clearScreen
M=0
@KBDLOOP
0;JMP

(BLACKLOOP)


// check if i - n > 0, if so goto KBDLOOP
@i
D=M
@n
D=D-M
@ENDBLACKLOOP
D;JGT

// set the memory location we're altering to the value located in sc
// set the memory locations value to -1
@sc
A = M
M=-1

// increment the value stored in sc so that we can alter the next bit
@1
D=A
@sc
M = M + D

// increment i
@i
// i = i + 1
M=M+1
@BLACKLOOP
0;JMP


(ENDWHITELOOP)
// set screenBlack to 0 and clearScreen to 1 to so this loop does not run a again.
@screenBlack
M=0
@clearScreen
M=1
@KBDLOOP
0;JMP

(WHITELOOP)
// check if i - n > 0, if so goto KBDLOOP
@i
D=M
@n
D=D-M
@ENDWHITELOOP
D;JGT

// set the memory location we're altering to the value located in sc
// set the memory locations value to 0
@sc
A = M
M = 0

// increment the value stored in sc so that we can alter the next bit
@1
D=A
@sc
M = M + D

// increment i
@i
// i = i + 1
M=M+1

// jump back to start of the loop
@WHITELOOP
0;JMP



// If for any reason we do not jump back to KBDLOOP catch here to end program in continuous loop
(END)
@END
0;JMP
