
;<Left shift a number n times>

	jmp start

;data


;code
start: 	IN 00H
	ANA A
	JZ end
	MOV B, A
	LXI H, 03E7H
	MOV A, M
loop:	RAL
	DCR B
	JNZ loop
	OUT 01H	
end:	hlt