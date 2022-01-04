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
TakeSize:							; displaying number of inputs message
		mov edx,OFFSET Array_size_message
		call WriteString				;displays the string in edx to the user
		call Crlf					;skipping for a new line	
		call ReadInt					;Confirming that it's an integer taken from the user
		jo TakeSize
		mov arr_size,Eax					
		cmp eax,1					; to check if valid int input
		jl TakeSize                                     ; if (unvalid input) goto TakeSize	
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
                jo TakeElements 
		mov inp,Eax
		
		mov Eax,inp
		stosd						; storing data in memory
   		Loop  TakeElements					; repeat the loop

; getting the Sorting type from the user
SortType:								; getting sotring type
		mov edx,OFFSET Sorting_type_message
		call WriteString
		call Crlf
		call ReadInt			
		cmp Eax,3					; if ( eax > 3 ) goto sort	
		jg SortType					
		cmp Eax,1					
		jl SortType                 			; if ( eax < 1) goto sort
		mov Sort_type,Eax				; Assign entered Number to a special sort type


; getting the ascending or descending or both from the user
Printing_type:							; getting sorting type
		mov edx,OFFSET Printing_type_message		;copying the message to edx
		call WriteString				;displays the string in edx to the user
		call Crlf					;skipping for a new line	
		call ReadInt					;Confirming that it's an integer taken from the user
		mov inp,Eax					;Storing the entered value to the Variable input
		jo Printing_type
		mov Eax,inp					;making sure that the input is 1 or 2 or 3 for the desired type 
		cmp Eax,3
                jg Printing_type				
		cmp Eax,1					; if ( eax < 0 ) goto rev
		jl Printing_type	
		mov asc_des,Eax                    		; assigning asc_des with the input
		
		cmp Sort_type,1					; if( Sort_type == 1 )goto Bubble_Sort
		je Insertion_Sort				
		cmp Sort_type,2					;if( Sort_type == 2)goto Selection_Sort
		je Selection_Sort		
		cmp Sort_type,3					;if(Sort_type == 3)goto Insertion_sort
		je Bubble_Sort				


