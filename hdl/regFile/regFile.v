// Omar Amer
// 8 X 32 Register File

module regFile (
    output [31:0] databus1,
    output [31:0] databus2,
    output [31:0] regA,
    output [31:0] regB,

    input [2:0]  waddr,
    input [2:0]  raddr1,
    input [2:0]  raddr2,
    input        clk,
    input        rst,
    input        sto,
    
    input [31:0] dataIn
);
    // Wires
    wire [7:0] wdcdOut;
    wire [7:0] rdcdOut1;
    wire [7:0] rdcdOut2;

    wire [31:0] axOut;
    wire [31:0] bxOut;    
    wire [31:0] cxOut;
    wire [31:0] dxOut;

    wire [31:0] gxOut;
    wire [31:0] exOut;
    wire [31:0] eyOut;
    wire [31:0] ezOut;

    reg [31:0] regIn;

    // Decoders
    dcd3x8 wdcd (.sel(waddr), .dcdout(wdcdOut));

    dcd3x8 rdcd1 (.sel(raddr1), .dcdout(rdcdOut1));
    dcd3x8 rdcd2 (.sel(raddr2), .dcdout(rdcdOut2));

    // Tri-state buffers
    tsb axt1 (.d(axOut), .g(rdcdOut1[0]), .q(databus1));
    tsb bxt1 (.d(bxOut), .g(rdcdOut1[1]), .q(databus1));
    tsb cxt1 (.d(cxOut), .g(rdcdOut1[2]), .q(databus1));
    tsb dxt1 (.d(dxOut), .g(rdcdOut1[3]), .q(databus1));

    tsb gxt1 (.d(gxOut), .g(rdcdOut1[4]), .q(databus1));
    tsb ext1 (.d(exOut), .g(rdcdOut1[5]), .q(databus1));
    tsb eyt1 (.d(eyOut), .g(rdcdOut1[6]), .q(databus1));
    tsb ezt1 (.d(ezOut), .g(rdcdOut1[7]), .q(databus1));

    tsb axt2 (.d(axOut), .g(rdcdOut2[0]), .q(databus2));
    tsb bxt2 (.d(bxOut), .g(rdcdOut2[1]), .q(databus2));
    tsb cxt2 (.d(cxOut), .g(rdcdOut2[2]), .q(databus2));
    tsb dxt2 (.d(dxOut), .g(rdcdOut2[3]), .q(databus2));

    tsb gxt2 (.d(gxOut), .g(rdcdOut2[4]), .q(databus2));
    tsb ext2 (.d(exOut), .g(rdcdOut2[5]), .q(databus2));
    tsb eyt2 (.d(eyOut), .g(rdcdOut2[6]), .q(databus2));
    tsb ezt2 (.d(ezOut), .g(rdcdOut2[7]), .q(databus2));

    // Registers
    regGen AX (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[0]), .q(axOut));
    regGen BX (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[1]), .q(bxOut));
    regGen CX (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[2]), .q(cxOut));
    regGen DX (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[3]), .q(dxOut));

    regGen GX (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[4]), .q(gxOut));
    regGen EX (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[5]), .q(exOut));
    regGen EY (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[6]), .q(eyOut));
    regGen EZ (.d(regIn), .rst(rst), .clk(clk), .wen(wdcdOut[7]), .q(ezOut));


    assign regA = axOut;
    assign regB = bxOut;


always @(*) begin
    case (sto)
    1'b1: regIn = dataIn;
    1'b0: regIn = databus1;
    default: regIn = databus1;
    endcase
end


endmodule