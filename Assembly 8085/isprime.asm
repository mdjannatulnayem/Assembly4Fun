
;<Determination of prime number>

	jmp start

;data


;code
start: 	IN 00H
	MOV B, A
	ANA B
	JZ end
	MOV B, A
	DCR B
	JZ end
	MVI C, 00H
	MOV B, A
	MOV E, A
divide:	MOV D, E
loop:	SUB D
	JZ isDiv
	JC notDiv
	JMP loop
isDiv:	INR C
notDiv:	MOV A, B
	DCR E
	JNZ divide
	MOV A, C
	SUI 02H
	MVI A, 01H
	JZ store
	MVI A, 00H
store:	OUT 01H
end:	HLT