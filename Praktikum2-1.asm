.text
.globl ___start

___start:

	la $s0,ThisText

forEveryCharacterInString:
	
	lb $t0,0($s0)
	
	beq $t0,$zero,EndOfFile
	
	addi $sp,$sp,-1  # Decrement stack pointer by 1
	sb   $t0,0($sp)  # Save character to stack
	
	addi $s0,$s0,1
	
	j forEveryCharacterInString
	
EndOfFile:
	#print text from stack
	add $a0,$sp,0
	li $v0,4
	syscall
	
	#end program
	li $v0, 10
	syscall
	
	
.data
ThisText: .asciiz "Das sollte nun auf dem Stack zu sehen sein"