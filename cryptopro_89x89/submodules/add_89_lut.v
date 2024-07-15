
module add_89_lut(
    input [2:0] M,
    output reg [88:0] corr_add
);

always @(*) begin
    case(M)
    3'd0: corr_add = 89'h0;
    3'd1: corr_add = 89'h10000000000000000000000;
    3'd2: corr_add = 89'h60c6c30000000000000001;
    3'd3: corr_add = 89'h160c6c30000000000000001;
    3'd4: corr_add = 89'hc18d860000000000000002;
    3'd5: corr_add = 89'h2254490000000000000003;
    3'd6: corr_add = 89'h12254490000000000000003;
    3'd7: corr_add = 89'h831b0c0000000000000004;
    default: corr_add = 0;
    endcase
end

endmodule
    