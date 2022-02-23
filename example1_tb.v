
`timescale 1ns/1ns
`include "example1.v"
module example1_tb ();

reg [3:0] a = 4'b1011;
reg [3:0] b = 4'b1010;
wire [7:0] ans;
wire end_sig;
reg clk = 1'b0;

example1 mymodule (a, b, ans, clk, end_sig);

always begin
    #10 clk = ~clk;
end

initial begin
    $monitor("input1 = %b, input2 = %b, output = %b, end = %b, time = ", a, b, ans,end_sig, $realtime);
    #500;
    $finish;
end

endmodule