// Omar Tarek Amer
// RAM

module ram (
    output reg  [31:0] data,
    input [31:0] dataIn,
    input [10:0] addr,
    input wen,
    input clk,
    input rst
);
    
reg  [31:0] ram [2047:0];
reg [31:0] dataAux;
//assign dataAux = ram[addr];

// initial begin
//     $readmemb("G:/VP/simulation/ZEROS.mem", ram);
// end

    
always @(posedge clk) begin
    // if (rst) begin
    //     for (i = 0; i<2048 ;i = i + 1 ) begin
    //         ram[i] = 32'b0;
    //     end
    // end
            if (wen) begin
                ram[addr] <= dataIn;
                data = dataIn;
            end
            else begin
                data = ram[addr];
            end
    end

    

//assign data = ram[addr];
//assign port = ram[0][7:0];

endmodule