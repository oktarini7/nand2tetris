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

// Put your code here.
(MAIN_LOOP)
@SCREEN
D=A //beginning of screen
@a //a for address needs to be modified
M=D
@KBD
D=M //save the input from keyboard
@LOOP_ON
D;JNE // if keyboard has input then jump
	(LOOP_OFF)
		@SCREEN
		D=A
		@8191
		D=A+D
		@a
		D=M-D
		@MAIN_LOOP
		D;JGT //if all pixels are white then stop and probe the keyboard again
		@a
		A=M
		M=0 //whiten the screen
		@a
		M=M+1 //moving on to the next register
		@LOOP_OFF
		0;JMP
	(LOOP_ON)
		@SCREEN
		D=A
		@8191
		D=A+D
		@a
		D=M-D
		@MAIN_LOOP
		D;JGT //if all pixels are black then stop and probe the keyboard again
		@a
		A=M
		M=-1 //blacken the screen
		@a
		M=M+1 //moving on to the next register
		@LOOP_ON
		0;JMP