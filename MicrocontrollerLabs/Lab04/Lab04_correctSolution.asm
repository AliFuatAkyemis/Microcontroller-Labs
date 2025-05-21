
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

cmp N, 14
jle exit1
cmp N, 26
jge exit1  

mov di, 1
lea si, arr
xor cx, cx 
mov cl, N
generator:
cmp di, 1
jz one
cmp di, 2
jz two
test di, 1
jz even
jnz odd

one:
mov [si], 0
inc di
inc si
jmp exit2
two:          
mov [si], 1
inc di
inc si   
jmp exit2
even: 
mov ax, [si-1]
add ax, [si-2]
mov [si], ax
inc di
inc si               
jmp exit2
odd:
mov ax, [si-1]
sub ax, [si-2]
mov [si], ax
inc di
inc si   
jmp exit2

exit1:
lea si, message
mov ah, 0eh
mov cx, 14
print:
lodsb
int 10h
loop print 
jmp exit

exit2:
loop generator
exit:

ret

N db 20
arr db N dup(0)
message db 'Invalid Entry!', 0

