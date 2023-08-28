; check if string is a palindrome

data segment
    str db 25h,34h,63h,77h,63h,34h,25h
    result db 00h
; if result is 01h 
; the string is a palindrome

    data ends

extr segment
    rev db 07h dup(?)
     
    extr ends


code segment
    assume cs:code,ds:data,es:extr
    start:
    mov ax, data
    mov ds, ax
    mov ax, extr
    mov es, ax
; si points to the start
    lea si, str
; di should point to end of string
; to be reversed
    lea di, rev + 06h
; length is 7 threfore count is 7
    mov cx, 0007h
    back:
    cld
    lodsb
    std
    stosb
    loop back
; now the string is reversed
; time for compare strings
; reinitialize first
    lea si, str
    lea di, rev
    mov cx, 0007h
    cld
    repe cmpsb
    jnz skip
    inc result
    skip: hlt   
    code ends
end start
