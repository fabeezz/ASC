# aduna(a, b, &c)

.data
    a: .long 5
    b: .long 6
    c: .space 4
.text
aduna:
    # %esp: 0-(return address), 4-(a), 8-(b), 12-(&c)
    mov 4(%esp), %eax
    addl 8(%esp), %eax
    mov 12(%esp), %ecx # in ecx avem suma a+b
    mov %eax, 0(%ecx) # 0 punem pt pointer
    ret # %esp: (a), (b), (&c)

.global main
main:
    pushl $c # %esp: (%c)
    pushl b  # %esp: (b), (%c)
    pushl a  # %esp: (a), (b), (%c)
    call aduna # %esp: (return address), (a), (b), (&c)
    popl %edx # golim stiva 
    popl %edx # golim stiva 
    popl %edx # golim stiva

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
