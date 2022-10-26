
;<Det largest element in array>
;<Write out to IO>
;<Array length stored at 02FDH>
;<Starting address stored after>

	jmp start

;data


;code
start: 	LXI H,02FDH
	MOV B, M
	INX H
	MOV E, M
	INX H
	MOV D, M
	LDAX D
	MOV C, A
loop:	INX D
	LDAX D
	CMP C
	JC cont
	MOV C, A
cont:	DCR B
	JNZ loop
	MOV A, C
	OUT 00H
	HLT