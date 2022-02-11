// Omar Amer
// 8 X 32 Register File

module regFile (
    output [31:0] databus1,
    output [31:0] databus2,

    input [2:0]  waddr,
    input [2:0]  raddr1,
    input [2:0]  raddr2,
    input        clk,
    input        rst,
    input        sto,
    input        mul,
    
    input [31:0] dataIn,
    input [31:0] dataInExt // Mainly used for multiplication
);

    reg [31:0] regFile [7:0];

    integer i;
    always @(posedge clk , posedge rst) begin
        if (rst) begin
            for (i = 0;i < 8 ; i = i + 1 ) begin
                regFile[i] <= {32{1'b0}};
            end
        end
        else if (sto) begin
            
            if (mul) begin
                regFile[3] <= dataInExt; // add the upper part of the multiplication operation to the DX register
                regFile[0] <= dataIn; // LOWER TO AX
            end
            else begin
                regFile[waddr] <= dataIn;
            end
        end

    end

assign databus1 = regFile[raddr1];
assign databus2 = regFile[raddr2];


endmodule