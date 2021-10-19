// Omar Tarek Amer
// 8 - 17 - 2021
// Top Module

//TODO: ADD ROM RESET :)

module top (
    input [31:0] inp,
    input clk, rst,
    inout [7:0] port,
    output [31:0] regA,
    output [31:0] regB,
    inout [31:0] databus1
);

    // Wires and regs
    wire invClk;
    assign invClk = ~clk;


    wire [9:0] instAddr;
    wire [40:0] ctrlUnitInstIn;
    wire [2:0] waddr, raddr1, raddr2;
    wire [3:0] aluOpSel;
    wire rw, sto;
    wire [31:0] imm;
    wire [31:0] db1, db2;
    wire [31:0] aluRes;
    reg  [31:0] aluOp1, aluOp2;
    wire [1:0]  aluSrcSel1, aluSrcSel2;
    wire [31:0] memOut;
    wire carry, sign, zero;
    wire [2:0] flagsOut;
    wire memAddrSel, stk, ramWen, ld, resAddr;
    wire [10:0] memAddr;
    reg [31:0] ldMuxOut;
    wire [31:0] ramData;
    reg [10:0] memMuxAddrOut;
    wire [10:0] stkTop;
    wire pushPop;

    // Modules

    ctr ProgCtr (.clk(clk),
                 .rst(rst),
                 .en(1'b1),
                 .dir(1'b1),
                 .ctrOut(instAddr));

    
    ctr #(.width (11)) stkCtr (.clk(clk),
                               .rst(rst),
                               .en(stk),
                               .dir(pushPop),
                               .ctrOut(stkTop));

    irom instRom (.addr(instAddr),
                  .rst(rst),
                  .data(ctrlUnitInstIn));

    ctrl ctrl (.inst(ctrlUnitInstIn),
                   .rst(rst), 
                   .clk(clk),
                   .waddr(waddr),
                   .raddr1(raddr1),
                   .raddr2(raddr2),
                   //.rw(rw),
                   .aluOpSel(aluOpSel),
                   .aluOp1(aluSrcSel1),
                   .aluOp2(aluSrcSel2),
                   .imm(imm),
                   .sto(sto),
                   .memAddrSel(memAddrSel),
                   .memAddr(memAddr),
                   .stk(stk),
                   .ramWen(ramWen),
                   .resAddr(resAddr),
                   .ld(ld),
                   .pushPop(pushPop));

    regFile regFile (.waddr(waddr),
                    .raddr1(raddr1),
                    .raddr2(raddr2),
                    .clk(invClk),
                    .rst(rst),
                    .sto(sto),
                    .databus1(db1),
                    .databus2(db2),
                    .dataIn(ldMuxOut),
                    .regA(regA),
                    .regB(regB));

    ALU ALU (.a(aluOp1),
             .b(aluOp2),
             .opSel(aluOpSel),
             .carryFlag(carry),
             .signFlag(sign),
             .zeroFlag(zero),
             .result(aluRes));


    regGen #(3) flags (.d({carry, sign, zero}),
                       .rst(rst),
                       .clk(clk),
                       .wen(1'b1),
                       .q(flagsOut));

    ram ram (.dataIn(aluRes),
             .addr(memMuxAddrOut),
             .wen(ramWen),
             .clk(clk),
             .rst(rst),
             .data(ramData),
             .port(port));

    assign databus1 = db1;

    // MUX

    always @(*) begin
        // ALU OP MUX
        case (aluSrcSel1)
            2'b00: aluOp1 = db1;
            2'b01: aluOp1 = memOut;
            2'b10: aluOp1 = 32'bz;
            2'b11: aluOp1 = 32'b1;
        endcase

        case (aluSrcSel2)
            2'b00: aluOp2 = db2;
            2'b01: aluOp2 = memOut;
            2'b10: aluOp2 = imm;
            2'b11: aluOp2 = 1;
        endcase

        // LOAD MUX
        case (ld)
            0: ldMuxOut = aluRes; 
            1: ldMuxOut = ramData;
            default: ldMuxOut = aluRes;
        endcase

        // MEM MUX
        case (memAddrSel)
            1'b0: memMuxAddrOut = memAddr;
            1'b1: memMuxAddrOut = stkTop; 
            default: memMuxAddrOut = memAddr;
        endcase

    end

endmodule