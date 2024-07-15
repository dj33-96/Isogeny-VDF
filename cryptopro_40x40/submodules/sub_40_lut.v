
module sub_40_lut(
    input [3:0] M,
    output reg [39:0] corr_add
);

always @(*) begin
    case(M)
    4'd0:   corr_add = 40'h0;
    4'd1:   corr_add = 40'h8000000000;
    4'd2:   corr_add = 40'h7a4039a011;
    4'd3:   corr_add = 40'h7480734022;
    4'd4:   corr_add = 40'h6ec0ace033;
    4'd5:   corr_add = 40'h6900e68044;
    4'd6:   corr_add = 40'h6341202055;
    4'd7:   corr_add = 40'h5d8159c066;
    4'd8:   corr_add = 40'h57c1936077;
    4'd9:   corr_add = 40'h5201cd0088;
    4'd10:  corr_add = 40'h4c4206a099;
    4'd11:  corr_add = 40'h46824040aa;
    4'd12:  corr_add = 40'h40c279e0bb;
    4'd13:  corr_add = 40'h3b02b380cc;
    4'd14:  corr_add = 40'h3542ed20dd;
    4'd15:  corr_add = 40'h2f8326c0ee;
    default:corr_add = 0;
    endcase
end

endmodule
    