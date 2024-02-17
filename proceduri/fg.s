.data
x: .space 4

formatScanf: .asciz "%d"
formatPrintf: .asciz "%d "
.text
functia_g: #            g(x) = x+1
    pushl %ebp
    movl %esp, %ebp

    # %esp: %ebp: (ebp v)(<adr ret>)(x)

    movl 8(%ebp), %eax
    addl $1, %eax

    popl %ebp
    ret

functia_f:
    pushl %ebp
    movl %esp, %ebp

    # %esp: %ebp: (ebp v)(<adr ret>)(x)

    pushl 8(%ebp)
    call functia_g
    addl $4, %esp

    shll $1, %eax

    popl %ebp
    ret

.global main
main:

pushl $x
pushl $formatScanf
call scanf
addl $8, %esp

pushl x
call functia_f
addl $4, %esp

pushl %eax
pushl $formatPrintf
call printf
addl $8, %esp
pushl $0
call fflush
addl $4, %esp

et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80