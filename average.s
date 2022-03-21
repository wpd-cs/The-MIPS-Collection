# William Duong
# CPSC 440-02
# Week 4 Assignment

# This program will find the average of the numbers
# declared in the data section (Should be 112)

# Data
.data
first: .byte 12
second: .byte 97
third: .byte 133
fourth: .byte 82
fifth: .byte 236

# Program Instructions
.text
.globl main

main:

# Load numbers
lbu $t1, first
lbu $t2, second
lbu $t3, third
lbu $t4, fourth
lbu $t5, fifth
li $t6, 5

# Sum all the numbers
addu $t1, $t1, $t2
addu $t1, $t1, $t3
addu $t1, $t1, $t4
addu $t1, $t1, $t5

# Divide the sum by the number of addends
divu $t1, $t6

mflo $t7

# Print output
li $v0, 1
move $a0, $t7
syscall

# Program end
li $v0, 10
syscall