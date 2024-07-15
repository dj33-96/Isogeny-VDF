
module AND_array_1506(
    input [1505:0] a,
    input b,
    output [1505:0] c
);

assign c = a & {1506{b}};

endmodule
    