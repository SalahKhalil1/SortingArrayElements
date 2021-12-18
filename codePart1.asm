
;assending

org 100h

.DATA
array: db 1,20,5,99,6,12,44,32,5,6

.CODE               
mov si,00   
mov cx,10   ;The number of array elements                           
sub cx,1    ;The number of array element minus1  
BubbleSortArray:
cmp cx,si
jz Next
mov al, array1[si] 
mov bl, array1[si+1]
cmp al,bl           
        ja Exchange
        add si,1           
        jmp BubbleSortArray


;dessending

mov si,00   
mov cx,10   ;The number of array elements                           
sub cx,1    ;The number of array element minus1  
BubbleSortArray:
cmp cx,si
mov al, array1[si] 
mov bl, array1[si+1]
cmp al,bl           
        jb Exchange
        add si,1           
        jmp BubbleSortArray


