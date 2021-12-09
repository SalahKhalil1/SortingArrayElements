
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA
array: db 1,20,5,99,6,12,44,32,5,6

.CODE               
mov si,00   
mov cx,10   ;The number of array elements                           
sub cx,1    ;The number of array element minus1 






