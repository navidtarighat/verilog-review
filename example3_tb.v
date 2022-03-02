`timescale 1ns/1ns
`include "example3.v"

module example3_tb ();

reg input_sig, reset;
reg clk = 1'b0;
wire [7:0] output_sig;
integer i;

example3 uut (.input_data(input_sig), .parallel_output(output_sig), .clk(clk), .reset(reset));
defparam uut.WIDTH = 7;

initial begin
    reset = 1'b1;
    #15;
    reset = 1'b0;
    #10;
    for(i=0 ; i<10 ; i=i+1) begin
        input_sig = $random;
        $display("input signal = %b, output_signal = %b, time = %t", input_sig, output_sig, $time);
        #20;
    end
    $finish;
end

initial begin
    $dumpfile("example3_out.vcd");
    $dumpvars;
end

always begin
    #10; clk = ~clk;
end

endmodule