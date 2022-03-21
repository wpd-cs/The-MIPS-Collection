# William Duong
# CPSC 440-02
# Week 7 Assignment

# This program will take user input, multiply them together,
# then print out the product

.data
aPrompt: .asciiz "Enter A	: "
xPrompt: .asciiz "Enter X	: "
yPrompt: .asciiz "Enter Y	: "

product: .asciiz "Product	: "

wSpace: .asciiz "\n\n"


# Program Instructions
.text
.globl main


main:


loop:


# Get A
# Print A prompt
li $v0, 4
la $a0, aPrompt
syscall

# Input A
li $v0, 5
syscall

# Load A into a register $t1
move $t1, $v0


# Get X
# Print X prompt
li $v0, 4
la $a0, xPrompt
syscall

# Input X
li $v0, 5
syscall

# Load X into a register $t2
move $t2, $v0


# Get Y
# Print Y prompt
li $v0, 4
la $a0, yPrompt
syscall

# Input Y
li $v0, 5
syscall

# Load Y into a register $t3
move $t3, $v0


# Send arguments to subroutine registers
move $a1, $t1
move $a2, $t2
move $a3, $t3


# Call subroutine
jal getProduct
nop


# Get return value
move $t0, $v1


# Print product output
la $t9, product
li $v0, 4
move $a0, $t9
syscall

# Print resulting product
li $v0, 1
move $a0, $t0
syscall

# Print white space
la $t8, wSpace
li $v0, 4
move $a0, $t8
syscall


j loop


getProduct:

# A * X
mult $a1, $a2
mflo $a1

# (A * X) * Y
mult $a1, $a3
mflo $a0

# Return value
move $v1, $a0

jr $ra