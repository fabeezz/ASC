.data
a: .long 10, 20, 30, 40, 50
n: .long 5

.text
.global main
main:

    lea a, %edi
    mov $0, %eax #suma
    mov $0, %ecx

    et_loop:

        cmp n, %ecx
        jge etexit
        
        mov 0(%edi, %ecx, 4), %ebx
        add %ebx, %eax

        inc %ecx
        jmp etloop

exit_loop:
    mov %eax, sum

et_exit:

    mov $1, %eax
    mov $0, %ebx
    int $0x80