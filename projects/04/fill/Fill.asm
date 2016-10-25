// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(RESTART)
@SCREEN
D=A
@screenOffset
M=D // screen offset to be filled
(KEYBOARD)
@KBD
D=M
@BLACK
D;JGT
@WHITE
D;JMP
(BLACK)
@color
M=-1
@FILL
D;JMP
(WHITE)
@color
M=0
(FILL)
@screenOffset
D=M
@KBD
D=A-D //if screenOffset - keabord memory = 0 whole screen was filled. Restart Program
@RESTART
D;JEQ
@color
D=M //get color to fill screen (black or white)
@screenOffset
A=M // set pointer on adress of screen to be filled
M=D // fill address 
@screenOffset
M=M+1 // incress to next offset 
@FILL
0;JMP // repeat loop for filling screen

