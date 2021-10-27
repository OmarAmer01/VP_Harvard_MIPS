// Omar Tarek Amer
// 08-17-2021
// Counter
module ctr #(parameter width  = 10) (
    input clk,
    input rst,
    input en,
    input dir, // 0 -> Decrement , 1 -> Increment
    input jmp,
    input [width-1:0] jmpLoc,
    output reg [width-1:0] ctrOut
);



reg [width-1:0] ctrOutAux = {(width+1){1'b1}};

always @(posedge rst) begin
    if(rst)
        ctrOutAux = {(width+1){1'b1}};
end

always @(negedge clk) begin
    if(rst)begin
        if (dir) begin
             ctrOutAux <= {(width+1){1'b0}};
        end

        else if (~dir) begin
            ctrOutAux <= {(width+1){1'b1}};
        end
        
    end

        
    else if (en) begin
        if(dir) begin
            ctrOutAux <= ctrOutAux + 1;
        end
        else begin
            ctrOutAux <= ctrOutAux - 1;
        end

        if(jmp) begin
            ctrOutAux <= jmpLoc;
        end

    end
    else begin
        ctrOutAux <= ctrOutAux;
    end


end
   assign ctrOut = ctrOutAux;
endmodule