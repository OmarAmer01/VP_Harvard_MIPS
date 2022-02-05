module regGen_tb ();
    reg [31:0] d;
    reg rst, clk, wen;
    wire [31:0] q;
    regGen UUT (.d(d), .rst(rst), .clk(clk), .wen(wen), .q(q));

    initial begin
        clk = 0;

        #10 rst = 1;
        #10 rst = 0;
        $display("DONE RESETTING");
        wen = 1;
        d = 32'hABCDABCD;
        #10;
        #10 d = 32'hABCD1234;
        $display("Turning off WEN");
        #10 wen = 0;
        #10 d = 32'hBABAADAD;
        #10 d = 32'h12345678;
        $display("Turning on WEN");
        #10 wen = 1;
        #10 d = 32'hAD12BA34;
        $finish;


    end

    always begin
        #5 clk = ~clk;
    end

initial begin
    $monitor("wen = %b input = %h out = %h",wen, d, q);
end

endmodule