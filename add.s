# William Duong
# CPSC 440-02
# Week 2 Assignment

# This program will add +146 and -82 and place the result in $10

# Program Instructions
.text
.globl main

main:

# Load the +146
li $t0, 146

# Load the -82
li $t1, -82

# Add the numbers
add $t2, $t0, $t1

# Print output
li $v0, 1
move $a0, $t2
syscall

# Program end
li $v0, 10
syscall