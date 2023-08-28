; addition and subtraction of two bcd numbers

data segment
    A db 67h
    B db 51h
ends


code segment
assume cs:code,ds:data
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    mov al, [A]
    mov bl, [B]
    ; addition
    add al, bl
    mov ah, al
    daa
    ; subtraction
    mov al, [A]
    sub al, bl
    das
        
ends

end start