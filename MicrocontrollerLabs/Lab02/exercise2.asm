
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, n
mov [1234h], ax
lea si, [1234h]
mov bx, [si]

ret

n dw 9



