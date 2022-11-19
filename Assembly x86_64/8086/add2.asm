
;add 2 8bit numbers

.data
A   db 0ffh
B   db 0ffh
S   db ?
C   db 00h

.code
start:
    mov ax, @data
    mov ds, ax
    mov al, A
    add al, B
    jnc skip
    inc c
skip:
    mov s, al
    mov ah, 4ch
    int 21h
    
end start   ;end       
