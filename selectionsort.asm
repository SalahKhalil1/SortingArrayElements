

	Loop_2: 
		cmp InnerCounter,0
		jl exit1
		lea ESI,  array	
		MOV EDI , maxIndex				; EDI = Counter index
		MOV EDX , L2_Counter				;edx=Loop 2 counter        
		SHL EDI,2					; EDI = indexMax * 4 
		SHL EDX,2					; ECX = (Loop 2 counter ) * 4
		ADD EDI,ESI					; EDI =  Array offset + (Max index ) * 4 , EDI = &arr [Maxindex]
		ADD EDX,ESI					; EDX =  Array offset + (Loop 2 counter) * 4, EDX= &arr [Loop 2 counter]
		MOV EAX,[EDI]					; EAX = arr [Max index]
		mov EBX,[EDX]					; EBX = arr [Loop 2 counter] 
		CMP EBX,EAX					;arr[Loop 2 counter] > arr[max index] 
		jle out					;jump if a[max index]>arr[Loop 2 counter]
		mov edx,L1_Counter				; if arr[Loop 2 counter] > arr[Max index]
		mov maxIndex,edx	