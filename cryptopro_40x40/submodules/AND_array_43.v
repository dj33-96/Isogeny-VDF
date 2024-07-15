
module AND_array_43(
    input [42:0] a,
    input b,
    output [42:0] c
);

assign c = a & {43{b}};

endmodule
    