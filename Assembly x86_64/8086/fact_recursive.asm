; using recursive procedure
; to find the factorial of a given number

data segment
    A db 08h
    result dw ?
ends

code segment
start:
assume cs:code,ds:data
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov ax, 01h
    mov bl, [A]
    mov bh, 00h
    call fact
    mov result, ax
    hlt
    
    proc fact
        cmp bx, 01h
        je done
        push bx
        dec bx
        call fact
        pop bx
        mul bx
        done:
        ret
    endp fact
    
ends

end start              
