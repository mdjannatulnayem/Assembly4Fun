; Multiply 32 bits

; We're doing PQxRS    
;     si -> Q
; si+02h -> P
; si+04h -> S
; si+06h -> R
; Each are 16 bits
; Result 64b
; si+08h -> r0
; si+0Ah -> r1
; si+0Ch -> r2
; si+0Eh -> r3        

; Result is 64 bits 
                  
data segment
    A dd 0005h
; 2nd operand must be declared
; right after this
    B dd 0003h 
    
    data ends

code segment
    assume cs:code,ds:data
    start:
    mov ax, data
    mov ds, ax   
; offset address    
    mov si, 0000h
    
; load operands
    lea si, A


    
; put Q into ax    
    mov ax, [si]
; put S into bx
    mov bx, [si+04h]
; multiply QxS
    mul bx
; store ax -> si+08
    mov [si+08h], ax
; store dx -> si+0A
    mov [si+0Ah], dx
; r1,r0 contains QxS

; put P into ax
    mov ax, [si+02h]
; put R into bx
    mov bx, [si+06h]
; multiply PxR
    mul bx
; store ax -> si+0C
    mov [si+0Ch], ax
; store dx -> si+0A
    mov [si+0Eh], dx
; r3,r2 contains PxR
    

; put P into ax
    mov ax, [si+02h]
; put S into bx
    mov bx, [si+04h]
; multiply PxS
    mul bx
; add ax to si+0A
    add ax, [si+0Ah]
    mov [si+0Ah], ax
; adc dx to si+0C
    adc dx, [si+0Ch]
    mov [si+0Ch], dx
; PxS is added to r2,r1
; add the carry to r3    
    mov ax, 0000h
    adc ax, [si+0Eh]
    mov [si+0Eh], ax            

; put Q into ax
    mov ax, [si]
; put R into bx
    mov bx, [si+06h]
; multiply QxR
    mul bx
; add ax to si+0A
    add ax, [si+0Ah]
    mov [si+0Ah], ax
; adc dx to si+0C
    adc dx, [si+0Ch]
    mov [si+0Ch], dx
; QxR is added to r2,r1
; add the carry to r3    
    mov ax, 0000h
    adc ax, [si+0Eh]
    mov [si+0Eh], ax
    
    hlt
    code ends
    end start