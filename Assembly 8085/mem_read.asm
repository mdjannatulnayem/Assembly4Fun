
;<Memory read>

	jmp start

;data


;code
start: 	LXI H, 000AH
	MOV A, M
	hlt