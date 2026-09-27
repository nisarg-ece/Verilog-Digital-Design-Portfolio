module sequential_adder(
    input clk, rst, load,
    input [3:0] A, B,
    output [3:0] Sum,
    output Cout
    );

    wire s_a, s_b, s_s, c_current, c_next;

    PISO piso_a (
        .clk(clk),
        .rst(rst),
        .load(load),
        .p_in(A),
        .s_out(s_a)
    );

    PISO piso_b (
        .clk(clk),
        .rst(rst),
        .load(load),
        .p_in(B),
        .s_out(s_b)
    );

    fulladder FF (
        .a(s_a),
        .b(s_b),
        .c(c_current),
        .sum(s_s),
        .carry(c_next)
    );

    d_ff DFF (
        .clk(clk),
        .rst(rst | ~load),
        .d_in(c_next),
        .q_ot(c_current)
    );

    SIPO sipo_sum (
        .clk(clk),
        .rst(rst),
        .s_in(s_s),
        .p_out(Sum)
    );

    assign Cout = c_current;

endmodule

