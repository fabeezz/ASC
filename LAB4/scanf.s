.data
    a: .space 4
    b: .space 4
    formatScanf: .asciz "%d %d"
    formatPrintf: .asciz "Suma numerelor este %d\n"
.text
.global main
main:

    pushl $b
    pushl $a
    pushl $formatScanf
    call scanf
    popl %edx
    popl %edx
    popl %edx

    mov a, %eax
    addl b, %eax # in eax avem suma lui a si b

    pushl %eax 
    pushl $formatPrintf
    call printf
    popl %edx
    popl %edx

    pushl $0
    call fflush
    popl %edx

etexit:
mov $1, %eax
mov $0, %ebx
int $0x80