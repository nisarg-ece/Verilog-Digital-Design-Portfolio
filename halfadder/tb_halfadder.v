module tb_halfadder;
    reg a, b;       // Inputs are 'reg' in testbench
    wire sum, c;   // Outputs are 'wire'

    // Connect your hardware to the testbench
    halfadder uut (
        .a(a), .b(b), 
        .sum(sum), .c(c)
    );

    initial begin
        // This generates the waveform file for GTKWave
        $dumpfile("halfadder.vcd");
        $dumpvars(0, tb_halfadder);

        // Test Cases
        a = 0; b = 0; #10; // Wait 10 units
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        $display("Test Complete!");
        $finish;
    end
endmodule