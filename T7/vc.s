.data
n: .long 5
v: .long 10, 20, 30, 40, 50

.text

.global main

main:
lea v, %edi
mov $0, %ecx
movl (%edi, %ecx, 4), %edx

etexit:
mov $1, %eax
mov $0, %ebx
int $0x80
