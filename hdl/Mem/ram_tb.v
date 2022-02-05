module ram_tb();
wire [31:0] data;
wire [7:0] port;
reg [31:0] dataIn;
reg [10:0] addr;
reg wen, clk, rst;

ram UUT (.data(data), .port(port), .dataIn(dataIn), .addr(addr), .wen(wen), .clk(clk), .rst(rst));

always begin
    #10 clk = ~clk;
end

initial begin
    $monitor("WEN = %b\ndataIN = %h\nADDR: %h ==> %h\n============",wen,dataIn,addr, data);
end

initial begin
    clk = 0;
    #10 rst = 1;
    #10 rst = 0;
    $display("RESET COMPLETE");
    #10 wen = 1;
    addr = 11'h69;
    dataIn = 32'hABCD1234;
    #10
    #10 addr = 11'h47;
    dataIn = 32'hBABA1111;
    #10
    #10 addr = 11'h66;
    dataIn = 32'hFAFADEDE;

    #10 wen = 0;
    #10 addr = 11'h69;
    #10 addr = 11'h47;
    #10 addr = 11'h66;
    $finish;
end

endmodule