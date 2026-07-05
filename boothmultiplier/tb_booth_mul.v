`timescale 1ns / 1ps

module tb_booth_mul;

    // Inputs
    reg [3:0] mul_p;
    reg [3:0] mul_plier;

    // Outputs
    wire q_1;
    wire [3:0] acc;
    wire [3:0] q;
    
    // Combine the output registers to read the full 8-bit result
    wire [7:0] local_product = {acc, q};
    
    // Expected result storage for verification
    reg signed [7:0] expected_product;

    // Instantiate the Unit Under Test (UUT)
    booth_mul uut (
        .mul_p(mul_p), 
        .mul_plier(mul_plier), 
        .q_1(q_1), 
        .acc(acc), 
        .q(q)
    );

    initial begin
        // Open file to dump waveforms for GTKWave analysis
        $dumpfile("booth_simulation.vcd");
        $dumpvars(0, tb_booth_mul);
        
        print_header();

        // TEST CASE 1: Both Positive (3 x 5 = 15)
        verify_case(4'd3, 4'd5);

        // TEST CASE 2: Positive & Negative (-4 x 3 = -12)
        verify_case(4'b1100, 4'd3); // 4'b1100 is -4 in 2's complement

        // TEST CASE 3: Negative & Positive (5 x -2 = -10)
        verify_case(4'd5, 4'b1110); // 4'b1110 is -2 in 2's complement

        // TEST CASE 4: Both Negative (-3 x -3 = 9)
        verify_case(4'b1101, 4'b1101); // 4'b1101 is -3

        $display("\n[SUCCESS] Verification loop completed successfully!");
        $finish;
    end

    // Task to calculate expected value and compare against your hardware output
    task verify_case(input [3:0] p, input [3:0] m);
        begin
            mul_p = p;
            mul_plier = m;
            #10; // Wait for combinational evaluation
            
            // Calculate true signed math using 2's complement sign extension
            expected_product = $signed(p) * $signed(m);
            
            if (local_product === expected_product) begin
                $display("✅ PASSED: %d x %d = %d (Hardware output: %b)", $signed(p), $signed(m), expected_product, local_product);
            end else begin
                $display("❌ FAILED: %d x %d | Expected: %d | Got: %b", $signed(p), $signed(m), expected_product, local_product);
            end
        end
    endtask

    task print_header;
        begin
            $display("==================================================");
            $display("        RUNNING BOOTH MULTIPLIER REGRESSION       ");
            $display("==================================================");
        end
    endtask

endmodule