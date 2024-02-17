.data
    matrix1: .zero 400
    matrix2: .space 400
    m: .space 4
    n: .space 4
    p: .space 4
    k: .space 4
    pairScanf: .asciz "%d %d"
    integerScanf: .asciz "%d"
    pairPrintf: .asciz "%d %d\n"
    integerPrintf: .asciz "%d "
    newlinePrintf: .asciz "\n"
    newline: .asciz "\n"
    row: .space 4
    column: .space 4
    lineIndex: .space 4
    columnIndex: .space 4

.text

#print_matrix(&mat, m, n) > afiseaza matricea ca in cerinta (cu spatii intre caractere si newline dupa fieacer rand)
print_matrix:

    movl $1, %ecx
    for_lines:

        cmp m, %ecx
        jge return
        
        movl $1, %edx
            for_columns:
                
                cmp n, %edx
                jge get_new_line

                pushl %ecx
                pushl %edx

                # indexul este lineIndex*n + columnIndex
                movl %ecx, %eax
                mull n
                addl %edx, %eax
                # %eax = lineIndex*n +columnIndex
                lea matrix1, %edi
                movl (%edi, %eax, 4), %ebx
                
                pushl %ebx
                pushl $integerPrintf
                call printf
                popl %ebx
                popl %ebx
               
                pushl $0
                call fflush
                popl %ebx

                popl %edx
                popl %ecx

                incl %edx
                jmp for_columns
get_new_line:
pushl %ecx

#movl $4, %eax
#movl $1, %ebx
#movl $newLine, %ecx
#movl $2, %edx
#int $0x80

pushl $newlinePrintf
call printf
popl %ecx

popl %ecx

incl %ecx
jmp for_lines
return:
    ret

.global main
main:
    pushl $n
    pushl $m
    pushl $pairScanf
    call scanf
    popl %edx
    popl %edx
    popl %edx

    pushl $p
    pushl $integerScanf
    call scanf
    popl %edx
    popl %edx

    mov $0, %ecx

loop_citire:
    cmp p, %ecx
    jge exit_loop_citire

    pushl %ecx # printf si scanf schimba pe %ecx

    pushl $column
    pushl $row
    pushl $pairScanf
    call scanf
    popl %edx
    popl %edx
    popl %edx

    #pushl column
    #pushl row
    #pushl $pairPrintf
    #call printf
    #popl %edx
    #popl %edx
    #popl %edx

    movl row, %eax
    incl %eax
    movl n, %ebx
    mull %ebx
    add column, %eax
    incl %eax

    lea matrix1, %edi
    movb $1, 0(%edi, %eax, 1)

    popl %ecx

    inc %ecx
    jmp loop_citire

exit_loop_citire:

    pushl $k
    pushl $integerScanf
    call scanf
    popl %edx
    popl %edx


    pushl n
    pushl m
    pushl $matrix1
    call print_matrix
    popl %edx
    popl %edx
    popl %edx

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80