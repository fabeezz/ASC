.data
n: .long 5
v: .long 8, 2, 3, 4, 6
si: .long 0
sp: .long 0

.text
.global main

main:
mov $0, %ebx
mov $0, %esp
mov $2, %ebp
mov $0, %esi #punem in registri valorile necesare

lea v, %edi # "punem in edi vectorul"
mov n, %ecx
dec %ecx

etloop:
movl $0, %edx
movl (%edi, %ecx, 4), %eax #punem in eax pe v[ecx]
divl %ebp
cmp %edx, %esi # comparam restul cu 0 sau 1
je even

odd: 
add $1, %ebx
loop etloop

even:
add $1, %esp
loop etloop

mutsifinal:
mov $0, %ecx
mov $0, %edx
movl (%edi, %ecx, 4), %eax
divl %ebp
cmp %edx, %esi
je even1

odd1: 
add $1, %ebx
jmp etexit

even1:
add $1, %esp
jmp etexit

movl %ebx, si
movl %esp, sp

etexit:
mov $1, %eax
mov $0, %ebx
int $0x80
