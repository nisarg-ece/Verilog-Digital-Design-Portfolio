module tb_PISO;

    reg clk, rst, load;
    wire s_out;

    PISO uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .s_out(s_out)
    );
    
endmodule