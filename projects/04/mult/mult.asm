// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R0
D=M
@r0
M=D //moving the value of R0 to a safe place
@R1
D=M
@r1
M=D //moving the value of R1 to a safe place
@i
M=0 //initialize i
@R2
M=0 //initialize mult
(LOOP)
	@i
	D=M //check which iteration we are currently on
	@r1
	D=D-M
	@END
	D;JEQ
	@r0
	D=M
	@R2
	M=D+M
	@i
	M=M+1
	@LOOP
	0; JMP
(END)
	@END
	0;JMP

