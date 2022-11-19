; program to add 2 8bit numbers
; taking input from user

.data

; console messeges

msg4 db 0ah,0dh,"Carry: $"
msg1 db 0ah,0dh,"Enter the 1st number: $"
msg2 db 0ah,0dh,"Enter the 2nd number: $"
msg3 db 0ah,0ah,0dh,"Sum: $"

; variables

A db ?
B db ?
S db ?
C db ?


.code

    jmp start

start:
    mov ax, @data
    mov ds, ax  ; initialize data segment register
    
    mov C, 00h
    
    mov ah, 09h
    lea dx, msg1
    int 21h     ; ask for 1st operand
    call get8
    mov A, al
    
    mov ah, 09h
    lea dx, msg2
    int 21h     ; ask for 2nd operand
    call get8
    mov B, al
    
    mov al, A
    add al, B   ; perfom addition operation
    jnc skip
    inc C
skip:
    mov S, al
    
    mov ah, 09h
    lea dx, msg3
    int 21h
    
    lea si, S
    call put8
    
    mov ah, 09h
    lea dx, msg4
    int 21h
    
    lea si, C
    call put8
    
    mov ah, 4ch
    int 21h
    
    
    

proc get8       ; subroutine for getting user input
    push cx
    mov ah, 01h
    int 21h
    cmp al, 61h
    jl label5
    sub al, 50h
    jmp label6    
label5:
    sub al, 30h
label6:    
    cmp al, 09h
    jle label1
    sub al, 07h
label1:
    mov cl, 04h
    rol al, cl
    mov ch, al
    
    mov ah, 01h
    int 21h
    cmp al, 61h
    jl label7
    sub al, 50h
    jmp label8
label7:    
    sub al, 30h
label8:
    cmp al, 09h
    jle label2
    sub al, 07h
label2:
    add al, ch
    pop cx
    ret    
endp get8




proc put8      ; subroutine for writing out the result
    push cx
    mov al, [si]
    and al, 0f0h
    mov cl, 04h
    rol al, cl
    add al, 30h
    cmp al, 39h
    jle label3
    add al, 07h
label3:
    mov ah, 02h
    mov dl, al
    int 21h
    
    mov al, [si]
    and al, 0fh
    add al, 30h
    cmp al, 39h
    jle label4
    add al, 07h
label4:
    mov ah, 02h
    mov dl, al
    int 21h
    pop cx
    ret    
endp put8


end start       ; end
