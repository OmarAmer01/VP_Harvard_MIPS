// Omar Amer
// 8/9/2021
// 32-bit Register
module regGen #(parameter width = 32) (
    input [width-1:0] d,
    input rst,
    input clk,
    input wen,
    output reg [width-1:0] q

);

always @(rst, posedge clk) begin

    if(rst) begin
        q = {width{32'b0}};
    end

    else if(clk & (wen == 1)) begin
        q = d;
        end
    else
        q = q;

end
    
endmodule