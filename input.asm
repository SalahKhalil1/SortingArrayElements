.MODEL SMALL
 .STACK 100H
 .DATA  
 
    SIZE_MESSAGE  DW  'Enter Array size :$'
    Take_Elements  DW  ,0AH,0DH,'Please enter 16 bit Array Element :$'  
    Size_Error_Message  DW  ,0AH,0DH,'Please enter only Positive number as an Array Size, $'
    Type_Of_Sort  DW  ,0AH,0DH,'please,What is the Sorting Type Would You Choose?: $'
    Types_Message  DW  ,0AH,0DH,'1 for Bubble',0AH,0DH,' 2 for SELECTION' ,0AH,0DH,' 3 for Insertion',0AH,0DH,'$'  
    Sort_Type_Error  DW  'you can only choose 1 for bubble , 2 for Selection or 3 for Insertion:',0AH,0DH,'$'
    Assending_Sort  DW  ,0AH,0DH,'Assending Sort is:$'
    Dessending_Sort  DW  ,0AH,0DH,'Dessending Sort is:$'
    Empty_Array  DW  ,0AH,0DH,'your Array is empty,please enter an integer:$'