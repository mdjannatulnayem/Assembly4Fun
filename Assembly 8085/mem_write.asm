
;<Program title>

	jmp start

;data


;code
start:	MVI A, 09H
	LXI H, 000AH
	MOV M, A
	hlt