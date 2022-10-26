
;<Add 2 numbers using subroutine>

	jmp start

;data


;code
start:	mvi b, 01h
	mvi c, 05h
	lxi sp, 1000h
	push b
	call add2
	pop b
	lxi h, 02eeh
	mov m, c
	inx h
	mov m, b
	hlt


add2:	xra a
	pop d
	pop b
	add b
	add c
	mvi b, 00h
	jnc skip
	mvi b, 01h
skip:	mov c, a
	push b
	push d
	ret