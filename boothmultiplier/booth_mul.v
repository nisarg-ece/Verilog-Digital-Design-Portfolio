// booth multiplier
module booth_mul(

    input [3:0] mul_p,
    input [3:0] mul_plier,
    output reg q_1,
    output reg[3:0] acc, 
    output reg[3:0] q
);

    integer i;

    always @(mul_plier or mul_p) begin
        acc = 4'b0000;
        q = mul_plier;
        q_1 = 1'b0;

        for (i = 0; i < 4; i++) begin
            
            case ({q[0], q_1})
               2'b10 : acc = acc - mul_p;
               2'b01 : acc = acc + mul_p;
                default: ;
            endcase

            {acc, q, q_1} = {acc[3], acc, q};
        end

    end

endmodule