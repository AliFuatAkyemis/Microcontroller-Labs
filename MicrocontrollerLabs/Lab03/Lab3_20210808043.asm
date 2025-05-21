
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h      

mov ax, num1
mov bx, num2

gcd_loop:
    div bx
    cmp dx, 0
    jz gcd_out
    mov ax, bx
    mov bx, dx
    mov dx, 0
    jnz gcd_loop
gcd_out:
    mov gcd, bx

mov ax, 1
mov bx, gcd
mov cx, gcd
dec cx

factorial_loop:
    mul bx
    dec bx

loop factorial_loop

mov factorial, ax

mov ax, gcd
mov printhigh, ah
mov printlow, al
mov bl, printhigh 
mov cl, 2

parentPrintt:
    mov bh, cl
    mov cl, 8
    printt:
        mov ah, 2
        mov dl, '0'
        test bl, 10000000b
        jz zeroo
        mov dl, '1'
    
    zeroo:
        int 21h
        shl bl, 1
        loop printt
    mov cl, bh
    mov bl, printlow
        

loop parentPrintt

mov dx, 10
mov ah, 02h
int 21h

mov ax, factorial
mov printhigh, ah
mov printlow, al
mov bl, printhigh 
mov cl, 2

parentPrint:
    mov bh, cl
    mov cl, 8
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
    mov cl, bh
    mov bl, printlow
        

loop parentPrint
            
ret
num1 dw 64
num2 dw 40
gcd dw 0
factorial dw 1
printhigh db 0
printlow db 0




