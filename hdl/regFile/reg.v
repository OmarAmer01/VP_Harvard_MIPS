// Omar Amer
// 32-bit Register
module regGen #(parameter width = 32) (
    input [width-1:0] d,
    input rst,
    input clk,
    input wen,
    output [width-1:0] q

);

reg [width-1:0] qAux;

always @(posedge clk) begin

    if(rst) begin
        qAux = {width{1'b0}};
    end
    else begin
        if(wen) begin
            qAux = d;
        end 
        else
            qAux = qAux;
    end

end
assign q = qAux;  
endmodule