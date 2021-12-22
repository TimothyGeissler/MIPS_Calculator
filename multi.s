.data
    first: .asciiz "enter number 1:"
    second: .asciiz "enter number 2:" 
    third: .asciiz "result:" 
    space: .asciiz "\n"

.text

main:

    _beginning:
    li $t3, 0
    #print number 1
    li $v0, 4
    la $a0, first
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 #t0 = the first number

    beqz $t0, _break 


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
    _break:


    jr $ra