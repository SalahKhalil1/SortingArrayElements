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
		mov Ecx,arr_size				; moving the number of iteration in Ecx for looping

		mov EDI,OFFSET Array				; for storing 
		mov ESI,OFFSET Array				; for loading

; getting the elements from the user
; first part
;----------------------------------------------------------------------------------------------------
TakeElements:							; input loop
		mov edx,OFFSET Array_Element
		call  WriteString                         	;writing strigns
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
TakeElements:							; input loop
		mov edx,OFFSET Array_Element
		call  WriteString
		call  Crlf

		call  ReadInt					; input integer into EAX
                jo TakeElements 
		mov inp,Eax
		
		mov Eax,inp
		stosd						; storing data in memory
   		Loop  TakeElements				; repeat the loop

; getting the Sorting type from the user
SortType:							; getting sotring type
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

;--------------------------------------------------------------------------------------------------------------
	
;---------------------------------Insertion sort begins------------------------------------------
;Insertion Sort Algorithm..
Insertion_Sort:
		mov  ecx, 1					;i=1 outer loop counter, begins at 1

loop1:
		cmp  ecx, arr_size				;Comparing size with 1
		jge  exitLoop1					;jump label if size <1
		mov  edx, Array[4*ecx]				;first element
		mov  temp, edx					;storing the element (i) into the temporary variable
		push ecx					;push counter in the stack
loop2:								
		cmp  ecx, 0					;inner loop first condition (i<arr_size)
		jle  exitLoop2					;jump label if less than or equal 
		cmp  edx, Array[4*ecx-4]			;inner loop second condition (temp<Array[j-1])
		jg   exitLoop2					;jump label

		mov  esi, 0				 	;clear esi
		mov  esi, Array[4*ecx-4]			;esi = Array[j-1]
		mov  Array[4*ecx], esi				;Array[j] = esi
		dec  ecx					;ecx-- (j--)

		jmp  loop2

exitLoop2:
		mov  edx, 0					;clear edx
		mov  edx, temp					;edx = temp
		mov  Array[4*ecx], edx				;Array[j] = edx
		pop  ecx					;restore
		inc  ecx					;ecx++ (i++)
		jmp  loop1
exitLoop1:                                      

;------------------------------------------------------------------------------------------------
;end of insertion code

; --------------Selection Sort begin--------------------------------

Selection_Sort: 
		mov ESI,  offset Array ;loading array base address in esi
		mov ecx,arr_size         ;ecx = arr size
		
Select_loop1:                    			; label
		cmp ecx,0                		;compare ecx with 0
		jle exit_loop_1         		; exit loop label
		dec ecx                  		; decrement the counter by 1          
		mov MaxIndex,ecx         		; max index = current index
		push ecx                 		; push outer loop counter to save it from changes
		dec ecx	                 		; decrement counter to be used in inner loop 
		mov ESI,  offset Array          	;loading array base address in esi

Select_loop2: 
		cmp ecx,0                		; inner loop counter 
		jl exit_loop_2				; exit loop if counter is less than 0
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

;------------------------
Bubble_Sort:
		mov ESI, offset Array					; Load ESI with start address of the Array
		MOV eax, arr_size					; get the lenght of array in eax
		CMP arr_size, 1
		JE Output				; if there is only one element in the array skip the bubble sort algorithm
		dec eax						; dec eax by 1 
		mov ecx,0			; outloop = arr_size-1
; Start Outer Loop
L1:
		cmp ecx,eax
		jge Output
		push ecx
		mov ecx ,0					; push ECX to the stack to keep the outLoop counter from chainging

L2:
;shift the  inner Loop index
pop edx     ;i
mov ebx,edx ;ebx=i
push edx ;edx will be pushed
mov edx,eax ;edx = size-1
neg ebx
add edx,ebx ;edx=size-1-i  
cmp ecx,edx
jge exit_L2
		if_l2:
		mov ebx,Array[ecx*4]       ;ebx = array[j]
		mov edx,Array[4*ecx+4]	  ;edx = array[j+1]
		mov edi,ecx				  ; edi = j (save it in other register)
		INC ecx					  ; j++
		cmp ebx,edx				  ; compare array[j] & array[j+1]
		JLE L2
		; Swap Values
		mov Array[4*edi+4],EBX	  
		mov Array[edi*4], EDX
		JMP L2



exit_L2:
	pop ecx							; resotring the outer counter
	inc ecx							;i++
	jmp L1 
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