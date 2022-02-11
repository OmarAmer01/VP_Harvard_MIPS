// Omar Tarek Amer
// 8 - 25 - 2021
// Control Unit

module ctrl (
    input rst,
    input clk,
    input  [40:0] inst,
    output reg [2:0] waddr,
    output reg [2:0] raddr1,
    output reg [2:0] raddr2,
    output reg [3:0]  aluOpSel,
    output reg [1:0]  aluOp1,
    output reg [1:0]  aluOp2,
    output reg [31:0] imm,
    output reg memAddrSel,
    output reg [10:0] memAddr,
    output reg stk,
    output reg ramWen,
    output reg resAddr,
    output reg ld,
    output reg sto,
    output reg pushPop,
    output reg jmp,
    output reg [3:0] jmpType,
    output reg hlt,
    output reg mul
    );


// ALU Operations:
`define aluNOT    0
`define aluAND    1
`define aluOR     2
`define aluXOR    3
`define aluXNOR   4
`define aluNOR    5
`define aluNAND   6
`define aluSLL    7
`define aluSRL    8
`define aluADD    9
`define aluSUB   10
`define aluMUL   11
`define aluDIV   12
`define aluPASS  13
`define aluPASSB 14

// ALU Operands
`define DB  2'b00
`define RAM 2'b01
`define IMM 2'b10
`define ONE 2'b11

// DEFINETIONS

`define READ 0
`define WRITE 1

`define OPCODE      inst[40:35]
`define OP1         inst[34:32]
`define OP2         inst[31:29]
`define immFromInst inst[31:0]

// Opcodes

`define NOP  6'b000000
`define NOT  6'b000001
`define INC  6'b000010
`define DEC  6'b000011
`define IN   6'b000100
`define OUT  6'b000101
`define SLL  6'b011101
`define SRL  6'b011110


`define PUSH 6'b000110
`define POP  6'b000111


`define MOV   6'b001000
`define CMP   6'b001010
`define AND   6'b001011
`define OR    6'b001100
`define XOR   6'b001101
`define XNOR  6'b001110
`define NOR   6'b001111
`define NAND  6'b010000
`define ADD   6'b010001
`define SUB   6'b010010
`define MUL   6'b010011
`define DIV   6'b010100

`define MOVI  6'b010101
`define ORI   6'b011000
`define XORI  6'b011001
`define XNORI 6'b011010
`define NORI  6'b011011
`define NANDI 6'b011100
`define ADDI  6'b011111
`define SUBI  6'b100000
`define MULI  6'b100001
`define DIVI  6'b100010
`define ANDI  6'b010111


`define LD   6'b110000
`define ST   6'b110001

`define JMP  6'b100101
`define JZ   6'b100110
`define JNZ  6'b100111
`define JEQ  6'b101000
`define JNEQ 6'b101001
`define JG   6'b101010
`define JL   6'b101011
`define JGE  6'b101100
`define JLE  6'b101101


`define ZERO          0
`define NOTZERO       1
`define EQUAL         2
`define NOTEQUAL      3
`define GREATER       4
`define LESS          5
`define GREATEQUAL    6
`define LESSEQUAL     7
`define CARRY         8
`define NOTCARRY      9
`define UNCONDITIONAL 10

