	.data
InPut: .asciiz "Nhap vao ki tu: \n "
BeforeCharacter: .asciiz " \n Ki Tu Truoc La : \n "
AfterCharacter: .asciiz" \n Ki Tu Sau La : \n"
NumberType: .asciiz "\n Kieu Number"
ChuHoa: .asciiz "\n Kieu Chu Hoa "
ChuThuong: .asciiz"\n Kieu Chu Thuong "
Invalid: .asciiz "\n Invalid Type"
	.text
__Start: li $v0,4
	la $a0,InPut
	syscall
	li $v0,12
	syscall
	move $t1,$v0
	li $s1,123
	slt $s0,$t1,$s1
	bne $s0,$0, Continue1
		j END
Continue1: addi $s1,$0,96
	slt $s0,$s1,$t1
	bne $s0,$0,Normal_Character
	addi $s1,$0,91
	slt  $s0,$t1,$s1
	bne $s0,$0,Continue2 
	     j END			
	Normal_Character: la $a0,ChuThuong
			li $v0,4
			syscall
			j Main	
	Continue2: addi $s1,$0,64
			slt $s0,$s1,$t1
			bne $s0,$0,Capital_Character
			addi $s1,$0,72
			slt $s0,$t1,$s1
			bne $s0,$0,Continue3
			j END
	Capital_Character: la $a0,ChuHoa
			li $v0,4
			syscall
			j Main
	Continue3: addi $s1,$0,47
		slt $s0,$s1,$t1
		bne $s0,$0,Number
		j END
	Number: la $a0,NumberType
		li $v0,4
		syscall
		j Main
Main: addi $t2,$t1,1
	subi $t3,$t1,1
	la $a0, BeforeCharacter
	li $v0,4
	syscall
	add $a0,$t3,$0
	li $v0,11
	syscall 
	la $a0, AfterCharacter
	li $v0,4
	syscall
	add $a0, $t2, $0
	li $v0,11
	syscall
	j Exit 							
END: la $a0, Invalid
	li $v0,4
	syscall 

Exit:
