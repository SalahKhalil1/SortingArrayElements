;Insertion Sort Algorithm..
Insertion_Sort:
		mov  ecx, 1					;i=1 outer loop counter, begins at 1

loop1:
		cmp  ecx, arr_size				;Comparing size with 1
		jge  exitLoop1					;jump label if size <1
		mov  edx, Array[4*ecx]				;first element
		mov  temp, edx					;storing the element (i) into the temporary variable
		push ecx					;push counter in the stack
loop2:								
		cmp  ecx, 0					;inner loop first condition (i<arr_size)
		jle  exitLoop2					;jump label if less than or equal 
		cmp  edx, Array[4*ecx-4]			;inner loop second condition (temp<Array[j-1])
		jg   exitLoop2					;jump label

		mov  esi, 0				 	;clear esi
		mov  esi, Array[4*ecx-4]			;esi = Array[j-1]
		mov  Array[4*ecx], esi				;Array[j] = esi
		dec  ecx					;ecx-- (j--)

		jmp  loop2