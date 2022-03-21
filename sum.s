# William Duong
# CPSC 440-02
# Week 1 Assignment

# This program will add 3 and 2 together

# Global Data
.data
three: .word 3
two: .word 2

# Program Instructions
.text
.globl main

main:

# Load 3 and 2
lw $t1, three
lw $t2, two

# Add 3 and 2 and store in $t0
add $t0, $t1, $t2

# Print output
li $v0, 1
move $a0, $t0
syscall

# Program end
li $v0, 10
syscall