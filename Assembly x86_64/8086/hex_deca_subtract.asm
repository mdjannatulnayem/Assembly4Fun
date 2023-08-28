; program no - 4
; subtract two hexadecimal and decimal numbers

; declaring the data segment
data segment
    ; hexadecimal
    A db 56h
    B db 13h
    ; decimal
    C db 83h
    D db 54h
ends

; declaring the code segment
code segment
    ; assigning code as code segment and data as data segment
    assume cs:code,ds:data
    start:
    mov ax, data
    mov ds, ax
    ; program starts here
    ; A - B
    mov al, [A]
    mov ah, [B]
    sub al, ah
    ; C - D
    mov al, [C]
    mov ah, [D]
    sub al, ah
    ; decimal adjust after subtract
    das  
    hlt

ends
end start
