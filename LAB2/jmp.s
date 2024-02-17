.data
    text1: .asciz "Text1"
    text2: .asciz "Text2"
.text
.global main
main:

    jmp print_text2

    mov $4, %eax
    mov $1, %ebx
    mov $text1, %ecx
    mov $5, %edx
    int $0x80

print_text2:
    mov $4, %eax
    mov $1, %ebx
    mov $text2, %ecx
    mov $5, %edx
    int $0x80

    mov $1, %eax
    mov $0, %ebx
    int $0x80