.data
x: .space 4
divizor: .space 4
suma: .space 4

formatScanf: .asciz "%d"
formatPrintf: .asciz "%d "
.text
perfect:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    # %esp: (ebx v) %ebp: (ebp v)(<ret>)(x)
    
    movl 8(%ebp), %ebx    # ebx = x
    shrl $1, %ebx         # ebx = ebx/2

    # !!!
    pushl divizor  # <=> subl $4, %esp
    pushl suma
    
    # %esp: (suma)(divizor)(ebx v) %ebp: (ebp v)(<ret>)(x)
    
    movl $1, -8(%ebp)
    for_divizori:
        movl -8(%ebp), %ecx
        cmp %ebx, %ecx
        jg for_divizori_end

        movl 8(%ebp), %eax
        xorl %edx, %edx
        divl %ecx
        cmp $0, %edx
        jne nu_este_divizibil
        este_divizibil:
            addl %ecx, -12(%ebp) # suma += %ecx (divizorul)
        nu_este_divizibil:

        incl -8(%ebp)
        jmp for_divizori
    for_divizori_end:
    
    movl -12(%ebp), %ebx
    movl 8(%ebp), %ecx
    cmp %ecx, %ebx
    je egale

    not_egale:
        movl $0, %eax
        jmp exit
    egale:
        movl $1, %eax
        jmp exit
    
    exit:
    # !!!
    addl $8, %esp

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
call perfect
popl %edx

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

#y = 6
#x= &y
#eax = &x
#
#movl 0(%eax), %eax => eax = x = &y
#movl 0(%eax), %eax => eax = y = 6
#
#0(%eax) 
#
#4 arg .long - 16 bytes
#%ebx .long - 4 bytes
#6 var loc .long - 24 bytes
#r.a. + ebp 8 
#total: 52 bytes / 4 = 13 longuri
#
#%ebp - 0xFFCF0AA0
#
#%esp - 0xFFEF1020
#
#13 longuri per apel
#
#2,098,560 bytes / 4 = 524,640 longuri
#
#524,640 / 13 = 40,356 apeluri
#
#apelul 40,357 avem seg fault
#
#eticheta = 571
#jmp (eticheta+4)
#
#575 = divl $0
#%ecx= 2059239757095235