// Half Adder Design (Gate-level)
module halfadder (a, b, sum, c);
    input a, b;
    output sum, c;

    assign sum = a^b;
    assign c = a&b;

endmodule
