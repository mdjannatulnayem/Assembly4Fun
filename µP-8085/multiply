
;<multiplication>

	jmp start

;data


;code
start: 	LXI H, 03E7H
	MOV B, M
	LXI H, 03E6H
	MOV D, M
	XRA A
	MOV C, A
loop:	ADD D
	JNC skip
	INR C
skip:	DCR B
	JNZ loop
	LXI H, 03E5H
	MOV M, A
	LXI H, 03E4H
	MOV M, C
	HLT