; This program calculates the fibbonaci number of the number in the DX register.

nop
nop

@VarInit
    movi cx, 0x2    ; Iterator
    movi ax, 0x1    ; Auxillary register
    movi bx, 0x0    ; Result
    movi dx, 0d40   ; Input data

    movi ey, 0x1    ; Previous Fibonacci number
    movi ex, 0x1    ; Before previous Fibonacci number
    

@Loop
    cmp cx, dx
    jeq @EndLoop

    mov bx, ey
    add bx, ex
    mov ax, bx

    mov ex, ey
    mov ey, ax

    addi cx, 0x1
    
    jmp @Loop
@EndLoop

push bx
hlt