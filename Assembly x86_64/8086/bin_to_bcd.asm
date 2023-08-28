; conversion of binary to bcd


data segment
    num db 11000101b
ends

code segment
assume cs:code,ds:data    
    start:
    mov ax, data
    mov ds, ax
    mov al, [num]
    mov ah, 00h
    mov bl, 64h
    div bl
    xchg ah, al
    mov bh, ah
    mov bl, 0Ah
    mov ah, 00h
    div bl
    xchg ah, al
    clc
    rol ah, 4
    add al, ah
    mov ah, bh
    hlt  
    
ends
end start