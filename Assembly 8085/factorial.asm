
;<Factorial of a number>

	jmp start

;data


;code
start: 	IN 00H
	MOV H, A
	ANA A
	JZ skip
	DCR A
	JZ skip
	MOV A, H
	MOV B, A
	MOV E, B
	XRA A
	MVI C, 01H
	CMP C
	JC loop
iter:	MOV C, D
loop:	ADD C
	DCR E
	JNZ loop
	DCR B
	JZ store
	MOV E, B
	MOV D, A
	MVI A, 00H
	jmp iter
store:	MOV A, D	
	OUT 01H
	HLT
skip:	MVI A, 01H
	OUT 01H
	HLT	