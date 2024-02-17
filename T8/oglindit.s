# Cerinta: Facem oglinditul a unui sir de caractere
# mihai -> iahim

#printf("%s\n", sir)
.data
sir: .asciz "mihai"
sir_inv: .space 6
n: .long 5
i: .long 0
.text
.global main

main:
movl n, %ecx
lea sir, %edi
lea sir_inv, %esi

for:
cmp $-1, %ecx
je et_exit

movb (%edi, %ecx, 1), %dl

movl i, %ebx
movb %dl, (%esi, %ebx, 1)

decl %ecx
incl i
jmp for

et_exit:
movl $4, %eax
movl $1, %ebx
movl $sir_inv, %ecx
movl $6, %edx

movl $0, %eax
movl $1, %ebx
int $0x80