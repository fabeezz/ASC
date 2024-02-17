main:
pushl n
pushl $v3
pushl $v2
pushl $v1
call mutual0rtogonali
addl $16, %esp

mutual0rtogonali:
pushl %ebp
movl %esp, %ebp

# %esp: %ebp: (ebp v)(<ret adr>)(v1)(v2)(v3)(n)

pushl %ebx

# %esp: (ebx v) %ebp: (ebp v)(<ret adr>)(v1)(v2)(v3)(n)

subl $12, %esp

# %esp: (p23)(p13)(p12)(ebx v) %ebp: (ebp v)(<ret adr>)(v1)(v2)(v3) ( n )
#      -16   -12   -8    -4             0       4        8   12   16  20

pushl 20(%ebp)
pushl 12(%ebp)
pushl 8(%ebp)
call produsScalar
popl %edx
popl %edx
popl %edx

movl %eax, -8(%ebp)

movl -8(%ebp), %eax
addl -12(%ebp), %eax
addl -16(%ebp), %eax
cmp $0, %eax
je sunt_ortogonali
nu_sunt_ortogonali:
    movl $0, %eax
    jmp exit
sunt_ortogonali:
    movl $1, %eax
    jmp exit

exit:
# %esp: (p23)(p13)(p12)(ebx v) %ebp: (ebp v)(<ret adr>)(v1)(v2)(v3) ( n )

addl $12, %esp
popl %ebx
popl %ebp
ret

