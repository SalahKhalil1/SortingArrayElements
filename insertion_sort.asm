
.model small  

.data
m1 db "Enter size of array $" 

         
.code 
                           
                 
         
        
main proc 
    mov ax , seg m1
    mov ds , ax
    mov dx , offset m1
    mov ah , 9h
    int 21h     ; print message1
    
    mov ah , 1h ; size of array stor in al
    int 21h     ; input size of array
    mov bl,al   ; save the size of array in bl 
  
    endp
end main