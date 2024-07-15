
module add_40_lut(
    input [2:0] M,
    output reg [39:0] corr_add
);

always @(*) begin
    case(M)
    3'd0: corr_add = 40'h0;
    3'd1: corr_add = 40'h8000000000;
    3'd2: corr_add = 40'h7a4039a011;
    3'd3: corr_add = 40'h7480734022;
    3'd4: corr_add = 40'h6ec0ace033;
    3'd5: corr_add = 40'h6900e68044;
    3'd6: corr_add = 40'h6341202055;
    3'd7: corr_add = 40'h5d8159c066;
    default: corr_add = 0;
    endcase
end

endmodule
    