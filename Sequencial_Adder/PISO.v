module PISO(
    input clk, rst, load,
    input [3:0] p_in,
    output s_out
    );

    reg [3:0] shift_reg;

    always@(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 4'b0000;
        end else if (load == 0) begin
            shift_reg <= p_in;
        end else begin
            shift_reg <= {1'b0, shift_reg[3:1]};
        end
    end

    assign s_out = shift_reg[0];
endmodule
