// moor_fsm_demo
module example2 (input_port1, output_port1, clk, reset);

input wire input_port1;
input wire reset, clk;
output wire [1:0] output_port1;
reg [1:0] state = 2'b00;

parameter [1:0] state1 = 2'b00, state2 = 2'b01, state3 = 2'b10, state4 = 2'b11;

always@(posedge clk, reset)
begin
    if (reset == 1'b1)
        state = 2'b00;
    else begin
        case (state)
        // usage of "<="" instead of "=" leads to more acurate circuit represention.
        state1: state <= (input_port1 ? state2 : state1);
        state2: state <= (input_port1 ? state3 : state2);
        state3: state <= (input_port1 ? state4 : state3);
        state4: state <= (input_port1 ? state1 : state4);
        default: state <= 2'bxx;
        endcase
    end
end

assign output_port1 = state;

endmodule