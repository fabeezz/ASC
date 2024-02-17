.data 
x: .long 5
y: .long 6
.text
.global main
main:
movl x, %eax
movl y, %ebx
movl %eax, y
movl %ebx, x