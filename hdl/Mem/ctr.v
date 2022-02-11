// Omar Tarek Amer
// Counter

module ctr #(parameter width  = 10) (
    output [width-1:0] ctrOut,
    input clk,
    input rst,
    input en,
    input dir, // 0 -> Decrement , 1 -> Increment
    input jmp,
    input [width-1:0] jmpLoc
);



reg [width-1:0] ctrOutAux;

always @(negedge rst) begin
    ctrOutAux = {(width+1){1'b1}};
end

always @(posedge clk) begin
        if(en) begin
            if (dir==1) // Increment
                ctrOutAux = ctrOutAux+1;
            else if (dir==0) // Decrement
                ctrOutAux = ctrOutAux-1;

            if (jmp)
                ctrOutAux = jmpLoc;
        end
end

assign ctrOut = ctrOutAux;

endmodule