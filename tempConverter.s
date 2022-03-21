# William Duong
# CPSC 440-02
# Week 6 Assignment


# This program will convert between Fahrenheit
# and Celsius


.data
scalePrompt: .asciiz "Enter Scale		: "
tempPrompt: .asciiz "Enter Temperature		: "

input: .space 8

celcOutput: .asciiz "Celsius Temperature		: "
fahrOutput: .asciiz "Fahrenheit Temperature	: "

celcSpace: .asciiz "C\n\n"
fahrSpace: .asciiz "F\n\n"

celc: .byte 'C'
fahr: .byte 'F'
capQ: .byte 'Q'
lowQ: .byte 'q'

done: .asciiz "Done"

# Program Instructions
.text
.globl main


main:


loop:

# Get scale C or F (if Q/q, then exit)
# Print scale prompt
li $v0, 4
la $a0, scalePrompt
syscall

# Input scale
li $v0, 8
la $a0, input
li $a1, 8
# move $t0, $a0
syscall


# Load input into a register
lb $t0, ($a0)
lb $t1, capQ


# Exit condition
lb $t1, capQ
beq $t0, $t1, exit
lb $t1, lowQ
beq $t0, $t1, exit


# Get temperature integer
# Print temperature prompt
li $v0, 4
la $a0, tempPrompt
syscall

# Input temperature
li $v0, 5
syscall

# Load temperature into a register
move $t2, $v0


# Scale condition
lb $t1, celc
beq $t0, $t1, celsius
lb $t1, fahr
beq $t0, $t1, fahrenheit


celsius:

# Load 9 and 5 into registers
li $t9, 9
li $t8, 5

# Multiply the input temp with 9
mult $t2, $t9
mflo $t2

# Divide the product of the last op by 5
div $t2, $t8
mflo $t2

# Sum the quotient of the last op with 32
addi $t2, $t2, 32

# Print Fahrenheit output
la $t9, fahrOutput
li $v0, 4
move $a0, $t9
syscall

# Print resulting temp
li $v0, 1
move $a0, $t2
syscall

# White space
li $v0, 4
la $a0, fahrSpace
syscall

j continue


fahrenheit:

# Load 9, 5, and 32 into registers
li $t9, 9
li $t8, 5
li $t7, 32

# Subtract the input temp with 32
sub $t2, $t2, $t7

# Multiply the difference of the last op with 5
mult $t2, $t8
mflo $t2

# Divide the product of the last op with 9
div $t2, $t9
mflo $t2

# Print Celsius output
la $t9, celcOutput
li $v0, 4
move $a0, $t9
syscall

# Print resulting temp
li $v0, 1
move $a0, $t2
syscall

# White space
li $v0, 4
la $a0, celcSpace
syscall

j continue


continue:
j loop

exit:

# Print "done" string
la $t9, done
li $v0, 4
move $a0, $t9
syscall

# Program end
li $v0, 10
syscall
