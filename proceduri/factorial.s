.data
x: .space 4

formatScanf: .asciz "%d"
formatPrintf: .asciz "%d "
.text
factorial:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx

    # %esp: (ebx v) %ebp: (ebp v)(<adr ret>)(x)

    movl 8(%ebp), %ecx 
    decl %ecx
    # ecx = x-1
    movl $1, %eax
    
    cmp $0, %ecx
    je base_case

    pushl %ecx
    call factorial
    addl $4, %esp

    base_case:
    xorl %edx, %edx
    mull 8(%ebp)

    popl %ebx
    popl %ebp
    ret

.global main
main:

pushl $x
pushl $formatScanf
call scanf
addl $8, %esp

pushl x
call factorial
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