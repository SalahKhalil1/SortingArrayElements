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

