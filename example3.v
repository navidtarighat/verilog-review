module example3 (input_data, parallel_output, clk, reset);

input wire input_data, clk, reset;
parameter WIDTH = 0;
output reg [WIDTH:0] parallel_output;
wire temp;
always@(posedge clk) begin
    if(reset == 1'b1) begin
        parallel_output = {WIDTH{1'b0}};
    end
    else begin
        parallel_output <= {input_data, parallel_output [WIDTH:1]};
    end
end

endmodule