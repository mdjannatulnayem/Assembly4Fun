
;<2's complement>

	jmp start

;data


;code
start: 	LXI H, 03E7H
	MOV A, M
	CMA
	ADI 01H
	OUT 00H
	hlt
