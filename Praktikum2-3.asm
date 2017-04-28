.text
.globl ___start

___start:

	li $s0,0
	
fromZeroToTen:
	
	bgt $s0,10,EndOfLoop
	
	#parameter a0 = 0,1,2,3,4,5,6,7,8,9
	move $a0, $s0
	jal male_n
	
	#print result
	move $a0,$v0
	li $v0,1
	syscall
	
	move $s1,$zero
	move $s2,$zero
	
	addi $s0,$s0,1
	j fromZeroToTen

EndOfLoop:
	
	#end program
	li $v0, 10
	syscall
	

male_n:
	
	addi $sp,$sp,-8
	sw $ra, 0($sp)
	sw $s1, 4($sp)
	
	bgt $a0,0,ifGreaterThanZero
	
		jal female_n
	
		lw   $ra, 0($sp)
		addi $sp,$sp,8
		jr $ra
	
	ifGreaterThanZero:
	
		move $s1,$a0
		
		addi $a0,$a0,-1
		jal female_n
		
		sub $a0, $s1, $a0 
		#move $a0,$s1
		move $v0,$a0
		lw   $ra, 0($sp)
        	lw   $s1, 4($sp)
        	addi $sp, $sp, 8
        	jr $ra      
	
	


female_n:

	addi $sp,$sp,-8
	sw $ra, 0($sp)
	sw $s1, 4($sp)
 
	bgt $a0,0, ifGreaterThanZero2
	
		move $v0, $a0
	
		lw   $ra, 0($sp)
		addi $sp,$sp,8
		jr $ra
	
	ifGreaterThanZero2:
	
		move $s1,$a0
		
		addi $a0,$a0,-1
		jal male_n
		
		sub $a0, $s1, $a0 
		move $v0,$a0
		
		lw   $ra, 0($sp)       
        	lw   $s1, 4($sp)
        	addi $sp, $sp, 8
        	jr $ra      
