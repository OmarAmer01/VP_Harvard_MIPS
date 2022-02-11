module regFile_tb();

reg [2:0] waddr, raddr1, raddr2;
reg clk, rst, sto;
reg [31:0] dataIn;
wire [31:0] databus1, databus2;



regFile UUT(.waddr(waddr), .raddr1(raddr1), .rst(rst),
            .raddr2(raddr2), .clk(clk), .sto(sto),
            .databus1(databus1), .databus2(databus2), .dataIn(dataIn));

initial begin
    #10 rst = 1;
    #10 rst = 0;
    $display("DONE RST");

    #10 sto = 1;
        waddr = 0;
        dataIn = 32'hABCD1234;
    #10;
    sto = 0;
    raddr1 = 0;
    raddr2 = 0;

    #10

    sto = 1;
    dataIn = 32'hABCD1234;
    waddr = 1;
    #10
    sto = 0;
    #10;
    #10 sto = 1;
    

end

always begin
    #10 clk = ~clk;
end

initial begin
    $monitor("\n[MONITOR]\nREG [%d] on DB1: %h\nREG [%d] on DB2: %h\n[END MONITOR]", raddr1, databus1, raddr2, databus2);
end

endmodule