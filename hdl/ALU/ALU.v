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

`define NOT   0
`define AND   1
`define OR    2
`define XOR   3
`define XNOR  4
`define NOR   5
`define NAND  6
`define SLL   7
`define SRL   8
`define ADD   9
`define SUB   10
`define MUL   11
`define DIV   12
`define PASS  13
`define PASSB 14

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
        `NOT:  `aluRes = ~a;
        `AND:  `aluRes = a & b;
        `OR:   `aluRes = a | b;
        `XOR:  `aluRes = a ^ b;
        `XNOR: `aluRes = a ~^ b;
        `NOR:  `aluRes = ~(a | b);
        `NAND: `aluRes = ~(a & b);
        `SLL:   begin
                     shDir = 1;
                    `aluRes = shRes;
                end

        `SRL:   begin
                     shDir = 0;
                    `aluRes = shRes;
                end 
        `ADD:  `aluRes = faRes; 
        `SUB:  `aluRes = fsRes;
        `PASS: `aluRes = a;

        `MUL: {resultExt, `aluRes} = a*b;
        `DIV: `aluRes = a/b;
        // op:
        `PASSB: `aluRes = b;
        default: `aluRes = a;
    endcase

    // CARRY FLAG
        case (opSel) 
        `NOT:  `carryBit = 0;
        `AND:  `carryBit = 0;
        `OR:   `carryBit = 0;
        `XOR:  `carryBit = 0;
        `XNOR: `carryBit = 0;
        `NOR:  `carryBit = 0;
        `NAND: `carryBit = 0;
        // op:
        // op:
         `ADD: `carryBit = faCout;
         `SUB: `carryBit = ~fsCout;
         `PASS: `carryBit = 0;
        // op:
        // op:
        `SLL: `carryBit = a[31];
        `SRL: `carryBit = a[0];
        default: `carryBit = 0;
    endcase

    // // ZERO FLAG
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