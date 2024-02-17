# aduna(a, b, &c)

.data
    a: .long 7
    b: .long 8
    c: .space 4
.text

aduna:
    pushl %ebp #esp: (ebp_vechi), (return address), a, b, (&c)
    mov %esp, %ebp #esp: ebp: (ebp_vechi), (return address), a, b, (&c)

mov 8(%ebp), %eax
addl 12(%ebp), %eax
mov 16(%ebp), %ecx
mov %eax, 0(%ecx)

    popl %ebp # esp: (return_address), a, b, (&c)
    ret

.global main

main:
pushl $c    #esp: (&c)
pushl b     #esp: b, (&c)
push a      #esp: a, b, (&c)
call aduna
popl %edx
popl %edx
popl %edx

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80