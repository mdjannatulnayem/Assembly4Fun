
;<Program to determine square root of a number>

	jmp start

;data


;code
start:	LDA 0300H
	MVI B, 01H
	MOV C, B
back:	SUB B
	JZ ahead
	INR B
	INR B
	INR C
	JMP back
ahead:	MOV A, C
	STA 0301H
	hlt