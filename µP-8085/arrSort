
;<Bubble Sort>
;<Memory starts from 0000H>
;<Array size at 02eeH>
;<Starting address 02f0H and 02efH>
;<Array elements stored after>

	jmp start

;data


;code
start: 	lxi h, 02eeh
	mov e, m
	mov c, e
	xchg
	inx d
	ldax d
	mov l, a
	inx d
	ldax d
	mov h, a
loop1:	push h
loop2:	mov a, m
	inx h
	mov b, m
	cmp b
	jnc noswap
	mov d, a
	mov a, b
	mov b, d
	dcx h
	mov m, a
	inx h
	mov m, b
noswap:	dcr e
	jnz loop2
	pop h
	dcr c
	jnz loop1
	hlt