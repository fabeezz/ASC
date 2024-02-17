.data

    a: .long 30
    b: .long 7
    sum: .space 4
    dif: .space 4
    prod: .space 4
    cat: .space 4
    rest: .space 4
.text
.global main
main:

    mov a, %eax
    add b, %eax
    mov %eax, sum

    mov a, %eax
    mov b, %ebx
    sub %ebx, %eax
    mov %eax, dif

    mov a, %eax
    mov b, %ebx
    mul %ebx
    mov %eax, prod

    mov a, %eax
    mov b, %ebx
    div  %ebx
    mov %eax, cat
    mov %edx, rest

    etextit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80