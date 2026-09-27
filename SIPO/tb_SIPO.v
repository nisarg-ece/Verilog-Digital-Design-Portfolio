module SIPO(
    input clk, rst, s_in,
    output reg [3:0] p_out
    );

        always@(posedge clk or posedge rst) begin
            if (rst) begin
                p_out <= 4'b0000;
            end else begin
                p_out <= {s_in, p_out[3:1]};
            end
        end

endmodule