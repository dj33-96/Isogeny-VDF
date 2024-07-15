
module sub_89_lut(
    input [3:0] M,
    output reg [88:0] corr_add
);

always @(*) begin
    case(M)
    4'd0:   corr_add = 89'h0;
    4'd1:   corr_add = 89'h10000000000000000000000;
    4'd2:   corr_add = 89'h60c6c30000000000000001;
    4'd3:   corr_add = 89'h160c6c30000000000000001;
    4'd4:   corr_add = 89'hc18d860000000000000002;
    4'd5:   corr_add = 89'h2254490000000000000003;
    4'd6:   corr_add = 89'h12254490000000000000003;
    4'd7:   corr_add = 89'h831b0c0000000000000004;
    4'd8:   corr_add = 89'h1831b0c0000000000000004;
    4'd9:   corr_add = 89'he3e1cf0000000000000005;
    4'd10:  corr_add = 89'h44a8920000000000000006;
    4'd11:  corr_add = 89'h144a8920000000000000006;
    4'd12:  corr_add = 89'ha56f550000000000000007;
    4'd13:  corr_add = 89'h636180000000000000008;
    4'd14:  corr_add = 89'h10636180000000000000008;
    4'd15:  corr_add = 89'h66fcdb0000000000000009;
    default:corr_add = 0;
    endcase
end

endmodule
    