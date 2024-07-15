
module AND_array_92(
    input [91:0] a,
    input b,
    output [91:0] c
);

assign c = a & {92{b}};

endmodule
    