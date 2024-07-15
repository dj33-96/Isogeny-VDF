
module AND_array_89(
    input [88:0] a,
    input b,
    output [88:0] c
);

assign c = a & {89{b}};

endmodule
    