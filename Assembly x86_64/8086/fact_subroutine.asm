; using subroutine
; to find the factorial of a given number

data segment
    A db 09h
    B db 05h
ends

code segment
start:
assume cs:code,ds:data
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov al, [A]
    call fact
    mov al, [B]
    call fact
    hlt
    
    proc fact
        mov cl, al
        mov ch, 00h
        mov ax, 01h
        mov bx, 01h
        mov dx, 00h
        back:
        mul bx
        dec cx
        cmp cx, 00h
        jz done
        inc bx
        jmp back
        done:
        ret
    endp fact
    
ends

end start              
