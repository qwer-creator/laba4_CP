 model small
 .stack 256
 .data 
 t db 10
 a db -2
 b db 5
 D dw ?
 data1 DB '3!$'
 data2 DB '1!$'
 data3 DB '5!$'
 data4 DB '2!$'
 .code 
 begin:
 mov ax,@data
 mov ds,ax

 mov dh,b
 mov dl,a
 
 cmp t,dh
 jge next4
 
 cmp dl,t
 jle next2
 jl next1
 
 next1:
   lea dx,data1
    mov ah,09h
    int 21h
    mov al,t
 mov ah,0
 mul al
 mul al
 mul al
 mul al
 jmp exit

 
 next2:
 lea dx,data2
    mov ah,09h
    int 21h
    cmp dh,t
 jl next3
 
  next4:
  
   lea dx,data4
    mov ah,09h
    int 21h
    mov cl,5
    mov al,t
 mov ah,0
 div cl
 jmp exit
 
 next3:
 lea dx,data3
    mov ah,09h
    int 21h
    mov al,t
 mov ah,0
 add al,7
 jmp exit
 

 exit:
 mov D,ax
 mov ax,4c00h 
 int 21h
 end begin