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
		reversingLoop:								; looping according to new counter across half of the array              		
		mov edx , [ebx]        				; edx = copying element from the first half of the array
		mov edi , [eax]        				; edi = copying the corresponding element from the second half  

		; swaping them :
		mov [ebx],edi          
		mov [eax],edx
		add ebx , 4
		sub eax , 4
		loop reversingLoop
		call crlf
		call crlf
		mov edx , offset des_sorting_message         
		call WriteString                    		; displays message
		call crlf									; new line
		jmp Pr										; loop over the elements

printResult:							; print the array 
		call crlf
		call crlf
		mov edx , offset asc_sorting_message         
		call WriteString                    		
		call crlf

Pr:		
		mov ecx , arr_size              	; ecx = arrSize
		mov ebx , offset Array
		printingLoop:                       ; loop through each element in the array
		mov eax , [ebx]
		call Writeint        				; print the content of eax
		call crlf             				; new line
		add ebx , 4           				; go to the next element

		loop printingLoop
		cmp asc_des , 3						; Check asc_dec value to print both if equal 3
		je @reverseArr						; jump to @reverseArr to print both if equal 3
		jmp End_of_Printing							; end sort
print_Both:
		jmp printResult

@reverseArr:								; Reverse the array
		mov eax , arr_size              	; numerator = (arrSize)
		mov edx , 0     
		mov edi , 2                			; denominator = 2
		div edi                   			; eax = arr_size/2 = arrSize/2  (neglect reminder)
		mov ecx , eax             	 		; ecx = arrSize/2

		; get the addresses of the first element and the last element in arr
		mov ebx , offset Array     			; ebx =  address of the first element
		mov eax , 4   
		mul arr_size                    			; eax = arr_size * 4
		sub eax , 4                			; eax = arr_size * 4 - 4 = offset of last element relative to the arr
		add eax , ebx              			; eax = address of last element relative to the segment

@reversingLoop:							; loop through the half of the array              		
		mov edx , [ebx]        				; edx = copying element from the first half of the array
		mov edi , [eax]        				; edi = copying the corresponding element from the second half  

		; swaping the them :
		mov [ebx],edi          
		mov [eax],edx
		add ebx , 4
		sub eax , 4
		loop @reversingLoop
		add asc_des,1					; adding 1 to asc_des that is equal 3 to be 4 as not to achieve the condition again 
		mov edx , offset des_sorting_message         
		call WriteString                    		; displays  message
		call crlf					; new line
		jmp Pr						; jump to loop through elements
		End_of_Printing:

		;----------------  End of the Program Code ---------------

invoke ExitProcess,0
main endp
end main