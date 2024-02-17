.data
 
    a: .long 4
    b: .long 9
    c: .space 4
 
.text
 
inmultire:
    pushl %ebp
    mov %esp, %ebp
 
    mov 8(%ebp), %eax
    mov 12(%ebp), %ebx
    mul %ebx
 
    popl %ebp
    ret
 
.global main
 
main:
 
    pushl b
    pushl a
    call inmultire
    mov %eax, c
    popl %edx
    popl %edx
 
etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80