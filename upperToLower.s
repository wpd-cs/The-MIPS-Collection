# William Duong
# CPSC 440-02
# Week 5 Assignment

# This program will switch upper-case letters
# lower-case letters.

.data
string: .asciiz "ABCDEFG"

# Program Instructions
.text
.globl main

main:

# Initialize loop counter
li $t1, 0

loop:

# Load character
lb $t2, string($t1)

# Set exit condition
beq $t2, 0, exit 

# Add 0x20 to character to uncapitalize
add $t2, $t2, 0x20

# Store lower-case char back in spot in string
sb $t2, string($t1)

# Increment loop counter
addi $t1, $t1, 1

j loop


exit:

la $t3, string

# Print string
li $v0, 4
move $a0, $t3
syscall

# Program end
li $v0, 10
syscall