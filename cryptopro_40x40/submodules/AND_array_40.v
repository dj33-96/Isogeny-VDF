
module AND_array_40(
    input [39:0] a,
    input b,
    output [39:0] c
);

assign c = a & {40{b}};

endmodule
    