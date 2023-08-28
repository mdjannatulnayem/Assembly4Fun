; transfer of a string
; in forward direction

data segment
    msg db 'myself nayem'
    msg2 db ? 
ends

code segment
start:
assume cs:code,ds: data
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    lea ax, msg
    mov si, ax
    lea ax, msg2
    mov di, ax
    mov cx, 06h
    cld
    rep movsw
    dec cx
    hlt
ends

end start ; set entry point and stop the assembler.
