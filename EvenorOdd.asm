.data

Number:
	.string "Enter number: "

EvenN:
	.string " Number is Even"
	
OddN:
	.string " Number is Odd and not Prime"
	
PrimeN:
	.string " Number is Odd and Prime"
	
.text
main:

la a0, Number
li a7, 4
ecall

li a7,5
ecall
addi x10, a0, 0


	add x5, x0, x0 # will switch between 0 and 1 to know if odd or even, start with even
	add x6, x0, x0 # add to x6 till reaching input number
	xori x12, x0, 1 # x12 is now 1111111111 since xor of 1 and 0 is always 1, will be used for NOT operation
	beq x6, x10, Exit # do not go to loop is input is 0
Loop:   xor x5, x12, x5 # NOT operation, to switch between 1 and 0, 0 is even, 1 is odd
	addi x6, x6, 1 # increment x6 till reaching input
	bne x6, x10, Loop
Exit: beq x5, x0, Even

	addi x14, x0, 2 # loop lower limit, loop to find if prime inside loop of odd number
	div x13, x10, x14 # loop upper limit
	add x20, x0, x0 # our c
Check:add x15, x0, x10
	div x16, x10, x14
	mul x16, x16, x14
	sub x16, x10, x16
	bne x16, x0, Skip
	addi x20, x20, 1
Skip: addi x14, x14, 1 # x14++
	bge x13, x14, Check # for (i = 2; i <= n/2; i++)
	beq x20, x0, Prime
	la a0, OddN
	li a7, 4
	ecall
	beq x0, x0, Final
Prime: 
	la a0, PrimeN
	li a7, 4
	ecall
	beq x0, x0, Final
	
Even:
	la a0, EvenN
	li a7, 4
	ecall
	
Final: