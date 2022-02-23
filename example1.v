module example1 (input_port1, input_port2, output_port1, clk, end_sig);

input wire clk;
input wire [3:0] input_port1, input_port2;
output reg [7:0] output_port1;
reg [3:0] temp;
output reg end_sig = 1'b0;

reg [4:0] operation = 5'b00000;

always@(posedge clk)
begin
    if (end_sig == 1'b0)
    begin
    //reset
    output_port1 = 8'b00000000;

    case (operation)
        // 1's complement
        //5'b00000: output_port1 = ~input_port1;
        5'b00000: temp = ~input_port1;
        // bitwise AND
        5'b00001: output_port1 = input_port1 & input_port2;
        // bitwise OR
        5'b00010: output_port1 = input_port1 | input_port2;
        // bitwise XOR
        5'b00011: output_port1 = input_port1 ^ input_port2;
        // bitwise XNOR
        5'b00100: output_port1 = input_port1 ~^ input_port2;
        /* logical operators, operate on only ONE digit inputs. if the inputs have more than one digit,
           logical operetor, operates on digits made up by the "OR" of all digits of an input. */
        // logical NOT
        5'b00101: output_port1 = !input_port1;
        // logical AND
        5'b00110: output_port1 = input_port1 && input_port2;
        // logical OR
        5'b00111: output_port1 = input_port1 || input_port2;
        /* reduction operators, operate on digits of a single input */
        // reduction AND
        5'b01000: output_port1 = &input_port1;
        // reduction OR
        5'b01001: output_port1 = |input_port1;
        // reduction XOR
        5'b01010: output_port1 = ^input_port1;
        // sum
        5'b01011: output_port1 = input_port1 + input_port2;
        // 2's complement
        5'b01100: output_port1 = -input_port1;
        // subtract
        5'b01101: output_port1 = input_port1 - input_port2;
        // multiply
        5'b01110: output_port1 = input_port1 * input_port2;
        // divide
        5'b01111: output_port1 = input_port1 / input_port2;
        // grater
        5'b10000: output_port1 = input_port1 > input_port2;
        // grater or equal
        5'b10001: output_port1 = input_port1 >= input_port2;
        // equal
        5'b10010: output_port1 = input_port1 == input_port2;
        // inequal
        5'b10011: output_port1 = input_port1 != input_port2;
        // left shift
        5'b10100: output_port1 = input_port1 << 3;
        //right shift
        5'b10101: output_port1 = input_port1 >> 3;
        // concatinate
        5'b10110: output_port1 = {input_port1, input_port2};
        // replicaton
        5'b10111: output_port1 = {2{input_port1}};
        default: 
        begin 
            output_port1 = 8'b00000000;
            end_sig = 1'b1;
        end
    endcase

    operation = operation + 1'b1;
    end
end
endmodule