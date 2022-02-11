# Omar Tarek Amer
# Chasm - Macro assembler for the VP

from typing import TextIO
import typing


class instruction():

    mnemonic: str = None
    op1: str = None
    op2: str = None
    valid: bool = True  # Assume all instructions are already valid
    type: int = None  # Could be NOP, one op, or two op.
    # The number here shows the number of operands in the instruction.
    op2Imm: int = None

    def __init__(self, mnemonic, op1=None, op2=None, valid=True) -> None:
        self.mnemonic = mnemonic
        self.op1 = op1
        self.op2 = op2
        self.valid = valid

    def __str__(self) -> str:
        string = f"mnemonic: {self.mnemonic}\n" + \
            f"OP1: {self.op1}\n" + f"OP2: {self.op2}\n" + \
            f"Valid: {self.valid}\n"
        return string


class validator():
    opCodesOneOp = ["NOT", "INC", "DEC", "IN", "OUT", "PUSH", "POP", "SRL", "SLL"]

    opCodesTwoOp = ["MOV", "CMP", "AND", "OR", "XOR",
                    "XNOR", "NOR", "NAND", "ADD", "SUB", "MUL", "DIV"]

    opCodesJMP = ["JMP", "JZ", "JNZ", "JEQ", "JNEQ", "JG", "JL", "JGE", "JLE"]

    opCodesTwoOpImm = ["MOVI", "CMPI", "ANDI", "ORI", "XORI",
                       "XNORI", "NORI", "NANDI", "ADDI", "SUBI", "MULI", "DIVI", "ST", "LD"]

    registers = ["AX", "BX", "CX", "DX", "SX", "EX", "EY", "EZ"]

    labelDict = {}

    def __init__(self, labelDict) -> None:
        self.labelDict = labelDict

    def isBase(self, string: str, base: int) -> bool:
        try:
            int(string, base)
            return True
        except ValueError:
            return False

    def printError(self, lineNo: int, msg: str = None, errorTerm: str = None):
        global instList
        print(f"Error ({lineNo+1}): {msg}: {errorTerm}")

    def validate(self, inst: instruction, lineNo: int) -> bool:
        if inst.mnemonic.upper() in self.opCodesOneOp:
            # It's a one operand instruction (yay)
            # Rules state that the first operand must be a register
            inst.type = 1
            if inst.op2 != None:
                self.printError(
                    lineNo, "Unexpected second operand for one operand command "+inst.mnemonic, inst.op2)
                inst.valid = False
                return False

            elif inst.op1 == None:
                self.printError(
                    lineNo, "Missing required operand for one operand command", "REGISTER")
                inst.valid = False
                return False

            elif inst.op1.upper() not in self.registers:
                self.printError(
                    lineNo, "Unexpected first operand for one operand command", inst.op1)
                inst.valid = False
                return False
        elif inst.mnemonic.upper() in self.opCodesTwoOpImm:
            inst.type = -2
            basePrefix = inst.op2[0:2].lower()
            if inst.op1.upper() not in self.registers:
                self.printError(
                    lineNo, "Unexpected first operand for two operand command", inst.op1)
                return False

            elif basePrefix != "0d" and basePrefix != "0x" and basePrefix != "0b":
                self.printError(lineNo, "Missing base prefix in second operand",
                                "['0b' for binary, '0d' for decimal, and '0x' for hexadecimal]")
                return False

            elif basePrefix == "0b" and not self.isBase(inst.op2[2:], 2):
                self.printError(lineNo, "Invalid binary number", inst.op2)
                return False

            elif basePrefix == "0d" and not inst.op2[2:].isnumeric():
                self.printError(lineNo, "Invalid decimal number", inst.op2)
                return False

            elif basePrefix == "0x" and not self.isBase(inst.op2[2:], 16):
                self.printError(lineNo, "Invalid hexadecimal number", inst.op2)
                return False

            if inst.mnemonic.upper() == "ST" or inst.mnemonic.upper() == "LD":
                if basePrefix == "0b" and int(inst.op2[2:], 2) > 0x7FF:
                    self.printError("Invalid address", inst.op2)
                    return False
                elif basePrefix == "0d" and int(inst.op2[2:], 10) > 0x7FF:
                    self.printError("Invalid address", inst.op2)
                    return False
                elif basePrefix == "0x" and int(inst.op2[2:], 16) > 0x7FF:
                    self.printError("Invalid address", inst.op2)
                    return False
            else:
                if basePrefix == "0b" and int(inst.op2[2:], 2) > 0xFFFFFFFF:
                    self.printError("Number larger than 32-bits", inst.op2)
                    return False
                elif basePrefix == "0d" and int(inst.op2[2:], 10) > 0xFFFFFFFF:
                    self.printError("Number larger than 32-bits", inst.op2)
                    return False
                elif basePrefix == "0x" and int(inst.op2[2:], 16) > 0xFFFFFFFF:
                    self.printError("Number larger than 32-bits", inst.op2)
                    return False

            if basePrefix == "0b":
                inst.op2Imm = int(inst.op2[2:], 2)
            elif basePrefix == "0d":
                inst.op2Imm = int(inst.op2[2:], 10)
            elif basePrefix == "0x":
                inst.op2Imm = int(inst.op2[2:], 16)

        elif inst.mnemonic.upper() in self.opCodesTwoOp:
            inst.type = 2
            if inst.op1.upper() not in self.registers:
                self.printError(
                    lineNo, "Unexpected first operand for two operand command", inst.op1)
                return False

            if inst.op2.upper() not in self.registers:
                self.printError(
                    lineNo, "Unexpected second operand for two operand command", inst.op2)
                return False

        elif inst.mnemonic.upper() in self.opCodesJMP:
            inst.type = 'j'

            if inst.op2 is not None:
                self.printError(
                    lineNo, "Unexpected second operand for two operand command", inst.op2)
                return False

            if inst.op1.startswith("@"):
                # It's a label.
                # Its lineNo should point to the next instruction line number.
                if  inst.op1[1:] not in self.labelDict:
                    self.printError(lineNo, "Undefined Label", inst.op1[1:])
                    return False
                # Get line number of the next instruction

                inst.op2Imm = self.labelDict[inst.op1[1:]]
                return True


            basePrefix = inst.op1[0:2].lower()

            if basePrefix != "0d" and basePrefix != "0x" and basePrefix != "0b":
                self.printError(lineNo, "Missing base prefix in second operand",
                                "['0b' for binary, '0d' for decimal, and '0x' for hexadecimal]")
                return False

            elif basePrefix == "0b" and not self.isBase(inst.op1[2:], 2):
                self.printError(lineNo, "Invalid binary number", inst.op2)
                return False

            elif basePrefix == "0d" and not inst.op1[2:].isnumeric():
                self.printError(lineNo, "Invalid decimal number", inst.op2)
                return False

            elif basePrefix == "0x" and not self.isBase(inst.op1[2:], 16):
                self.printError(lineNo, "Invalid hexadecimal number", inst.op2)
                return False

            if basePrefix == "0b" and int(inst.op1[2:], 2) > 1024:
                self.printError("Invalid jump address", inst.op2)
                return False
            elif basePrefix == "0d" and int(inst.op1[2:], 10) > 1024:
                self.printError("Invalid jump address", inst.op2)
                return False
            elif basePrefix == "0x" and int(inst.op1[2:], 16) > 1024:
                self.printError("Invalid jump address", inst.op2)
                return False
            else:
                if basePrefix == "0b" and int(inst.op1[2:], 2) > 0xFFFFFFFF:
                    self.printError("Number larger than 32-bits", inst.op2)
                    return False
                elif basePrefix == "0d" and int(inst.op1[2:], 10) > 0xFFFFFFFF:
                    self.printError("Number larger than 32-bits", inst.op2)
                    return False
                elif basePrefix == "0x" and int(inst.op1[2:], 16) > 0xFFFFFFFF:
                    self.printError("Number larger than 32-bits", inst.op2)
                    return False

            if basePrefix == "0b":
                inst.op2Imm = int(inst.op1[2:], 2)
            elif basePrefix == "0d":
                inst.op2Imm = int(inst.op1[2:], 10)
            elif basePrefix == "0x":
                inst.op2Imm = int(inst.op1[2:], 16)

        elif inst.mnemonic.upper() == "NOP" and inst.op1 == None and inst.op2 == None:
            inst.type = 0
            return True

        
        elif inst.mnemonic.upper() == "HLT" and inst.op1 == None and inst.op2 == None:
            inst.type = 0
            return True

        else:
            # Undefined instruction
            # Should be preceeded by a bunch of elif statments for the rest of instruction types
            self.printError(
                lineNo, "Undefined command or macro", inst.mnemonic)
            inst.valid = False
            return False

        return True


