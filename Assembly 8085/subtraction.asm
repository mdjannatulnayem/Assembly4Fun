
;<Read two numbers from memory>
;<Write out the result to IO>

	jmp start

;data


;code
start: 	MVI C, 00H
	LXI H, 03E7H
	MOV A, M
	LXI H, 03E6H
	MOV B, M
	SUB B
	JNC store
	INR C
store:	OUT 00H
	MOV A, C
	OUT 01H
	HLT