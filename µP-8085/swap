
;<swap 2 numbers>

	jmp start

;data


;code
start: 	in 00h
	mov b, a
	in 01h
	mov c, a
	push b
	call swap
	pop b
	mov a, b
	out 00h
	mov a, c
	out 01h
	hlt

swap:	pop h
	pop b
	mov a, b
	mov b, c
	mov c, a
	push b
	push h
	ret