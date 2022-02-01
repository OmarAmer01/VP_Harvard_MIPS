module ctr_tb();
wire  [9:0]ctrOut;
reg clk, rst, en, dir, jmp;
reg [9:0] jmpLoc;

ctr UUT (.clk(clk), .en(en), .dir(dir), .jmp(jmp),
.jmpLoc(jmpLoc), .rst(rst), .ctrOut(ctrOut));

initial begin
    clk = 0;
    en = 1;
    dir = 1;
    jmp = 0;
    jmpLoc = 10'b0000000000;
    rst = 0;
    #10 rst = 1;
    #10 rst = 0;
    $display("RST COMPLETE");
    #200
    $display("Changing direction");
    dir = 0;
    #200
    dir = 1;
    $display("NOW JUMPING");
    #10 jmp = 1;
    jmpLoc = 10'd69;
    #10 jmp = 0;
    #200
    $finish;
end

always begin
    #10 clk = ~clk;
end

initial begin
    $monitor("CTR OUT = %d", ctrOut);
end



endmodule