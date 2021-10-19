// Omar Amer
//8/9/2021
// 32-bit tri-state buffer

module tsb (
    input  [31:0] d,
    output reg [31:0] q,
    input g
);
    always @(*) begin
        case(g)
        0: q = 32'bz;
        1: q = d;
        endcase
    end
endmodule