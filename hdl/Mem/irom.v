// Omar Tarek Amer
// 08-15-2021
// Instruction Rom
module irom (
    input  [9:0] addr,
    input rst,

    output reg [40:0] data
    
);
    reg [40:0] rom [1023:0];
    assign data = rom [addr];
    always @(posedge rst) begin
        if(rst)begin
            $display("RESETTING ROM");
            data = rom[0]; 
        end

    end

endmodule