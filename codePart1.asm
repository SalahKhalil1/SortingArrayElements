;------------------------
Bubble_Sort:
		mov ESI, offset Array					; Load ESI with start address of the Array
		MOV eax, arr_size					; get the lenght of array in eax
		CMP arr_size, 1
		JE Output				; if there is only one element in the array skip the bubble sort algorithm
		dec eax						; dec eax by 1 
		mov ecx,0			; outloop = arr_size-1


include 'emu8086.inc'

org 100h
.model small

.data

    arr db 5 dup(?)
temp			DW	?
    SIZE_MESSAGE  DW  'Enter Array size :$'
    Take_Elements  DW  ,0AH,0DH,'Please enter 16 bit Array Element :$'  
    Size_Error_Message  DW  ,0AH,0DH,'Please enter only Positive number as an Array Size, $'
    Type_Of_Sort  DW  ,0AH,0DH,'please,What is the Sorting Type Would You Choose?: $'
    Types_Message  DW  ,0AH,0DH,'1 for Bubble',0AH,0DH,' 2 for SELECTION' ,0AH,0DH,' 3 for Insertion',0AH,0DH,'$'  
    Sort_Type_Error  DW  'you can only choose 1 for bubble , 2 for Selection or 3 for Insertion:',0AH,0DH,'$'
    Assending_Sort  DW  ,0AH,0DH,'Assending Sort is:$'
    Dessending_Sort  DW  ,0AH,0DH,'Dessending Sort is:$'
    Empty_Array  DW  ,0AH,0DH,'your Array is empty,please enter an integer:$'
    ARRAY DW 1024 DUP(?) 

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
mov ah,2

    mov dl,10

    int 21h
    mov dl, 13
    int 21h
    print "assending Sorting Array:"
    mov cx,5

    mov bx, offset arr
    Outputs1:

    mov dl,[bx]

    mov ah, 2

    int 21h

    

    mov dl,32
    mov ah, 2
    int 21h

    inc bx

    loop Outputs1


;descending

mov cx, 5

    dec cx

    OuterLoop2:

    mov bx, cx

    mov si, 0    

    CompLoop2:

    mov al,arr[si]

    mov dl,arr[si+1] 
    cmp al,dl

    jnc noSwap2

    mov arr[si], dl

    mov arr[si+1], al

    noSwap2: 

    inc si

    dec bx
    jnz CompLoop2
  



