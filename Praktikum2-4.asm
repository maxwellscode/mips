.text
.globl ___start

___start:
		
	la $a0,result		#result
	la $a1,matrix_5x5	#matrix
	la $a2,vector_5		#vector
	li $a3,5		#size
	
	jal vect_mult_res_matrix_vector_size
	
	la $a0,result	#set result address
	li $s2,0	#set s2 as loop variable
	
fromZeroToFour:
	
	bge $s2,$a3,EndOfLoop
	
	#print result
	l.s $f12,0($a0)
	li $v0,2
	syscall
	
	#line break
	move $s7,$a0
	la $a0,newLine
	li $v0,4
	syscall 
	move $a0,$s7
	
	addi $a0,$a0,4	#increase result by 4
	addi $s2,$s2,1	#increase loop var by 1
	j fromZeroToFour

EndOfLoop:
	
	#end program
	li $v0, 10
	syscall



vect_mult_res_matrix_vector_size:

	addi $sp,$sp,-4
	sw $ra, 0($sp)		#backup return address
	move $s5,$a2		#backup address of vector
	
	li $s0,0 		#set loop var i
	li $s1,0		#set loop var j
	
	i_Loop:
		bge $s0,$a3, iLoopExit
		
		li $s1,0			#reset loop var j
		l.s $f10,floatZeroConst		#reset sum 0.0
		
			j_Loop:
				bge $s1,$a3, jLoopExit
				
				#calc address of matrix element
				#addr = base address + (sizeof float * i_arr_size) * i + sizeof float * j
				
				move $t1, $a1 	#t1 = base addr
				
				li $t2,4  	#t2 = size of float
				
				mult $t2, $a3 	#t3 = t2 * i_arr_size
				mflo $t3
				
				mult $t3,$s0 	#t4 = t3 * i (row * i)
				mflo $t4
				
				mult $t2, $s1 	#t5 = t2 * j (4 * j)
				mflo $t5
				
				add $t6,$t4,$t5	#t6 = t4 * $t5
				add $t0,$t6,$t1 #addr = t6 + base addr
				
		
				# calculate sum
				# sum += matrix[i][j] * vector[j];
				l.s $f2,0($t0)		#f2 = matrix[i][j]
				l.s $f4,0($a2)		#f4 = vector[j]

				mul.s $f6,$f2,$f4	#f6 = f2 * f4
				add.s $f10,$f10,$f6	#sum (f10) += f6			
									
												
																		
				addi $a2,$a2,4		#increase vector addr by 4
				addi $s1,$s1,1		#increase loop var j
		
			j j_Loop
			
		jLoopExit:
		
		move $a2,$s5		#reset vector addr
		
		swc1 $f10,0($a0)

		addi $a0,$a0,4		#increase result address by 4
		addi $s0,$s0,1		#increase loop var i
		
	j i_Loop

iLoopExit:

	addi $sp,$sp,4
        jr $ra


.data
newLine : .asciiz "\n"

floatZeroConst: .float 0.0

vector_5:
		.float 1.0
		.float -2.0
		.float 3.0
		.float -4.0
		.float 5.0

matrix_5x5:	
		.float 1.0
		.float 2.0
		.float 3.0
		.float 4.0
		.float 5.0
		
		.float 2.0
		.float 3.0
		.float 4.0
		.float 5.0
		.float 6.0
		
		.float 3.0
		.float 4.0
		.float 5.0
		.float 6.0
		.float 7.0
		
		.float 4.0
		.float 5.0
		.float 6.0
		.float 7.0
		.float 8.0

		.float 5.0
		.float 6.0
		.float 7.0
		.float 8.0
		.float 9.0
	
result: 	.space 32	
