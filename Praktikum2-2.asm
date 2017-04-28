.text
.globl ___start

___start:
	
	#print description string
	la $a0,description
	li $v0, 4
	syscall
	
	#read int
	li $v0, 5
	syscall
	
	#parameter n for magic_n
	move $a0, $v0
	
	jal magic_n
	
	#save result in s0
	move $s0, $v0
	
	#print answer string
	la $a0,answer
	li $v0, 4
	syscall
	
	#print result
	move $a0,$s0
	li $v0,1
	syscall
	
	#end program
	li $v0, 10
	syscall
	
	
magic_n:

	addi $sp,$sp,-4
	sw $ra, 0($sp)
	
	
	ble $a0,100,switchToRecursive
	
	# if n > 100
	addi $v0,$a0,-10
	
	lw   $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
	
	switchToRecursive:
	
	# else if n <= 100
	addi $a0,$a0,11
	jal magic_n
	
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
	
	
.data
buffer: .space 4
description: .asciiz "Integer eingeben: "
answer: .asciiz "Antwort: "
