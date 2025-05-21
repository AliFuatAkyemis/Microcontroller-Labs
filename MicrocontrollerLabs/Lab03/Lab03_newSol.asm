
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, num1
mov bx, num2
loop1:
div bx
cmp dx, 0
jz exit
mov ax, bx
mov bx, dx
xor dx, dx
jmp loop1
exit:
mov gcd, bx
xor cx, cx
mov cx, gcd
mov ax, 1
loop2:
mul cx
loop loop2
mov factorial, ax

ret

num1 dw 64
num2 dw 40
gcd dw 0
factorial dw 1


