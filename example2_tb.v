
`timescale 1ns/1ns
`include "example2.v"
module example2_tb ();

reg inpt = 1'b0, reset = 1'b0;
wire [1:0] outpt;
reg clk = 1'b0;

example2 myMoorFSMmodule (inpt, outpt, clk, reset);

always begin
    #10 clk = ~clk;
end

initial begin
    $monitor("input = %b, reset =%b, current state = %b, time = ", inpt, reset, outpt, $realtime);
    #40;
    inpt = 1'b1;
    #100;
    inpt = 1'b0;
    #40;
    reset = 1'b1;
    #20;
    inpt = 1'b1;
    reset = 1'b0;
    #100;
    $finish;
end

endmodule