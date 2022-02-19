// Omar Tarek Amer
// Instruction Rom
module irom (
    input  [9:0] addr,
    output [40:0] data
    
);

    initial begin
        $readmemb("G:/VP/simulation/goodisa_rmh.mem", rom);
    end

   
    reg [40:0] rom [1023:0];



    assign data = rom[addr];

endmodule