// Omar Tarek Amer
// 10/19/2021
// Bidirectional shift register

module shReg  #(parameter width = 32) (
    input [width-1:0] d,
    input clk, rst, dir,
    // dir : 1 right
    //     : 0 left

    output reg [width-1:0] q
);

integer i;

always @(posedge clk) begin
    if(rst) begin
        q = {{width-1}{1'b0}};
        $display("RESETTING");
    end
    else begin
        case (dir)
            1'b0: q <= {d[width-2:0], d};
            1'b1: q <= {d, d[width-1:1]};
            default: q <= 0;
        endcase
    end
end
    
endmodule