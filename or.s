# William Duong
# CPSC 440-02
# Week 1 Assignment

# This program will OR a hexadecimal value with another value

# Program Instructions
.text
.globl main

main:

# Load the first hexadecimal value
li $t0, 0x1234

# OR the two immediates
ori $t1, $t0, 0x6789

# Program end
li $v0, 10
syscall