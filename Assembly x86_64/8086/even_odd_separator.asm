; seperate even and odd numbers

data segment                                      
    arr db 12h,09h,34h,13h,00h,06h,03h,11h,05h,21h
    count db 0Ah
    even db 10 dup(?)
    odd db 10 dup(?)
ends

code segment
start:
assume cs:code,ds:data
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    lea bx, arr
    lea cx, even
    lea dx, odd 
    mov al, [count]
    back:
    push ax
    mov al, [bx]
    mov ah, al
    and al, 01h
    jnz oddnumber
    push bx
    xchg cx, bx
    mov [bx], ah
    xchg cx, bx
    inc cx
    jmp done   
    oddnumber:
    push bx
    xchg dx, bx
    mov [bx], ah
    xchg dx, bx
    inc dx
    done:
    pop bx
    inc bx
    pop ax
    dec al
    jnz back
    hlt 
    
ends

end start
