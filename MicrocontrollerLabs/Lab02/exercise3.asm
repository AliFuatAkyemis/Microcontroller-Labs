
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, n
mov bx, m
mov cx, k
mov dx, l

push ax
push bx
push cx
push dx

pop ax
pop bx
pop cx
pop dx

ret

n dw 1
m dw 2
k dw 3
l dw 4


