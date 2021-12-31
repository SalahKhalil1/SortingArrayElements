
include 'emu8086.inc'

org 100h
.model small

.data

.code

main proc

L2:
;shift the  inner Loop index
pop edx     ;i
mov ebx,edx ;ebx=i
push edx ;edx will be pushed
mov edx,eax ;edx = size-1
neg ebx
add edx,ebx ;edx=size-1-i 
  

          
          

