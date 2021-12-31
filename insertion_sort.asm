;Insertion Sort Algorithm..
Insertion_Sort:
		mov  ecx, 1					;i=1 outer loop counter, begins at 1

loop1:
		cmp  ecx, arr_size					;condition loop
		jge  exitLoop1
		mov  edx, Array[4*ecx]				;first element
		mov  temp, edx					;storing the element (i) into the temporary variable
		push ecx					 