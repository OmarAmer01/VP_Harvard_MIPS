// Omar Amer
// Arithmetic Logic Unit with Bidir shift register.

module ALU(
    output            carryFlag,
    output            signFlag,
    output            zeroFlag,
    output     [31:0] result,
    output reg [31:0] resultExt,
    input      [31:0] a ,
    input      [31:0] b ,
    input      [3 :0] opSel
);

    


// OP CODES

`define alu_NOT   0
`define alu_AND   1
`define alu_OR    2
`define alu_XOR   3
`define alu_XNOR  4
`define alu_NOR   5
`define alu_NAND  6
`define alu_SLL   7
`define alu_SRL   8
`define alu_ADD   9
`define alu_SUB   10
`define alu_MUL   11
`define alu_DIV   12
`define alu_PASS  13
`define alu_PASSB 14

// ================

wire [31:0] faRes, fsRes, shRes;
reg shDir;
wire faCout, fsCout;


reg [32:0] aluOut;
reg auxZero;
`define aluRes   aluOut[31:0]
`define carryBit aluOut[32] 

// COMPONENTS

FA uFA (a, b, 1'b0, faRes, faCout);
FA uFS (a, ~b, 1'b1, fsRes, fsCout);
shifter SH (.out(shRes), .dataIn(a), .dir(shDir));

always @(*) begin
    shDir = 0;
    resultExt = 32'b0;
    // RESULT
    case (opSel)
        `alu_NOT:  `aluRes = ~a;
        `alu_AND:  `aluRes = a & b;
        `alu_OR:   `aluRes = a | b;
        `alu_XOR:  `aluRes = a ^ b;
        `alu_XNOR: `aluRes = a ~^ b;
        `alu_NOR:  `aluRes = ~(a | b);
        `alu_NAND: `aluRes = ~(a & b);
        `alu_SLL:   begin
                         shDir = 1;
                        `aluRes = shRes;
                    end

        `alu_SRL:   begin
                         shDir = 0;
                        `aluRes = shRes;
                    end 
        `alu_ADD:  `aluRes = faRes; 
        `alu_SUB:  `aluRes = fsRes;
        `alu_PASS: `aluRes = a;

        `alu_MUL: {resultExt, `aluRes} = a*b;
        `alu_DIV: `aluRes = a/b;
        `alu_PASSB: `aluRes = b;
           default: `aluRes = a;
    endcase

    // CARRY FLAG
        case (opSel) 
        `alu_NOT:  `carryBit = 0;
        `alu_AND:  `carryBit = 0;
        `alu_OR:   `carryBit = 0;
        `alu_XOR:  `carryBit = 0;
        `alu_XNOR: `carryBit = 0;
        `alu_NOR:  `carryBit = 0;
        `alu_NAND: `carryBit = 0;
        `alu_ADD: `carryBit = faCout;
        `alu_SUB: `carryBit = ~fsCout;
        `alu_PASS: `carryBit = 0;
        `alu_SLL: `carryBit = a[31];
        `alu_SRL: `carryBit = a[0];
        default: `carryBit = 0;
    endcase

    // ZERO FLAG
    if (`aluRes == 0) begin
        auxZero = 1'b1;
    end 
    else begin
        auxZero = 1'b0;
    end

end


assign result =   `aluRes;
assign carryFlag = `carryBit;
assign signFlag =  aluOut[31];
assign zeroFlag = auxZero;



endmodule