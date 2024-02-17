.data
x: .space 196

y: .long 5
z: .space 56
t: .long 1
.text
.global main
main:
mov $t, %eax
sub $x, %eax
and $10000, %eax
final:
mov $1, %eax
mov $0, %ebx
int $0x80