.data
m0: .asciiz "Enter a String: "
m1: .asciiz "\nNumber of characters: "
m2: .asciiz "\nNumber of spaces: "
size: .space 255

.text
li $v0, 4
la $a0, m0
syscall

li $v0, 8
la $a0, size
li $a1, 255
move $t0, $a0
syscall

lbu $t1, 0($t0)
li $t2, 0
li $t3, 0

loop:
beq $t1, 0, exit
add $t2, $t2, 1
add $t0, $t0, 1
beq $t1, 32, space
lbu $t1, 0($t0)
j loop

space:
add $t3, $t3, 1
lbu $t1, 0($t0)
j loop

exit:
li $v0, 4
la $a0, m1
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, m2
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall