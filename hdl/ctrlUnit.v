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

    //output reg rw,

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
    output reg pushPop
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
// |
// |
//  ---> ONE OPERAND
`define NOP  6'b000000
`define NOT  6'b000001
`define INC  6'b000010
`define DEC  6'b000011
`define IN   6'b000100
`define OUT  6'b000101


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

// LOGIC
always @(posedge clk, posedge rst) begin
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

    `NOT: begin
        $display("NOT | SRC/DST: REG ", `OP1);
        waddr = `OP1;
        raddr1 = `OP1;
        raddr2 = 0;
        aluOpSel = `aluNOT;
        aluOp1 = 0;
        aluOp2 = 0;
        imm = 0;
        sto = 1'b1 ;
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
        sto = 0;
        memAddrSel = 1'b1 ;
        memAddr = 11'b0;
        stk = 1'b0;
        ramWen = 1'b0;
        resAddr = 0;
        ld = 1'b0;
        pushPop = 0;
    end 

    `MOVI: begin
        $display("MOVING IMM", `immFromInst, " TO REG ", `OP1);
        waddr = `OP1;
        raddr1 =0;
        raddr2 = 0;
        aluOpSel = `aluPASSB;
        aluOp1 = 0;
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
        $display("ORING IMM ", `immFromInst, " TO REG ", `OP1);
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

    `XORI: begin
        $display("XORING IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("XNORING IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("XORING IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("NANDING IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("ADDING IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("SUBBING IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("MULTIPLYING SRC:", `OP2, " | DST: ", `OP1);
        waddr = `OP1;
        raddr1 =`OP1;
        raddr2 = `OP2;
        aluOpSel = `aluMUL;
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

    `MULI: begin
        $display("MULLING IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("DIV IMM ", `immFromInst, " TO REG ", `OP1);
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
        $display("ANDING IMM ", `immFromInst, " TO REG ", `OP1);
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

