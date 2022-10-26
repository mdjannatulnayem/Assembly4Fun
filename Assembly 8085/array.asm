
;<Store N elements in consecutive memory addresses>
;<Store the number of elements,N to specified address>
;<Store the starting address to specified memory loc>

	jmp start

;data


;code
start: 	IN 00H
	STA 02FDH ;store the length
	MOV B, A
	LXI H, 0300H ;starting address
	SHLD 02FEH
store:	IN 01H ;taking readings
	MOV M, A
	INX H
	DCR B
	JNZ store	
	hlt