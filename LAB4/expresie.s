# ((x + y) ∗ (x − y) ∗ (x + z))/(y + z)

.data

x: .long 2
y: .long 1
z: .long 3
s: .space 4

.text
.global main

main:
mov y, %eax
addl z, %eax
pushl %eax  # %esp: (y+z)

mov x, %eax
addl z, %eax
pushl %eax  # %esp: (x+z), (y+z)

mov 0(%esp), %eax # %eax=(x+z)
mov 4(%esp), %ebx # %ebx=(y+z)
subl %ebx, %eax # eax = eax-ebx
pushl %eax # %esp: x-y, x+z, y+z

mov x, %eax
addl y, %eax
pushl %eax # %esp: x+y, x-y, x+z, y+z

popl %eax
popl %ebx
mul %ebx
pushl %eax # %esp: (x+y)*(x-y), x+z, y+z

popl %eax
popl %ebx
mul %ebx
pushl %eax # %esp: (x+y)*(x-y)*(x+z), y+z

popl %eax
popl %ebx
mov $0, %edx #%esp: stiva goala
div %ebx

#eax = rezultatul

mov %eax, s

etexit:
mov $1, %eax
mov $0, %ebx
int $0x80