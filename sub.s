.data
    first: .asciiz "enter number 1:"
    second: .asciiz "enter number 2:" 
    third: .asciiz "result:" 
    space: .asciiz "\n"

.text

main:

    _beginning:
    #print number 1
    li $v0, 4
    la $a0, first
    syscall

    li $v0, 5
    syscall
    move $t2, $v0 #t2 = the first number

    beqz $t2, _break 


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
    _break:


    jr $ra