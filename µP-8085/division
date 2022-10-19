
;<Division>
;<Read two numbers from memory> 
;<Perform division operation>
;<Store the result and remainder>

	jmp start

;data


;code
start: 	MVI D, 00H
	LXI H, 03E6H
	MOV B, M
	MVI A, 01H
	ANA B
	JZ end
	LXI H, 03E7H
	MOV A, M
loop:	MOV C, A
	SUB B
	INR D
	JNC loop
	DCR D
	MOV A, D
	STA 03E5H
	MOV A, C
	STA 03E4H
end:	hlt