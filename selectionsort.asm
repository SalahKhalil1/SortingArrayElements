.386
.model small
.data
maxIndex		Dword 	? ; variable holds the index of the maximum element
L1_Counter		Dword 	? ; holds counter of the out loop
L2_Counter		Dword 	? ; holds counter of the inside loop
Array_Size			dword	? ; Array Size
Array1			Dword	100000 dup (?) ; Creating array
.code
Selection_Algorithm:
	lea ESI,  Array1 
		mov EAX, Array_Size
		mov L1_Counter,EAX
	Loop_1:
		cmp L1_Counter,0
		jle Out_1
		dec L1_Counter
		mov EAX,L1_Counter
		mov maxIndex,EAX
		dec EAX
		mov L2_Counter,EAX
		lea EAX, Array1

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
		mov maxIndex,edx				;max index =Loop2counter

