// ALU_4bit
module ALU_4 (
    input [3:0] a,b,
    input [2:0] sel,
    output reg[7:0] out
    );

    always @(*) begin
        case (sel)
            3'b000: out = a + b;
            3'b001: out = a - b;
            3'b010: out = a * b;
            3'b011: out = a % b;
            3'b100: out = a & b; 
            3'b101: out = a | b;
            3'b110: out = a ^ b;
            3'b111: out = a ~^ b;
            default: out = 8'b0;
        endcase
    end

endmodule