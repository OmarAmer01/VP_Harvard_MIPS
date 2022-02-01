// Omar Tarek Amer
// 8 - 27 - 2021
// RAM

module ram (
    input [31:0] dataIn,
    input [10:0] addr,
    input wen,
    input clk,
    input rst,
    output  [31:0] data,
    output  [7:0] port
);
    
    reg  [31:0] ram [2047:0];
    reg [31:0] dataAux;
    assign data = dataAux;
    assign data = ram[addr];
    integer i;
always @(rst, posedge clk) begin

    if(rst) begin

        for (i = 0; i<2048 ;i = i + 1 ) begin
            ram[i] = 32'b0;
        end
    end
    else begin
        case (wen)
            1: ram[addr] = dataIn;
            0: dataAux = ram[addr];
            default: dataAux = ram[addr];
        endcase
    end
end
assign port = ram[1][7:0];
endmodule