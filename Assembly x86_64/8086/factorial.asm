; using recursive procedure
; to find the factorial of a given number

data segment
    A db 05h
ends

code segment
start:
assume cs:code,ds:data
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov al, [A]
    mov cl, al
    mov ch, 00h
    mov ax, 0001h
    mov bx, 0001h
    mov dx, 0000h
    back:
    mul bx
    dec cx
    cmp cx, 00h
    jz done
    inc bx
    jmp back
    done:
    hlt
    
ends

end start              
