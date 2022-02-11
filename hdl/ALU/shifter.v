module shifter (
    output [31:0] out,
    input  [31:0] dataIn,
    input         dir // 0 = R, 1 = L

);
    
    assign out = dir ? {dataIn[30:0],1'b0} : {1'b0,dataIn[31:1]};

endmodule