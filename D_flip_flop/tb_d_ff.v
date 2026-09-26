module tb_d_ff;
    reg clk, rst, d_in;
    wire q_ot;

    d_ff uut (.d_in(d_in),
        .clk(clk),
        .rst(rst),
        .q_ot(q_ot));

    always begin 
        #10 clk = ~clk;
    end
    initial begin

        $display("Simulation starting...");
        clk = 0;
        d_in = 0;
        rst = 0;

        $dumpfile("d_ff.vcd");
        $dumpvars(0, tb_d_ff);

        #10; rst = 0;
        #5; rst = 1;

        #10; d_in = 0;
        #15; d_in = 1;

        #5; rst = 0;
        #10; rst = 1;
        #10;
        $finish;
    end
    initial begin
        $monitor("Time = %0t | rst = %b | d_in = %b | q_ot = %b", $time, rst, d_in, q_ot);
    end

endmodule