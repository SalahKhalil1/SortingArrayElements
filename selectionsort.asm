; Selection Sort begin
Selection_Sort: 
		mov ESI,  offset Array ;loading array base address in esi
		mov ecx,arr_size         ;ecx = arr size
		
Select_loop1:                    ; label
		cmp ecx,0                ;compare ecx with 0
		jle exit_loop_1          ; exit loop label
		dec ecx                  ; decrement the counter by 1          
		mov MaxIndex,ecx         ; max index = current index
		push ecx                 ; push outer loop counter to save it from changes
		dec ecx	                 ; decrement counter to be used in inner loop 
		lea ESI,  Array          ;loading array base address in esi