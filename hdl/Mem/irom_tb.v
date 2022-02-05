module irom_tb();
reg [9:0] addr;
reg rst;
wire [40:0] data;
irom UUT (.addr(addr), .rst(rst), .data(data));

initial begin
    #10 rst = 1;
    #10 rst = 0;

    $readmemb()
end

endmodule