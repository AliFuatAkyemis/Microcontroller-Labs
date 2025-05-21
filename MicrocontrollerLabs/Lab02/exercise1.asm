
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ax, n
mov bx, n
inc bx
xchg bx, ax
xchg si, bx
xchg bx, ax
xchg dx, si
xchg ax, dx
                

ret

n dw 5                    


