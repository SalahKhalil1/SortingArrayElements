.model small
 .stack 100h 
 .data
    n db 11h,99h,22h,88h,33h,77h,44h,66h
    count dw 8
  
 .code
 
 begin: 
    mov ax,@data
    
    mov ds,ax
    
    mov cx,count 
    dec cx       