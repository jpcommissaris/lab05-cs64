# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:

    addi $a1, $a1, -5 
    sll $v0, $a1, 2
    
    jr $ra

routineA:
    # push to stack
    addiu $sp, $sp, -8  # saves 2 registers
    sw $ra, 4($sp)
    sw $s1, 0($sp)

    #function
    li $t1, 3
    sll $s1, $a0, 1
    mult $a1, $t1 
	mflo $a1
    jal routineB  # returns v0 for y*3

    add $s1, $s1, $v0
    addi $a1, $s1, -1 
    jal routineB  # returns correct $v0

    # pop from stack 
    lw $s1, 0($sp)
    lw $ra, 4($sp)
    addiu $sp, $sp, 8  # restores 2 registers
    jr $ra

main:
    li $a0, 5
    li $a1, 7
    jal routineA
    move $s0, $v0

    li $v0, 1
    move $a0, $v0
    syscall
	

exit:
	li $v0, 10
    syscall

