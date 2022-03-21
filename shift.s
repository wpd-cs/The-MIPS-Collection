# William Duong
# CPSC 440-02
# Week 3 Assignment

# This program will shift 0x1A left 2 positions

# Program Instructions
.text
.globl main

main:

# Load the 0x1A
li $t0, 0x1A

# Shift 0x1A left by 2
sll $t1, $t0, 2

# Print output
li $v0, 1
move $a0, $t1
syscall

# Program end
li $v0, 10
syscall