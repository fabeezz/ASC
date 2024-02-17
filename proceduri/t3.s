#S1
main:
pushl $cuv3
pushl $cuv2
pushl $cuv1
call celeMaiApropiate
popl %edx
popl %edx
popl %edx

celeMaiApropiate:
pushl %ebp
movl %esp, %ebp
# %esp: %ebp: (ebp v)(<ret adr>)(cuv1)(cuv2)(cuv3)

pushl %ebx

# %esp: (ebx v) %ebp: (ebp v)(<ret adr>)(cuv1)(cuv2)(cuv3)

subl $12, %esp

# %esp:(d23)(d13)(d12)(ebx v) %ebp: (ebp v)(<ret adr>)(cuv1)(cuv2)(cuv3)
#       -16  -12  -8    -4            0        4       8     12    16

# in -8(ebp) avem d12
pushl 8(%ebp)
pushl 12(%ebp)
call distantaCuvinte
addl $8, %esp
movl %eax, -8(%ebp)

# in -12(ebp) avem d13
pushl 8(%ebp)
pushl 16(%ebp)
call distantaCuvinte
addl $8, %esp
movl %eax, -12(%ebp)

# in -16(ebp) avem d23
pushl 12(%ebp)
pushl 16(%ebp)
call distantaCuvinte
addl $8, %esp
movl %eax, -16(%ebp)

movl -8(%ebp), %ebx
cmp -12(%ebp), %ebx
jl 12_maimic
13_maimic:
movl -12(%ebp), %ebx
jmp urm_comparatie
12_maimic:
movl -8(%ebp), %ebx
jmp urm_comparatie

urm_comparatie: # ebx = min(d12, d13)
# %esp:(d23)(d13)(d12)(ebx v) %ebp: (ebp v)(<ret adr>)(cuv1)(cuv2)(cuv3)
#       -16  -12  -8    -4            0        4       8     12    16

cmp -16(%ebp), %ebx
jl 1213_maimic
23_maimic:
movl -16(%ebp), %ebx
jmp final_comp
1213_maimic:
final_comp:

# ebx = min(d12, d13, d23)

cmp -8(%ebp), %ebx
je scot_12
cmp -12(%ebp), %ebx
je scot_13
cmp -16(%ebp), %ebx
je scot_23

scot_12:
    movl 8(%ebp), %eax
    movl 12(%ebp), %ecx
    jmp exit
scot_13:
    movl 8(%ebp), %eax
    movl 16(%ebp), %ecx
    jmp exit
scot_23:
    movl 12(%ebp), %eax
    movl 16(%ebp), %ecx
    jmp exit

exit:
popl %ebx
popl %ebp
ret

pushl %ecx
pushl %eax
pushl $pairPrintf
call printf
addl $12, %esp

pushl $0
call fflush
popl %edx

et_exit:
    movl $1, %eax
    xorl %ebx, %ebx
    int $0x80
...


# %esp:(d23)(d13)(d12)(ebx v) %ebp: (ebp v)(<ret adr>)(cuv1)(cuv2)(cuv3)
#       -16  -12  -8    -4            0        4       8     12    16

#S2

# %esp: (p23)(p13)(p12)(ebx v) %ebp: (ebp v)(<ret adr>)(v1)(v2)(v3) ( n )


&cuv3
&cuv2
&cuv1
<ret adr>
%ebp vechi
___________ ebp
ebx v 
(    )
(    )
(    )
&cuv1
&cuv2
<ret adr distantaCuvinte>
%ebp vechi distantaCuvinte
__________________________ esp