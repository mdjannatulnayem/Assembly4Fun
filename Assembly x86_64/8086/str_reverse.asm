; reverse a string

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
    add ax, 0Bh
    mov si, ax
    lea ax, msg2
    mov di, ax
    mov cx, 0Ch
    back:
    std
    lodsb
    cld 
    stosb
    dec cx
    jnz back
    hlt
ends

end start ; set entry point and stop the assembler.
