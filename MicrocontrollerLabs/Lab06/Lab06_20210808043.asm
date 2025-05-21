
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, len
test ax, 00000001b
jz even
dec ax    
even:
    mov bx, 2
    div bx
mov cl, al
lea si, word         
check:
    mov bx, dx
    mov al, [si+bx]
    mov bx, len
    dec bx
    sub bx, dx
    mov ah, [si+bx]
    cmp ah, al
    jne no
    inc dx
    loop check 

yes:
    lea si, message1
    mov cx, 21
    mov ah, 0eh
    printyes:
        lodsb
        int 10h
    loop printyes
    jmp exit    
no:
    lea si, message2
    mov cx, 25
    mov ah, 0eh
    printno:
        lodsb
        int 10h
    loop printno
exit:
ret

word db 'radar', 0
len dw $-word-1 
message1 db 'This is a palindrome!', 0
message2 db 'this is not a palindrome!', 0



