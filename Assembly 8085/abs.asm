
;<Determine absolute value>
;<Usng 8 bit signed number>

	jmp start

;data


;code
start: 	in 00h
	sui 00h
	jp skip
	cma
	adi 01h
skip:	out 01h
	hlt