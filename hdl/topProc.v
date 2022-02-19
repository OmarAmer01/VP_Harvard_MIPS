// Omar Tarek Amer
// Top Module



module top (
    input extClk, rst,
    output [7:0] port
);

    // Wires and regs
    wire invClk;
    wire clk;
    wire hlt;
    wire [9:0] instAddr;
    wire [40:0] ctrlUnitInstIn;
    wire [2:0] waddr, raddr1, raddr2;
    wire [3:0] aluOpSel;
    wire sto;
    wire [31:0] imm;
    wire [31:0] db1, db2;
    wire [31:0] aluRes;
    reg  [31:0] aluOp2;
    wire aluSrcSel2;
    wire carry, sign, zero;
    wire [2:0] flagsOut;
    wire memAddrSel, stk, ramWen, ld, resAddr;
    wire [10:0] memAddr;
    reg [31:0] ldMuxOut;
    wire [31:0] ramData;
    reg [10:0] memMuxAddrOut;
    wire [10:0] stkTop;
    wire pushPop;
    wire jmp;
    wire progCtrjmp;
    reg [31:0] progCtrMuxOut;
    wire [3:0] jmpType;
    wire [9:0] jmpLoc;
    wire [31:0]resultExt;
    wire ctrlUnitMul;
    wire clkEn;

    // Modules
    ctr ProgCtr (.clk(clk),
                 .rst(rst),
                 .en(1'b1),
                 .dir(1'b1),
                 .ctrOut(instAddr),
                 .jmp(progCtrjmp),
                 .jmpLoc(aluRes[9:0]));

    
    ctr #(.width (11)) stkCtr (.clk(~clk),
                               .rst(rst),
                               .en(stk),
                               .dir(pushPop),
                               .ctrOut(stkTop),
                               .jmp(1'b0),
                               .jmpLoc(11'h00));

    irom instRom (.addr(instAddr),
                  .data(ctrlUnitInstIn));

    ctrl ctrl (.inst(ctrlUnitInstIn),
                   .rst(rst), 
                   .waddr(waddr),
                   .raddr1(raddr1),
                   .raddr2(raddr2),
                   .aluOpSel(aluOpSel),
                   .aluOp2(aluSrcSel2),
                   .imm(imm),
                   .sto(sto),
                   .memAddrSel(memAddrSel),
                   .memAddr(memAddr),
                   .stk(stk),
                   .ramWen(ramWen),
                   .resAddr(resAddr),
                   .ld(ld),
                   .pushPop(pushPop),
                   .jmp(jmp),
                   .jmpType(jmpType),
                   .mul(ctrlUnitMul),
                   .hlt(hlt));

    regFile regFile (.waddr(waddr),
                    .raddr1(raddr1),
                    .raddr2(raddr2),
                    .clk(invClk),
                    .rst(rst),
                    .sto(sto),
                    .databus1(db1),
                    .databus2(db2),
                    .dataIn(ldMuxOut),
                    .mul(ctrlUnitMul),
                    .dataInExt(resultExt),
                    .port(port));

    ALU ALU (.a(db1),
             .b(aluOp2),
             .opSel(aluOpSel),
             .carryFlag(carry),
             .signFlag(sign),
             .zeroFlag(zero),
             .result(aluRes),
             .resultExt(resultExt));



    jmpCtrl jmpCtrl (.carry(carry),
                     .sign(sign),
                     .zero(zero),
                     .op(jmpType),
                     .jmpWake(jmp),
                     .jmp(progCtrjmp));

    ram ram (.dataIn(aluRes),
             .addr(memMuxAddrOut),
             .wen(ramWen),
             .clk(clk),
             .rst(rst),
             .data(ramData)
             );



    assign clk = ~hlt && extClk;
    assign invClk = ~clk;

    // MUXes
    always @(*) begin
        // ALU OP MUX
        case (aluSrcSel2)
            1'b0: aluOp2 = db2;
            1'b1: aluOp2 = imm;
            default: aluOp2 = db2;
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