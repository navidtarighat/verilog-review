module example3 (input_data, parallel_output, clk, reset);

input wire input_data, clk, reset;
parameter WIDTH = 0;
output reg [WIDTH:0] parallel_output;
always@(posedge clk) begin
    if(reset == 1'b1) begin
        parallel_output = {WIDTH{1'b0}};
    end
    else begin
        parallel_output[7] <= input_data;
        parallel_output[6] <= parallel_output[7];
        parallel_output[5] <= parallel_output[6];
        parallel_output[4] <= parallel_output[5];
        parallel_output[3] <= parallel_output[4];
        parallel_output[2] <= parallel_output[3];
        parallel_output[1] <= parallel_output[2];
    end
end

endmodule