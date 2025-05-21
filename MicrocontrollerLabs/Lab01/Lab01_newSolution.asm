
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov bx, 2000h
mov ds, bx
mov bx, 0
mov si, 1
mov di, 0
mov cx, M
loop1:
mov [2000h+di], si
add bx, si
inc si
inc di
loop loop1
dec si              
mov ax, si
mov si, 2
mul si              
mov si, ax
mov cx, N
sub cx, M
cmp cx, 0
jz exit
jl exit
loop2:
mov [2000h+di], si
add bx, si
inc si
inc di
loop loop2
exit:
mov [2000h+di], bx

ret

N EQU 10
M EQU 5


