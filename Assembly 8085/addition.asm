
;<Read two numbers from memory>
;<Perform addition and store in memory>
;<Write out to IO>

	jmp start

;data


;code
start: 	MVI C, 00H
	LXI H, 03E7H
	MOV A, M
	LXI H, 03E6H
	MOV B, M
	ADD B
	JNC store
	INR C
store:	STA 03E5H
	OUT 00H
	MOV A, C
	STA 03E4H
	OUT 01H
	HLT