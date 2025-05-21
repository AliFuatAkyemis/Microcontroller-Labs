
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;Transfering:

mov bx, 0
mov dx, 1h
mov cl, M
mov ch, 0
mov di, 2000h

loop1:  
    mov [di], dx   
    add bx, [di]
    inc dx
    inc di        

loop loop1

dec dx
add dx, dx
mov cl, N
sub cl, M

loop2:  
    mov [di], dx
    add bx, [di]
    inc dx
    inc di
    
loop loop2
mov [di], bx

;Printing:

mov di, 2000h
mov cl, N
inc cl
parentPrint:
    mov bl, [di]
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
    inc di

loop parentPrint
       
ret 

N db 5
M db 3




