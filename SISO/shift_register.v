module shift_register(
	input clk, rst, sin,
	output sout
	);
    reg [3:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 4'b0000;
        end else begin
            // Shift right: MSB gets s_in, previous bits shift toward LSB
            shift_reg <= {sin, shift_reg[3:1]};
        end
    end

    // The serial output is always the LSB of the pipeline
    assign sout = shift_reg[0];

endmodule