class program():
    instList = []  # Each line is an instruction as written by the user.
    binInstList = []  # Each line is an instruction in binary
    labelDict = {} # This keeps track of labels and thier line numbers to be replaced with jump operations
                   # in preprocessing.
    postProcessed = []
    hasError: bool = False
    file: typing.TextIO = None
    post: typing.TextIO = None

    def __init__(self, file: typing.TextIO) -> None:
        self.file = file

    def preProcess(self):
        instructions: list = self.file.readlines()
        self.post = open(".post.tmp","+w")
        lineNo = 0
        for lineNo, inst in enumerate(instructions):
            inst = inst.strip()
            if inst == '\n' or inst.startswith(";") or inst == "":
                continue  # Skip new lines and comments
            elif inst.startswith("@"):
                # Then it's a label
                # points to the address of the next instruction
                for idx, instLabel in enumerate(instructions[lineNo+1:]):
                    instLabel = instLabel.strip()
                    if instLabel == '\n' or instLabel.startswith(";") or instLabel == "" or instLabel.startswith("@"):
                        continue  # Skip new lines, comments, and labels.
                    else:
                        self.labelDict[inst[1:]] = len(self.postProcessed)
                        lineNo = lineNo + 1
                        break
               
                continue # Dont add the label to the list of the to-be parsed instructions.
               
            else:
                # Put the processed file in .post
                lineNo = lineNo + 1
                #self.post.write(inst + "\n")
                self.postProcessed.append(inst + "\n")

        self.post.seek(0)
        return self.labelDict

    def lex(self):
        
        instructions: list = self.postProcessed
        for lineNo, inst in enumerate(instructions):
            inst = inst.strip()
            mnemonic = inst.split()[0].lstrip()
            if mnemonic.upper() == "NOP":
                self.instList.append(instruction(
                mnemonic=mnemonic, op1=None, op2=None))
                continue
            try:
                op1 = inst.split(" ")[1].strip().split(",")[0].strip()
            except:
                op1 = None
            try:
                op2 = inst.split(",")[1].strip().strip(
                    ",").split(";")[0].strip()
            except:
                op2 = None

            self.instList.append(instruction(
                mnemonic=mnemonic, op1=op1, op2=op2))

    def syntaxCheck(self):
        syntaxChecker = validator(self.labelDict)
        for lineNo, inst in enumerate(self.instList):
            valid = syntaxChecker.validate(inst, lineNo)
            if not valid:
                self.hasError = True

    def assemble(self):
        instLookUp = {"NOT": 0b000001, "INC": 0b000010, "DEC": 0b000011, "NOP": 0b000000,
                      "IN": 0b000100, "OUT": 0b000101, "PUSH": 0b000110, "POP": 0b000111, "ST": 0b110001, "LD": 0b110000, "MOV": 0b001000, "CMP": 0b001010, "AND": 0b001011, "OR": 0b001100, "XOR": 0b001101,
                      "XNOR": 0b001110, "NOR": 0b001111, "NAND": 0b010000, "ADD": 0b010001, "SUB": 0b010010, "MUL": 0b010011, "DIV": 0b010100, "HLT":0b111111, "SLL": 0b011101, "SRL": 0b011110}

        instImmLookUp = {"MOVI": 0b010101, "CMPI": 0b010110, "ANDI": 0b010111, "ORI": 0b011000, "XORI": 0b011001,
                         "XNORI": 0b011010, "NORI": 0b011011, "NANDI": 0b011100, "ADDI": 0b011111, "SUBI": 0b100000, "MULI": 0b100001, "DIVI": 100010}

        instJmpLookUp = {"JMP":0b100101, "JZ":0b100110, "JNZ":0b100111, "JEQ":0b101000, "JNEQ":0b101001, "JG":0b101010, "JL":0b101011, "JGE":0b101100, "JLE":0b101101}

        regLookUp = {"AX": 0, "BX": 1, "CX": 2,
                     "DX": 3, "SX": 4, "EX": 5, "EY": 6, "EZ": 7}

        for inst in self.instList:
            try:
                binMnemonic = bin(instLookUp[inst.mnemonic.upper()])[
                    2:].zfill(6)
            except:
                try:
                    binMnemonic = bin(instImmLookUp[inst.mnemonic.upper()])[
                        2:].zfill(6)
                except:
                    binMnemonic = bin(instJmpLookUp[inst.mnemonic.upper()])[
                        2:].zfill(6)

            binOp1 = None
            if inst.type == 0:
                if inst.mnemonic.upper() == "NOP":
                    self.binInstList.append(41*'0')
                else:
                    self.binInstList.append("111111"+35*'0')

            elif inst.type == 1:
                binOp1 = bin(regLookUp[inst.op1.upper()])[2:].zfill(3)
                # Assembly of this instruction finished.
                # now add to binary instruction list.
                self.binInstList.append((binMnemonic+binOp1).ljust(41, '0'))
            elif inst.type == -2:

                binOp1 = bin(regLookUp[inst.op1.upper()])[2:].zfill(3)

                if inst.mnemonic.upper() == "ST" or inst.mnemonic.upper() == "LD":
                    binOp2 = bin(inst.op2Imm)[2:].zfill(11)
                    # print(binMnemonic, binOp1, binOp2)
                    self.binInstList.append(
                        (binMnemonic+binOp1+binOp2).ljust(41, '0'))
                else:
                    binOp2 = bin(inst.op2Imm)[2:].zfill(32)
                    self.binInstList.append(
                        (binMnemonic+binOp1+binOp2).ljust(41, '0'))
            elif inst.type == 2:
                binOp1 = bin(regLookUp[inst.op1.upper()])[2:].zfill(3)
                binOp2 = bin(regLookUp[inst.op2.upper()])[2:].zfill(3)
                self.binInstList.append(
                    (binMnemonic+binOp1+binOp2).ljust(41, '0'))

            elif inst.type == 'j':
                binOp1 = bin(inst.op2Imm)[2:].zfill(10)
               
                self.binInstList.append(
                    (binMnemonic+binOp1).ljust(41, '0'))
                

        for i in range(len(self.instList), 1025):
            self.binInstList.append("0" * 41)

    def modelsimMemExport(self, fName):
        #outFile = open('G:/VP/simulation/not.mem', 'w+')
        outFile = open(f"G:\VP\simulation\{fName}.mem", "+w")
        outFile.write("// memory data file (do not edit the following line - required for mem load use)\n// instance=/top/instRom/rom\n// format=mti addressradix=h dataradix=s version=1.0 wordsperline=1\n")
        top: int = 0x3FF
        numOfinsts = len(self.binInstList)
        for lineNo in reversed(range(top+1)):
            outFile.write(f"{hex(lineNo)[2:]}: "+self.binInstList[lineNo]+"\n")
            pass
        outFile.close()


def printFile(file):
    lines = file.readlines()
    for line in lines:
        print(line)

def main():

    IN_FILENAME = 'goodisa'

    file = open('G:/VP/chasm/goodisa.asm')


    prog = program(file)
    labels = prog.preProcess()

    prog.lex()
    prog.syntaxCheck()
    prog.assemble()
    prog.modelsimMemExport(IN_FILENAME)


if __name__ == "__main__":
    main()
    
