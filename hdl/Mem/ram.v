// Omar Tarek Amer
// RAM

module ram (
    output  [31:0] data,
    output  [7:0] port,
    input [31:0] dataIn,
    input [10:0] addr,
    input wen,
    input clk,
    input rst
);
    
reg  [31:0] ram [2047:0];
reg [31:0] dataAux;
//assign dataAux = ram[addr];
integer i;


    
always @(posedge clk) begin
    if (rst) begin
        for (i = 0; i<2048 ;i = i + 1 ) begin
            ram[i] = 32'b0;
        end
    end
    else begin
            if (wen) begin
                ram[addr] <= dataIn;
            end
    end

    end

assign data = ram[addr];
assign port = ram[0][7:0];

endmodule