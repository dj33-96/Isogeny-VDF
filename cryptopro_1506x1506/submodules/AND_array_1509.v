
module AND_array_1509(
    input [1508:0] a,
    input b,
    output [1508:0] c
);

assign c = a & {1509{b}};

endmodule
    