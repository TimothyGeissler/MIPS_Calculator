.data
    welcome: .asciiz "\n\n        ╔══════════════════════════════════════╗\n        ║ MIPS Calculator by T.Geissler & B.C  ║\n        ╚══════════════════════════════════════╝\n\n\n         ╔════════════╗          ╔════════════╗\n         ║   1. Add   ║          ║2. Subtract ║\n         ╚════════════╝          ╚════════════╝\n\n         ╔════════════╗          ╔════════════╗\n         ║ 3. Divide  ║          ║4. Multiply ║\n         ╚════════════╝          ╚════════════╝\n\nEnter Operation: "
    first: .asciiz "enter number 1:"
    second: .asciiz "enter number 2:" 
    third: .asciiz "result:" 
    space: .asciiz "\n"

.text

.globl main

main:

_beginning:

    li $v0, 4
    la $a0, welcome
    syscall

    li $v0, 5
    syscall

    li $s1, 1
    li $s2, 2
    li $s3, 3
    li $s4, 4

    beq $v0, $s1, _add
    beq $v0, $s2, _subtract
    beq $v0, $s3, _divide
    beq $v0, $s4, _multiply


    _add: 
        li $v0, 4
        la $a0, first
        syscall

        li $v0, 5
        syscall
        move $t2, $v0 #t2 = the first number

        #print number 2
        li $v0, 4
        la $a0, second
        syscall

        li $v0, 5
        syscall 
        move $t7, $v0 #t7 = second number 

        #print answer 
        li $v0, 4
        la $a0, third
        syscall

        add $a0, $t2, $t7
     
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, space
        syscall

        j _beginning

    _subtract: 
        li $v0, 4
        la $a0, first
        syscall

        li $v0, 5
        syscall
        move $t2, $v0 #t2 = the first number


        #print number 2
        li $v0, 4
        la $a0, second
        syscall

        li $v0, 5
        syscall 
        move $t7, $v0 #t7 = second number 


        #print answer 
        li $v0, 4
        la $a0, third
        syscall

        sub $a0, $t2, $t7
     
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, space
        syscall

        j _beginning
    _multiply: 
        li $t3, 0
        #print number 1
        li $v0, 4
        la $a0, first
        syscall

        li $v0, 5
        syscall
        move $t0, $v0 #t0 = the first number


        #print number 2
        li $v0, 4
        la $a0, second
        syscall

        li $v0, 5
        syscall 
        move $t1, $v0 #t1 = second number 


        #print answer 
        li $v0, 4
        la $a0, third
        syscall

        #multiply
        li $t2, 0 #counter
        _loop:
            beq $t2, $t1, _finished
            add $t3, $t3, $t0
            addi $t2, $t2, 1
        j _loop

        _finished:
        move $a0, $t3
     
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, space
        syscall

        j _beginning

    _divide: 
        li $t3, 0
        #print number 1
        li $v0, 4
        la $a0, first
        syscall

        li $v0, 5
        syscall
        move $t0, $v0 #t0 = the first number


        #print number 2
        li $v0, 4
        la $a0, second
        syscall

        li $v0, 5
        syscall 
        move $t1, $v0 #t1 = second number 


        #print answer 
        li $v0, 4
        la $a0, third
        syscall

        #multiply
        li $t2, 0 #counter
        _dloop:
            blt $t0, $t1, _dfinished
            sub $t0, $t0, $t1
            addi $t2, $t2, 1
        j _dloop

        _dfinished:
        move $a0, $t2
     
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, space
        syscall

        j _beginning




    jr $ra
