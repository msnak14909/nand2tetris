// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@SCREEN
D=A
@R0
M=D

@24576 //max screen
D=A
@R1
M=D

(LOOP)
@KBD
D=M
@BLACK
D;JGT // if pressed then goto black
@WHITE
0;JEQ


(WHITE)
@SCREEN
D=A
@R0
D=D-M
@LOOP
D;JEQ

D=0
@R0
A=M
M=D

@R0
D=M-1
M=D

@LOOP
0;JEQ

(BLACK)
@R1
D=M
@R0
D=D-M
@LOOP
D;JEQ

@R0
A=M //addr = RAM[R0] (the screen pointer now)
M=-1 // eqaul to 0xFFFF -> black

@R0
D=M+1
M=D

@LOOP
0;JEQ
