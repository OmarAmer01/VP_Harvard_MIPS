# This is a script to generate the test vecotrs for the ALU
# We have 14 operations to test:
    # NOT   0 
    # AND   1
    # OR    2
    # XOR   3
    # XNOR  4
    # NOR   5
    # NAND  6
    # SLL   7
    # SRL   8
    # ADD   9
    # SUB   10  A
    # MUL   11  B
    # DIV   12  C
    # PASS  13  D
    # PASSB 14  E

# Our outputs are the result of the operation, and the carry out, sign, and zero flags.
import pandas as pd
from random import randint


def makeTestVector(opA :int, opB: int, opSel:int) -> str:
    vector = hex(opA)[2:].zfill(8) +"_"+ hex(opB)[2:].zfill(8)+"_" + hex(opSel)[2:]
    return vector

def makeResultVector(opA :int, opB: int, opSel:int) -> str:
    result = 0
    carryOut = 0
    sign = 0
    zero = 0

    if opSel == 0:
        result = ~opA
    elif opSel == 1:
        result = opA & opB
    elif opSel == 2:
        result = opA | opB
    elif opSel == 3:
        result = opA ^ opB
    elif opSel == 4:
        result = ~(opA ^ opB)
    elif opSel == 5:
        result = ~(opA | opB)
    elif opSel == 6:
        result = ~(opA & opB)
    elif opSel == 7:
        result = opA
        #result = opA << 1
        #carryOut = opA >> 31
    elif opSel == 8:
        result = opA
        #result = opA >> 1
        #carryOut = opA & 1
    elif opSel == 9:
        result = opA + opB
        carryOut = (opA + opB) >> 32
    elif opSel == 10:
        result = opA - opB
        carryOut = (opA - opB) >> 32
    elif opSel == 11:
        result = opA
        #result = opA * opB
        #carryOut = (opA * opB) >> 32
    elif opSel == 12:
        result = opA
        #result = opA // opB
        #carryOut = (opA // opB) >> 32
    elif opSel == 13:
        result = opA
    elif opSel == 14:
        result = opB

    
    zero = result == 0
    result &= 0xFFFFFFFF
    carryOut &= 1
    sign = (result >> 31) & 1

    vector = hex(result)[2:].zfill(8) +"_"+ hex(carryOut)[2:]+"_" + str(sign) +"_" + hex(zero)[2:]
    return vector


def main():
    testVector: str = ""
    resultVector: str = ""
    opA = 0
    opB = 0
    opSel = 0
    for i in range(0,32):
        for j in range(32,64):
            for k in range(0,15):
                opA = randint(0,0xFFFFFFFF)
                opB = randint(0,0xFFFFFFFF)
                opSel = k
                testVector+=(makeTestVector(opA,opB,opSel) + "\n");
                resultVector+=(makeResultVector(opA,opB,opSel) + "\n");
    
    # Now, write the vectors into thier files:
    testVectorFile = open("testVector.txt","w")
    testVectorFile.write(testVector)
    testVectorFile.close()


    resultVectorFile = open("resultVectorPY.txt","w")
    resultVectorFile.write(resultVector)
    resultVectorFile.close()


if __name__ == "__main__":
    main()
