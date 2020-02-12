# conversion.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
	li $t0, 0 #i
	li $t1, 5 #length
	li $v0, 0 #z
	li $t4, 3 
loop:
	beq $t0, $t1, exit_loop
	sll $t2, $a0, 1
	sub $t3, $t2 $a1
	add $v0, $v0, $t3 

	blt $a0, $t4, smaller
	addi $a1, $a1, -1

smaller:
	addi $a0, $a0, 1
	addi $t0, $t0, 1

	j loop

exit_loop:
	# jump to ra, back to outside function
	jr $ra

main:
	# ints
	li $a0, 5
	li $a1, 7

	# jump andl link next line
	jal conv 

	# print 
	move $a0, $v0 
	li $v0, 1
	syscall




exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0 10
	syscall

