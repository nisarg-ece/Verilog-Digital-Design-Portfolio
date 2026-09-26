`timescale 1ns / 1ps

module tb_shift_register;

    // Testbench signals matching module ports
    reg  clk;
    reg  rst;
    reg  sin;
    wire sout;

    // Instantiate Design Under Test (DUT)
    shift_register uut (
        .clk  (clk),
        .rst  (rst),
        .sin  (sin),
        .sout (sout)
    );

    // 100 MHz clock generation (10ns period -> 5ns toggle)
    always #5 clk = ~clk;

    initial begin
        // Setup waveform dump for GTKWave
        $dumpfile("shift_reg_siso.vcd");
        $dumpvars(0, tb_shift_register);

        // Terminal monitor to log output values on changes
        $monitor("Time = %0t ns | rst = %b | sin = %b | sout = %b | internal_reg = %b", 
                 $time, rst, sin, sout, uut.shift_reg);

        // 1. Initialize Inputs & Apply Active-High Asynchronous Reset
        clk = 1'b0;
        rst = 1'b1;  // Assert active-high reset
        sin = 1'b0;

        #12;

        // 2. De-assert reset on falling clock edge to prevent race conditions
        @(negedge clk);
        rst = 1'b0;

        // 3. Shift in 4-bit data stream: 1 -> 0 -> 1 -> 1
        @(negedge clk); sin = 1'b1;  // Cycle 1: shift_reg becomes 1000
        @(negedge clk); sin = 1'b0;  // Cycle 2: shift_reg becomes 0100
        @(negedge clk); sin = 1'b1;  // Cycle 3: shift_reg becomes 1010
        @(negedge clk); sin = 1'b1;  // Cycle 4: shift_reg becomes 1101 (First bit '1' reaches sout)

        // 4. Shift out bits (feed 0s at serial input)
        @(negedge clk); sin = 1'b0;  // Cycle 5: sout outputs second bit ('0')
        @(negedge clk); sin = 1'b0;  // Cycle 6: sout outputs third bit ('1')
        @(negedge clk); sin = 1'b0;  // Cycle 7: sout outputs fourth bit ('1')
        @(negedge clk); sin = 1'b0;  // Cycle 8: empty / 0

        #20;
        $finish;
    end

endmodule