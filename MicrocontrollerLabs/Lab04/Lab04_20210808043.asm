
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

cmp N, 14
je exit2
jl exit2 
cmp N, 26
je exit2
jg exit2

mov di, 2000h
mov si, 1
mov cx, N
xor dx, dx
gen_loop:
cmp si, 1
jz gen_zero 
cmp si, 2
jz gen_one
test si, 1
jnz gen_odd
jz gen_even
gen_zero:
mov [di], 0
inc si
inc di
jmp exit1
gen_one:
mov [di], 1
inc si  
inc di
jmp exit1
gen_odd:
mov dh, [di-1]
sub dh, [di-2]
mov [di], dh
inc si 
inc di
jmp exit1
gen_even:
mov dh, [di-1]
add dh, [di-2]
mov [di], dh
inc si 
inc di
jmp exit1
exit2:    
lea si, message
mov cx, 38
mov ah, 0eh
go:
lodsb
int 10h
loop go
jmp exit
exit1:
loop gen_loop
exit:             
ret   

N dw 19
message db 'Please enter a value between 14 and 26'