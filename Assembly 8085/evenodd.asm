
;<Writeout 1 if even or 0 to IO>

	jmp start

;data


;code
start: 	IN 00H
	MVI B, 01H
	ANA B
	JZ skip
	MVI A, 00H ;odd
	JMP iow
skip:	MVI A, 01H ;even
iow:	OUT 01H
	hlt