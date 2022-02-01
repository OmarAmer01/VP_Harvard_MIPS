module ALU_tb ();
    
reg [67:0] file[0:15361];

wire carryFlag, signFlag, zeroFlag;
wire [31:0] result;

reg [31:0] a;
reg [31:0] b;
reg [3:0] opSel;

ALU UUT(.carryFlag(carryFlag), .signFlag(signFlag), .zeroFlag(zeroFlag), .result(result), .a(a), .b(b), .opSel(opSel));

integer lineNo, out;
initial begin

    out = $fopen("G:/VP/hdl/ALU/aluOut.txt", "w");

    $display("Started Read");
    $readmemh("G:/VP/hdl/ALU/testVector.txt", file);
    $display("DONE");

    for (lineNo = 0; lineNo<15362 ;lineNo=lineNo+1) begin
        #10 {a, b, opSel} = file[lineNo];
        #10 $fwrite(out, "%h_%b_%b_%b\n",result, carryFlag, signFlag, zeroFlag);
    end
    $fclose(out);
    $finish;
end



endmodule