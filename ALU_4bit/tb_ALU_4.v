module tb_ALU_4;
    reg [3:0] a, b;
    reg [2:0] sel;
    wire [7:0] out;

    integer i,j,k;

    ALU_4 uut(
        .a(a), .b(b), .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("ALU_4.vcd");
        $dumpvars(0, tb_ALU_4);

        for(k=0; k<8; k+=1) begin
            sel = k;
            for(i=0; i<16; i+=1) begin
                for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
                end
            end
        end
        $display("Verification Done!");
        $finish;
    end
/* Instead of writing 8 loops we worked with 3 loops........
sel = 3'b000;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
            end
        end

        sel = 3'b001;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a=i; b=j;
                #10;
            end
        end
        sel = 3'b010;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
            end
        end
        sel = 3'b011;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
            end
        end
        sel = 3'b100;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
            end
        end
        sel = 3'b101;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
            end
        end
        sel = 3'b110;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
            end
        end
        sel = 3'b111;
        for(i=0; i<16; i+=1) begin
            for(j=0; j<16; j+=1) begin
                a = i; b = j;
                #10;
            end
        end
*/
endmodule