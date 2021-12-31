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

 L2:
;shift the  inner Loop index
pop edx     ;i
mov ebx,edx ;ebx=i
push edx ;edx will be pushed
mov edx,eax ;edx = size-1
neg ebx
add edx,ebx ;edx=size-1-i
  



