
;<Delay for 1 sec>

	jmp start

;data

X: equ 03e8h ;1000d
Y: equ 0096h ;150d

;code
start: 	mvi a, 01h
	call delay
	out 00h
	hlt

delay:	mvi b, X
loop1:	lxi d, Y
loop2:	mov a, a
	dcr d
	jnz loop2
	dcr b
	jnz loop1
	ret


;1 sec -> 3030303t
;1 mil -> 3030t
;let X = 1
;7+X(10+Y(4+6+10)-3+6+10)-3+10 = 3030
;Y = 149.65