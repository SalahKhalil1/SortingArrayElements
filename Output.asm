;----------------------------- Output Part ------------------------
Output:         
		cmp asc_des , 1						; Check ascending printing asc_des = 1 
		je printResult
		cmp asc_des , 3						; Check Both types asc_des=3
		je print_Both						; If asc_des = 3 jump to print both assending and descending
											; else print it reversed
reverseArr:									; Reverse the array
		mov eax , arr_size					; numerator = (arrSize)
		mov edx , 0     
		mov edi , 2                			; denominator = 2
		div edi                   			; eax = arr_size/2 = arrSize/2 
		mov ecx , eax             	 		; ecx = arrSize/2 (new counter)

		;to get the the first and the last addresses in array
		mov ebx , offset Array     			; ebx =  address of the first element
		mov eax , 4   
		mul arr_size                    	; eax = arr_size * 4
		sub eax , 4                			; eax = arr_size * 4 - 4 = offset of last element 
		add eax , ebx              			; eax = address of last element



