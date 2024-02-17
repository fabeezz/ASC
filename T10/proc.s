.data

.text
proc:
    pushl %ebp
    mov %esp, %ebp
    # anything here
    popl %ebp
    ret

.global main 
main:
    push n
    call proc
    popl %edx

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80