`define HLT 6'b111111

// LOGIC
always @(*) begin
        waddr = 0;
        raddr1 = 0;
        raddr2 = 0;
        aluOpSel = 0;
        aluOp1 = 0;
        aluOp2 = 0;
        imm = 0;
        sto = 0 ;
        memAddrSel = 0;
        memAddr = 11'b0;
        stk = 0;
        ramWen = 1;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
        jmp = 0;
        jmpType = `UNCONDITIONAL;
        hlt = 0;
        mul = 0;
    if(rst) begin
        $display("RESETTING CTRL UNIT");
        waddr = 0;
        raddr1 = 0;
        raddr2 = 0;
        aluOpSel = 0;
        aluOp1 = 0;
        aluOp2 = 0;
        imm = 0;
        sto = 0 ;
        memAddrSel = 0;
        memAddr = 11'b0;
        stk = 0;
        ramWen = 0;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
    end
    case (`OPCODE)
    `NOP: begin
        $display("NOP");
    end

    `HLT: begin
        $display("EXECUTION HALTED.");
        hlt = 1'b1;
    end

    `NOT: begin
        $display("NOT | SRC/DST: REG ", `OP1);
        waddr = `OP1;
        raddr1 = `OP1;
        aluOpSel = `aluNOT;
        aluOp1 = `DB;
        sto = 1'b1;
        memAddrSel = 0;
        memAddr = 11'b0;
        stk = 0;
        ramWen = 0;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
    end  

    `ST: begin
        $display("STORE REG ", `OP1, " AT RAM ADDRESS %h", inst[31:21]);
        waddr <= 0;
        raddr1 <= `OP1;
        raddr2 <= 0;
        aluOpSel <= `aluPASS;
        aluOp1 <= `DB;
        aluOp2 <= 0;
        imm <= 0;
        sto <= 0 ;
        memAddrSel <= 0;
        memAddr <= inst[31:21];
        stk <= 0;
        ramWen <= 1'b1;
        resAddr <= 0;
        ld <= 0;
        pushPop <= 0;
    end  

    `LD: begin
        $display("LOADING REG ", `OP1, " FROM RAM ADDRESS %h", inst[31:21]);
        waddr = `OP1;
        raddr1 = 0;
        raddr2 = 0;
        aluOpSel = `aluPASS;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1;
        memAddrSel = 0;
        memAddr = inst[31:21];
        stk = 0;
        ramWen = 1'b1;
        resAddr = 0;
        ld = 1;
        pushPop = 0;
    end 

    `INC: begin
        $display("INCREMENTING REG ", `OP1);
        waddr = `OP1;
        raddr1 = `OP1;
        raddr2 = 0;
        aluOpSel = `aluADD;
        aluOp1 = 0;
        aluOp2 = 2'b11;
        imm = 0;
        sto = 1'b1 ;
        memAddrSel = 0;
        memAddr = 11'b0;
        stk = 0;
        ramWen =1'b0;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
    end  

    `DEC: begin
        $display("DECREMENTING REG ", `OP1);
        waddr = `OP1;
        raddr1 = `OP1;
        raddr2 = 0;
        aluOpSel = `aluSUB;
        aluOp1 = 0;
        aluOp2 = `ONE;
        imm = 0;
        sto = 1'b1 ;
        memAddrSel = 0;
        memAddr = 0;
        stk = 0;
        ramWen =1'b0;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
    end  

    `OUT: begin
        $display("OUTPUT LOWER 8-BITS OF REG ", `OP1);
        waddr = 0;
        raddr1 = `OP1;
        raddr2 = 0;
        aluOpSel = `aluPASS;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 0 ;
        memAddrSel = 0;
        memAddr = 1;
        stk = 0;
        ramWen = 1'b1;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
    end

    `PUSH: begin
        $display("PUSHING REG ", `OP1);
        waddr = 0;
        raddr1 = `OP1;
        raddr2 = 0;
        aluOpSel = `aluPASS;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 0 ;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b1;
        ramWen = 1'b1;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
    end    

    `POP: begin
        $display("POPPING INTO REG ", `OP1);
        stk = 1;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1;
        pushPop = 1;
        waddr = `OP1;
        raddr1 = 0;
        raddr2 = 0;
        aluOpSel = `aluPASS;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1;
        memAddrSel = 1;
        memAddr = inst[31:21];
    end 

    `MOV: begin
        $display("MOVING FROM", `OP2, " TO ", `OP1);
        waddr = `OP1;
        raddr1 =`OP2;
        raddr2 = 0;
        aluOpSel = `aluPASS;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `MOVI: begin
        $display("MOVING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `OR: begin
        $display("ORING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluOR;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `ORI: begin
        $display("ORING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluOR;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `XOR: begin
        $display("XORING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluXOR;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 


    `XNOR: begin
        $display("XNORING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluXNOR;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 



    `XNORI: begin
        $display("XNORING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluXNOR;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 


    `NOR: begin
        $display("NORING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluNOR;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `XORI: begin
        $display("XORING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluXOR;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `NANDI: begin
        $display("NANDING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluNAND;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `NAND: begin
        $display("NANDING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluNAND;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `ADD: begin
        $display("ADDING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluADD;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `ADDI: begin
        $display("ADDING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluADD;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `SUB: begin
        $display("SUBBING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluSUB;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `SUBI: begin
        $display("SUBBING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluSUB;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `MUL: begin
        $display("MULTIPLYING REG:", `OP2, " | REG: ", `OP1," => RESULT IN DX:AX");
        mul = 1;
        waddr = 3'b000; // AX
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluMUL;
        aluOp1 = `DB;
        aluOp2 = `DB;
        imm = 0;
        sto = 1'b1;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `MULI: begin
        $display("MULLING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluMUL;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `DIV: begin
        $display("DIV SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluDIV;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `DIVI: begin
        $display("DIV IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluDIV;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `AND: begin
        $display("ANDING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluAND;
        aluOp1 = `DB;
        aluOp2 = 0;
        imm = 0;
        sto = 0;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `ANDI: begin
        $display("ANDING IMM %h ", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluAND;
        aluOp1 = `DB;
        aluOp2 = `IMM;
        imm = `immFromInst;
        sto = 1;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `JMP: begin
        $display("Jumping to instruction NO#. %h ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `UNCONDITIONAL;
    end

    `JZ: begin
        $display("Jumping to instruction NO#. %h [ZERO] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `ZERO;
        end

    `JNZ: begin
        $display("Jumping to instruction NO#. %h [NOT ZERO] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `NOTZERO;
    end

    `JEQ: begin
        $display("Jumping to instruction NO#. %h [EQUAL] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `EQUAL;
    end

    `JNEQ: begin
        $display("Jumping to instruction NO#. %h [NOT EQUAL] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `NOTEQUAL;
    end

    `JG: begin
        $display("Jumping to instruction NO#. %h [GREATER] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `GREATER;
    end


    `JL: begin
        $display("Jumping to instruction NO#. %h [LESS] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `LESS;
    end


    `JGE: begin
        $display("Jumping to instruction NO#. %h [GREAT EQUAL] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `GREATEQUAL;
    end

    `JLE: begin
        $display("Jumping to instruction NO#. %h [LESS EQUAL] ", inst[34:25] );
        waddr = 0;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
        aluOp2 = `IMM;
        imm = inst[34:25];
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b1;
        jmpType = `LESSEQUAL;
    end

    `CMP: begin
        $display("Comparing REG %h with REG %h", `OP1, `OP2 );
        waddr = 0;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluSUB;
        aluOp1 <= `DB;
        aluOp2 <= `DB;
        imm = 0;
        sto = 0;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b0;
    end

    `SLL: begin
        $display("LEFT SHIFT REG %d", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluSLL;
        aluOp1 <= `DB;
        aluOp2 <= 0;
        imm = 0;
        sto = 1;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b0;
    end
    `SRL: begin
        $display("RIGHT SHIFT REG %d", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = 0;
        aluOpSel = `aluSRL;
        aluOp1 <= `DB;
        aluOp2 <= 0;
        imm = 0;
        sto = 1;
        memAddrSel = 1'b0 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
        jmp = 1'b0;
    end      

    default: begin
        $display("CASE NOT FOUND, EXECUTING NOP | FOUND %b INSTEAD.", `OPCODE);
        waddr = 0;
        raddr1 = 0;
        raddr2 = 0;
        //rw = `READ;
        aluOpSel = 0;
        aluOp1 = 0;
        aluOp2 = 0;
        imm = 0;
        sto = 0 ;
        memAddrSel = 0;
        memAddr = 11'b0;
        stk = 0;
        ramWen = 1;
        resAddr = 0;
        ld = 0;
        pushPop = 0;
    end
endcase
end

    
endmodule

