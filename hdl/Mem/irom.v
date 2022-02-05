// Omar Tarek Amer
// Instruction Rom
module irom (
    input  [9:0] addr,
    output [40:0] data
    
);
    reg [40:0] dataOut;
    reg [40:0] rom [1023:0];
    assign data = rom[addr];


endmodule