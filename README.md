# 32-Bit MIPS Processor (Harvard Architecture)

## Introduction

A 32-bit microprocessor with 42 instructions (including multiplication and division) and 8 X 32 registers and 2048 X 32 Ram with shared stack. An assembler is also available to write programs on the microprocessor using 8086-like assembly.

## Schematic

The full **schematic** can be found in the `rtl.pdf` file in the project main directory.

## Registers

|Register|Description|Number (Binary)
|---|---|---|
|AX|Accumulator|000|
|BX|Base|001|
|CX|Counter|010|
|DX|Data|011|
|SX|Extra|100|
|EX|Extra|101|
|EY|Extra|110|
|EZ|Extra|111|

## Instruction List

A total of 42 instructions are available to be executed on the microprocessor:

|Instruction|Operand 1|Operand 2|Description|
|---|---|---|---|
|NOP|N/A|N/A|No Operation|
|NOT|Reg|N/A|Logical Not|
|OUT|Reg|N/A| Output lower 8-bits of **Reg** on *port*|
|PUSH|Reg|N/A| Pop from the *stack* to **Reg**|
|POP|Reg|N/A| Push **Reg** on the *stack*|
|ST|Reg|memAddr|Store **Reg** into **ram[memAddr]**|
|LD|Reg|memAddr|Load from **ram[memAddr]** into **Reg**
|MOV|DST|SRC|Copy **SRC** to **DST**|
|CMP|REG 1| REG 2| Subtract **REG 1 - REG 2** while only changing flags|
|AND|DST| SRC| Logical AND |
|OR|DST| SRC| Logical OR|
|XOR|DST| SRC| Logical XOR|
|XNOR|DST| SRC| Logical XNOR|
|NOR|DST| SRC| Logical NOR |
|NAND|DST| SRC| Logical NAND
|ADD|DST| SRC| Add **SRC** and **DST**|
|SUB|DST| SRC| Subtract **SRC** from **DST**|
|MUL|DST| SRC| Multiply **DST** by **SRC** , Store the result in **DX:AX**|
|DIV|DST| SRC| Divide **DST** by **SRC**|
|MOVI|DST|*imm32*|Copy *imm32* to **DST**|
|ANDI|DST| *imm32*| Logical AND |
|ORI|DST| *imm32*| Logical OR|
|XORI|DST| *imm32*| Logical XOR|
|XNORI|DST| *imm32*| Logical XNOR|
|NORI|DST| *imm32*| Logical NOR |
|NANDI|DST| *imm32*| Logical NAND
|ADDI|DST| *imm32*| Add *imm32* and **DST**|
|SUBI|DST| *imm32*| Subtract *imm32* from **DST**|
|MULI|DST| *imm32*| Multiply **DST** by *imm32* , Store the result in **DX:AX**|
|DIVI|DST| *imm32*| Divide **DST** by *imm32*|
|HLT|N/A|N/A|Halt Execution|
|SLL|REG|N/A|Shift **REG** left by 1|
|SRL|REG|N/A|Shift **REG** right by 1|
|JMP|@Label|N/A|Jump to **Label** [Unconditional Jump]|
|JZ|@Label|N/A|Jump to **Label** if *zero flag* is **HIGH** [Jump Zero]|
|JNZ|@Label|N/A|Jump to **Label** if *zero flag* is **LOW** [Jump Not Zero]|
|JEQ|@Label|N/A|Jump to **Label** if *zero flag* is **HIGH** [Jump Equal]|
|JNEQ|@Label|N/A|Jump to **Label** if *zero flag* is **LOW** [Jump Not Equal]|
|JG|@Label|N/A|Jump to **Label** if *sign flag* is **LOW** and *zero flag* is **LOW** [Jump Greater]|
|JL|@Label|N/A|Jump to **Label** if *sign flag* is **HIGH** and *zero flag* is **LOW** [Jump Less]|
|JGE|@Label|N/A|Jump to **Label** if *sign flag* is **LOW** or *zero flag* is **HIGH** [Jump Greater or Equal]|
|JLE|@Label|N/A|Jump to **Label** if *sign flag* is **HIGH** or *zero flag* is **HIGH** [Jump Less or Equal]|

## Language Rules

The assembly language used is very similar to the one used in the 8086 with a few differences:

+ Labels
  + Labels start with the '@' charachter
  + The instrcution following the label has to be in a separate line.
  + Example:
  
```Assembly
MOVI CX, 0xF
@Loop
    SUBI CX, 0x1
    JNZ @Loop
HLT
```

+ Comments
  + Comments start with the ';' charachter.

```Assembly
; This is a valid comment.
```

+ Numbers
  + Numbers are written as follows

```Assembly
MOVI AX, 0b101000 ; Use the prefix "0b" for binary,
MOVI BX, 0d40     ; "0d" for decimal,
MOVI CX, 0x28     ; and "0x" for hexadecimal.
```

+ Case Sensitivity
  + This language is case insensetive.

## Run Your Program
To run your program on the processor, write it in `/chasm/goodisa.asm` and run the *chasm.py* file, then on modelsim, type `do ../test/topTst.do` to run the program.

## Sample Program
```Assembly
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
```