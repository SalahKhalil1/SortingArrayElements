
;------------------------
Bubble_Sort:
		mov ESI, offset Array					; Load ESI with start address of the Array
		MOV eax, arr_size					; get the lenght of array in eax
		CMP arr_size, 1
		JE Output				; if there is only one element in the array skip the bubble sort algorithm
		dec eax						; dec eax by 1 
		mov ecx,0			; outloop = arr_size-1
; Start Outer Loop
L1:
		cmp ecx,eax
		jge Output
		push ecx
		mov ecx ,0					; push ECX to the stack to keep the outLoop counter from chainging

L2:
;shift the  inner Loop index
pop edx     ;i
mov ebx,edx ;ebx=i
push edx ;edx will be pushed
mov edx,eax ;edx = size-1
neg ebx
add edx,ebx ;edx=size-1-i



exit_L2:
	pop ecx
	inc ecx
	jmp L1 
  

          
          

