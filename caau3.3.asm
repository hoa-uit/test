# cau 3.3 

.data 
	stri1: .asciiz "\nNhap 2 so nguyen: "
	output1: .asciiz "\2 so nguyen vua nhap: "
	dl: .asciiz " "
	output2: .asciiz "\n So lon hon la: "
	output3: .asciiz "\n Tong 2 so: "
	output4: .asciiz "\n Hieu 2 so: "
	output5: .asciiz "\n Tich 2 so: "
	output6: .asciiz "\n Thuong 2 so: "			
.text

	li $v0,4
	la $a0,stri1
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0

	li $v0,5
	syscall
	move $t2,$v0
        
        li $v0,4
        la $a0,output1
        syscall
        
        li $v0,1
        addi $a0,$t1,0
        syscall
        
        li $v0,4
        la $a0,dl
        syscall
        
        li $v0,1
        addi $a0,$t2,0
        syscall

	slt $t3,$t2,$t1  # t1 > t2 ?
	beq $t3,0,j2
	
	li $v0,4
	la $a0,output2
	syscall
	
	li $v0,1
	addi $a0,$t1,0
	syscall
	
	j exit1
	
j2:	
	li $v0,4
	la $a0,output2
	syscall

	li $v0,1
	addi $a0,$t2,0
	syscall
exit1:

	add $t4,$t1,$t2  # t4 = t1 + t2
	sub $t5,$t1,$t2  # t5 = t1 - t2
	addi $s0,$t1,0
	addi $s1,$t2,0
	
	mult $s0,$s1
	mfhi $s0
	mflo $s0
	
	addi $t6,$s0,0
	
	
	addi $s0,$t1,0
	div $s0,$s1
	#mfhi $s0
	mflo  $t7
	
	#move $t7,$s0
	
	li $v0,4
	la $a0,output3
	syscall
	 
	li $v0,1
	addi $a0,$t4,0
	syscall
	
	li $v0,4
	la $a0,output4
	syscall
	
	li $v0,1
	addi $a0,$t5,0
	syscall
	
	li $v0,4
	la $a0,output5
	syscall
	
	li $v0,1
	addi $a0,$t6,0
	syscall
	
	li $v0,4
	la $a0,output6
	syscall
	
	li $v0,1
	addi $a0,$t7,0
	syscall
	