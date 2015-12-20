// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(LOOP)
@SCREEN
D=A
@R0
M=D

(SCREENLOOP)
@KBD
D=M

@WHITE
D;JEQ //no pressed jmp to WHITE

(BLACK)
@R0
A=M // address = RAM[R0] = SCREEN ADDRESS
M=-1 // let screen address memory be 0xFFFF (BLACK pixel)
@END
0;JEQ // jmp END

(WHITE)
@R0
A=M
M=0

(END)
@R0
M=M+1
D=M // address of next screen address 

@KBD
D=D-A
@SCREENLOOP
D;JNE
@LOOP
0;JEQ
