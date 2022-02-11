module jmpCtrl (
    input carry,
    input sign,
    input zero,
    input clk,

    input [3:0] op,

    input jmpWake,

    output reg jmp
);


`define ZERO          0
`define NOTZERO       1
`define EQUAL         2
`define NOTEQUAL      3
`define GREATER       4
`define LESS          5
`define GREATEQUAL    6
`define LESSEQUAL     7
`define CARRY         8
`define NOTCARRY      9
`define UNCONDITIONAL 10


always @(jmpWake) begin
    jmp = 0;
    if(jmpWake) begin
        case (op)
            `ZERO : begin
                if(zero) begin
                    $display("JUMPING ON ZERO");
                    jmp = 1;
                end
            end

            `NOTZERO : begin
                if(~zero) begin
                    $display("JUMPING ON NOT ZERO");
                    jmp = 1;
                end
            end

            `EQUAL : begin
                if(zero) begin
                    $display("JUMPING ON EQUAL");
                    jmp = 1;
                end
            end
            `NOTEQUAL : begin
                if(~zero) begin
                    $display("JUMPING ON NOT EQUAL");
                    jmp = 1;
                end
            end

            `GREATER : begin
                if(~sign && ~zero) begin
                    $display("JUMPING ON GREATER");
                    jmp = 1;
                end
            end

            `LESS : begin
                if(sign && ~zero) begin
                    $display("JUMPING ON LESS");
                    jmp = 1;
                end
            end

            `GREATEQUAL : begin
                if(~sign || zero) begin
                    $display("JUMPING ON GREATER EQUAL");
                    jmp = 1;
                end
            end
            `LESSEQUAL : begin
                if(sign || zero) begin
                    $display("JUMPING ON LESS EQUAL");
                    jmp = 1;
                end
            end
            `UNCONDITIONAL : begin
                $display("JUMPING UNCONDITIONALLY");
                jmp = 1;
            end 
            default: jmp = 0;
        endcase
    end
    else begin
        //$display("JUMP CONDITION NOT MET");
        jmp = 0;
    end
end

    
endmodule