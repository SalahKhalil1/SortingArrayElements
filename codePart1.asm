
include 'emu8086.inc'

org 100h
.model small

.data

    arr db 5 dup(?)

.code

main proc

    mov ax,@data
    mov ds,ax

    print "Enter 5 Number in Array:"
    mov cx, 5
    mov bx,offset arr
    mov ah, 1

   ;assending
 
    inputs1:

    int 21h
    mov [bx], al
    inc bx
    loop inputs1
    
    mov cx, 5

    dec cx

    OuterLoop1:

    mov bx, cx

    mov si, 0
 CompLoop1:

    mov al,arr[si]

    mov dl,arr[si+1]   

    cmp al,dl

    jc noSwap1

    mov arr[si], dl

    mov arr[si+1], al

    noSwap1: 

    inc si

    dec bx

    jnz CompLoop1

    loop OuterLoop1


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


