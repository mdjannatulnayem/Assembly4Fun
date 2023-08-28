
;decimal to binary conversion!
data segment
    
ends

code segment
assume cs:code,ds:data    
    start:
    mov al, 13
    ; print result in binary:
    mov bl, al
    mov cx, 8
    print: 
    mov ah, 2
    mov dl, '0'
    test bl, 10000000b
    jz zero
    mov dl, '1'
    zero:
    int 21h
    shl bl, 1
    loop print
    mov dl, 'b'
    int 21h
    hlt
ends
end start



