.text
.globl __start


# Side Note
# If divided by zero, Infinity is return as result.

__start:
	
	#value 1
	li $v0, 7
	syscall
	nop
	mov.d $f2, $f0
	
	# value 2
	li $v0, 7
	syscall
	nop
	mov.d $f4, $f0
	
	# operation character
	li $v0, 12
	syscall
	nop
	move $s0, $v0
	
	# load available characters
	lb $t1, Plus
	lb $t2, Minus
	lb $t3, Multiplied
	lb $t4, Divided
	
	#switch	
_Addition:
	bne $s0, $t1, _Subtraction
	jal Addition
	j _Result
	
_Subtraction:
	bne $s0, $t2, _Multiplication
	jal Subtraction
	j _Result

_Multiplication:
	bne $s0, $t3, _Division
	jal Multiplication
	j _Result

_Division:
	bne $s0, $t4, _End
	jal Division
	j _Result
	
	
	
		
_Result:	
	#print answer string
	la $a0,Answer
	li $v0, 4
	syscall
	
	#print result
	li $v0,3
	syscall
_End:	
	#end program
	li $v0, 10
	syscall
	
	

Addition:

	addi $sp,$sp,-4
	sw $ra, 0($sp)
	
	add.d $f12,$f2,$f4
	
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra

Subtraction:

	addi $sp,$sp,-4
	sw $ra, 0($sp)
	
	sub.d $f12,$f2,$f4
	
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
	
Multiplication:

	addi $sp,$sp,-4
	sw $ra, 0($sp)
	
	mul.d $f12,$f2,$f4
	
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
	
Division:

	addi $sp,$sp,-4
	sw $ra, 0($sp)
	
	div.d $f12,$f2,$f4
	
	lw $ra, 0($sp)
	addi $sp,$sp,4
	jr $ra
	
	
	
.data
Plus: .asciiz "+"
Minus: .asciiz "-"
Multiplied: .asciiz "*"
Divided: .asciiz "/"

Answer: .asciiz "\nErgebnis: "
	
	
