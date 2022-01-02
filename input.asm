.386
include irvine32.inc
.model flat,stdcall
.stack 1000h
.data
 
Array_size_message			BYTE	"Please Enter a Valid Array Size: ",0
Array_Element		BYTE	"Please Enter and integer Array element: ",0
Sorting_type_message		BYTE	"Enter 1 for Insertion sort, 2 for Selection sort, 3 for Bubble sort: ",0
Printing_type_message	BYTE	"Enter 1 for Ascending Sort , 2 for the descending sort or 3 for Both",0

inp			dword	?
arr_size			dword	?
Array			dword	50000 dup (0)
Sort_type		dword	?
asc_des     		dword	?

.code

main proc

; getting the length of the Array	
TakeSize:								; displaying number of inputs message
		mov edx,OFFSET Array_size_message
		call WriteString						
		call Crlf			
		call ReadInt					; input the number of itration in Eax
		mov arr_size,Eax					; arr_size = Eax
		pushf						; pushing the flag register in stack			
		pop Eax						; Eax = EFLAG
		mov Ebx,500h					; to check if valid int input
		and Ebx,Eax					; ebx &= eax
		cmp Ebx,0					; if (unvalid input) goto TakeSize	
		jne TakeSize
            mov eax,arr_size							
		
			 
		cmp Eax,1					; if ( arr_size <= 0 ) goto TakeSize
		jl TakeSize		
		mov Ecx,arr_size					; moving the number of iteration in Ecx for looping

		mov EDI,OFFSET Array				; for storing 
		mov ESI,OFFSET Array				; for loading

; getting the elements from the user
; first part
;----------------------------------------------------------------------------------------------------
TakeElements:								; input loop
		mov edx,OFFSET Array_Element
		call  WriteString                         ;writing strigns
		call  Crlf

		call  ReadInt					; input integer into EAX
		mov inp,Eax
		pushf								
		pop Eax

;section6 part

		mov Ebx,500h					; to check if valid int input
		and Ebx,Eax
		cmp Ebx,0
		jne TakeElements

;---------------------------------------------------------------------------------
TakeElements:								; input loop
		mov edx,OFFSET Array_Element
		call  WriteString
		call  Crlf

		call  ReadInt					; input integer into EAX
		mov inp,Eax
		pushf								
		pop Eax

;sectio6 part

		mov Ebx,500h					; checking validation of int input
		and Ebx,Eax
		cmp Ebx,0
		jne TakeElements                          ;element






