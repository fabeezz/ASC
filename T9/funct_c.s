#printf("ceva text %d", nr)
.data
a: .space 4
formatPrintf: .asciz "ceva text %d\n"
formatScanf: .asciz "%d"
.text

.global main
main:

pushl $a
push $formatScanf
call scanf
pop %edx
pop %edx

mov a, %eax

pushl a
pushl $formatPrintf
call printf
pop %edx
pop %edx

   pushl $0
    call fflush
    popl %edx
et_exit:
    mov $1,%eax
    mov $0,%ebx
    int $0x80