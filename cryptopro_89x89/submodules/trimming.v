
module trimming(
    input in0,in1,
    output out0
);

assign out0 = in0 & ~in1;

endmodule
    