
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al, num1
mov bl, num2
loop1:
div bl
cmp ah, 0
jz exit
mov al, bl
mov bl, ah
xor ah, ah
loop loop1
exit:
mov gcd, bl
mov cl, gcd
mov ax, 1
loop2:
mul cx
loop loop2
mov factorial, ax

ret

num1 db 64
num2 db 40
gcd db 0
factorial dw 1


