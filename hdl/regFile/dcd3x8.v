// Omar Amer
// 08-09-2021
// 3 X 8 Decoder

module dcd3x8 (
    input      [2:0] sel,
    output reg [7:0] dcdout
);
    
    always @(sel) begin

            case(sel)
                0: dcdout = 8'b00000001;
                1: dcdout = 8'b00000010;
                2: dcdout = 8'b00000100;
                3: dcdout = 8'b00001000;
                4: dcdout = 8'b00010000;
                5: dcdout = 8'b00100000;
                6: dcdout = 8'b01000000;
                7: dcdout = 8'b10000000;
                default: dcdout = 8'b0;
            endcase
        
    end

endmodule