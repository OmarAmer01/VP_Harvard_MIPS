// Omar Tarek Amer
// 08-15-2021
// Instruction Rom
module irom (
    input  [9:0] addr,
    input rst,

    output [40:0] data
    
);
    reg [40:0] dataOut;
    reg [40:0] rom [1023:0];
    assign data = dataOut;
    always @(posedge rst) begin
        if(rst)begin
            $display("RESETTING ROM");
            dataOut = rom[0]; 
        end

    end

endmodule