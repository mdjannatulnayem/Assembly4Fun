; add 2 numbers
; taken from prompt

; int 21h actions

; determiner: ah
; ah -> 01h > take single value as input
; ah -> 02h > display single char at screen
; ah -> 09h > display a string to screen
; ah -> 4ch > go back to DOS
; ///
; and many more

data segment
    A db ?
    B db ?
    Carry db 00h
    Sum db ?
; messages
    msg1 db 0Ah,0Dh,'Enter the 1st number: $'
    msg2 db 0Ah,0Dh,'Enter the 2nd number: $'
    msg3 db 0Ah,0Dh,'Sum: $'
    msg4 db 0Ah,0Dh,'Carry: $'
    
    data ends

code segment
    assume cs:code,ds:data
    start:
    mov ax, data
    mov ds, ax
; display msg1 into screen
    mov ah, 09h
    lea dx, msg1    
    int 21h
    
; get the 1st number input    
    call readbyte
    mov A, al
    
; display msg2 into screen
    mov ah, 09h
    lea dx, msg2    
    int 21h
    
; get the 2nd number input        
    call readbyte
    mov B, al
    
;add the 2 numbers
    mov al, A
    add al, B
    jnc skip
    inc Carry
    skip:
    mov Sum, al
    
; display msg3 into screen
    mov ah, 09h
    lea dx, msg3    
    int 21h

; print sum    
    lea si, Sum
    call printbyte    
    
; display msg4 into screen
    mov ah, 09h
    lea dx, msg4    
    int 21h
    
; print carry    
    lea si, Carry
    call printbyte    
    
; return control    
    mov ah, 4ch
    int 21h
    
    
; subroutine to get a byte
PROC readbyte
    push cx              
    mov ah, 01h
    int 21h
    sub al, 30h
    cmp al, 09h
    jle j1
    sub al, 07h
j1: mov cl, 04h
    rol al, cl
    mov ch, al
    
    mov ah, 01h
    int 21h
    sub al, 30h
    cmp al, 09h
    jle j2
    sub al, 07h
j2: add al, ch
    pop cx        
    ret
ENDP readbyte
                            
                            
; subroutine to print a byte
PROC printbyte
    push cx
    mov al, [si]
    and al, 0F0h
    mov cl, 04h
    rol al, cl
    add al, 30h
    cmp al, 39h
    jle j3
    add al, 07h
j3: mov ah, 02h
    mov dl, al
    int 21h
    
    mov al, [si]
    and al, 0Fh
    add al, 30h
    cmp al, 39h
    jle j4
    add al, 07h
j4: mov ah, 02h
    mov dl, al    
    int 21h
    pop cx
    ret
ENDP printbyte   
                            
                            
    code ends
end start