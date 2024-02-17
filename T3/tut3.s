.data 
s: .long 0 
.text 

.globl main 

main: 

mov $1, %edx 
mov $0, %eax 
movl $0xffffffff, %ebx 
divl %ebx 
mov %eax, %ecx 
movl %eax, s

mov $4, %eax
mov $1, %ebx
mov $s, %ecx
/mov $15, %edx
int $0x80


movl $1, %eax 
movl $0, %ebx 
int $0x80 