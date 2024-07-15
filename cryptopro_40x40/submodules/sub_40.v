
module sub_40(
    input [39:0] a_i_c,a_i_s,
    input [39:0] b_i_c,b_i_s,
    output [39:0] c_o,
    output [39:0] s_o
);

wire [39:0] p;
assign p = 40'h85bfc65fef;

wire [41:0] three_p;
assign three_p = 42'h216ff197fbc;

wire [39:0] two;
assign two = 40'h2;

wire ha_c,ha_s,fa_c,fa_s,fa2_c,fa2_s;
wire [3:0] M;
wire [39:0] c_f,s_f;
wire [41:0] neg_c,neg_s;
wire [40:0] csa1_c,csa1_s;
wire [42:0] csa2_c,csa2_s;
wire [43:0] csa3_c,csa3_s;
wire [44:0] csa4_c,csa4_s;
wire [41:0] c,s;
wire [39:0] corr_add;

//Generate neg of b
xor_40_array xor_40_array_i0(b_i_c, {40{1'b1}}, neg_c[39:0]);
xor_40_array xor_40_array_i1(b_i_s, {40{1'b1}}, neg_s[39:0]);
//assign neg_c[39:0] = b_i_c ^ {40{1'b1}};
//assign neg_s[39:0] = b_i_s ^ {40{1'b1}};

assign neg_c[40] = 1'b1;
assign neg_c[41] = 1'b1;
assign neg_s[40] = 1'b1;
assign neg_s[41] = 1'b1;

// small CSA tree
csa_41 csa1({1'b0,a_i_c},{1'b0,a_i_s},{1'b0,two},csa1_c,csa1_s);
csa_43 csa2({1'b0,neg_c},{1'b0,neg_s},{1'b0,three_p},csa2_c,csa2_s);
csa_44 csa3({1'b0,csa2_c},{1'b0,csa2_s},{3'b0,csa1_c},csa3_c,csa3_s);
csa_45 csa4({1'b0,csa3_c},{1'b0,csa3_s},{4'b0,csa1_s},csa4_c,csa4_s);

assign c = csa4_c[41:0];
assign s = csa4_s[41:0];

//Reduction mod p
ha ha_red (c[39],s[39],ha_c,ha_s);
fa fa_red (c[40],s[40],ha_c,fa_c,fa_s);
fa fa2_red(c[41],s[41],fa_c,fa2_c,fa2_s);

assign M = {fa2_c,fa2_s,fa_s,ha_s};

//LUT for assign corr_add depending on the value of p
sub_40_lut sub_40_lut_i(M,corr_add);

csa_40 csa5({1'b0,c[38:0]},{1'b0,s[38:0]},corr_add,c_f,s_f);
assign c_o = c_f;
assign s_o = s_f;

endmodule
    