module d_ff(clk, rst, d_in, q_ot);
    input clk, rst, d_in;
    output reg q_ot;

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            q_ot <= 1'b0;
        end
        else begin 
            q_ot <= d_in;
        end
    end
endmodule
