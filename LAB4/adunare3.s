# int aduna(a,b)
.data
    a: .long 4
    b: .long 9
    c: .space 4

.text

aduna:
pushl %ebp #esp: (ebp_vechi), (ret_address), (a), (b)
mov %esp, %ebp 
#esp: ebp: (ebp_vechi), (ret_addr), (a), (b)

    mov 8(%ebp), %eax
    addl 12(%ebp), %eax

popl %ebp #esp: (ret_addr), (a), (b)
ret #esp: (a), (b)

.global main

main:
pushl b #esp: (b)
pushl a #esp: (a), (b)
call aduna #esp: (ret_address), (a), (b)
mov %eax, c
popl %edx
popl %edx
et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80