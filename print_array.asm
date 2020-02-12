# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data

array: .word 1 2 3 4 5 6 7 8 9 10
length: .word 10
str1: .asciiz "The contents of the array are:\n"
nl: .asciiz "\n"


.text
printA:
	la $s2, ($a0) # saves address of array
	move $s3, $a1 # saves value of length
	li $s4, 1 # increment
loop:

	# print
	lw $t0, 0($s2)
	li $v0, 1
    move $a0, $t0
    syscall
	li $v0, 4
    la $a0, nl
    syscall


	#break loop if length
	beq $s3, $s4, exit_loop
	addiu $s4, $s4, 1 

	# increment pointer by 1
	addiu $s2, $s2, 4
	j loop

exit_loop: 
	jr $ra

main:
	li $v0, 4
	la $a0, str1
	syscall

	la $a0, array
	la $t1, length
	lw $a1, 0($t1)
	jal printA 

exit:
	li $v0, 10
	syscall

