/* Project Contributors
- Rawan Mohammed Abdelhady
- Salah Khalil Salah
- Moaaz Anwar Elsayed
- Bassim Attia Abdelatty
- Ziad Gamal Ahmed
*/
.386
include irvine32.inc 
.model flat,stdcall
.stack 1000h ; reserve 4096 place in stack
.data
 ; ---------------- Defining data ------------
 
 ; Preparing messages to be displayed
Array_size_message			BYTE	"Please Enter a Valid Array Size: ",0
Array_Element		BYTE	"Please Enter and integer Array element: ",0
Sorting_type_message		BYTE	"Enter 1 for Insertion sort, 2 for Selection sort, 3 for Bubble sort: ",0
Printing_type_message	BYTE	"Enter 1 for Ascending Sort , 2 for the descending sort or 3 for Both",0

; Defining variables

inp			dword	?
arr_size			dword	?
Array			dword	50000 dup (0) ; defining array of double word and initialize it with 0
Sort_type		dword	?
asc_des     		dword	?

; selection sort 
MaxIndex		DWORD 	?

; Insertion sort
temp			dd	?

.code

; --------------Selection Sort begin--------------------------------

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
		mov ESI,  offset Array          ;loading array base address in esi

Select_loop2: 
		cmp ecx,0                ; inner loop counter 
		jl exit_loop_2			; exit loop if counter is less than 0
		mov esi, offset Array			; loading base address of array
		MOV EDI , MaxIndex				; EDI = indexCounter
		MOV eax, Array[4*ecx]			; eax = the current element value
		mov ebx, Array[4*edi]			; ebx = the value of max
		cmp eax,ebx 					; comparing them
		jle exit_f						; exiting	
		mov MaxIndex,ecx				; moving the current index to max index 

exit_f: 
		dec ecx                         ; decrement inner counter by 1 (j--)
		jmp Select_loop2                ; return jump to inner loop lable

exit_loop_2:
		pop ecx                          ;restore the value of i
		mov EaX ,Array[4*ecx]            ; EAX = array[i]
		mov edi,MaxIndex                 ; EDI = maximum index
        mov ebx,Array[4*edi]             ; EBX = array[maxindex]

    ;-------------Swapping------------

		mov Array[4*edi],eax             ; array[maxindex]= array[i]
		mov Array[4*ecx],ebx             ;array[i]= array[maxindex]
		jmp Select_loop1

exit_loop_1:

		jmp Output                       ; jump to output label