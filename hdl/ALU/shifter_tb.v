module shifter_tb ();


reg dir;
reg [31:0] dataIn;
wire [31:0]out;


shifter UUT (.out(out), .dataIn(dataIn), .dir(dir));


initial begin
    $monitor("DIR = %b | IN = %h | OUT = %h", dir, dataIn, out);
    #10 dir = 1;
    dataIn = 32'hABCD_FFFF;
    #10 dir = 0;
    #10;
    $finish;
end

endmodule