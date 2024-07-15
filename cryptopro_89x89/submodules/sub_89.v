
module sub_89(
    input [88:0] a_i_c,a_i_s,
    input [88:0] b_i_c,b_i_s,
    output [88:0] c_o,
    output [88:0] s_o
);

wire [88:0] p;
assign p = 89'h19f393cffffffffffffffff;

wire [90:0] three_p;
assign three_p = 91'h67ce4f3fffffffffffffffc;

wire [88:0] two;
assign two = 89'h2;

wire ha_c,ha_s,fa_c,fa_s,fa2_c,fa2_s;
wire [3:0] M;
wire [88:0] c_f,s_f;
wire [90:0] neg_c,neg_s;
wire [89:0] csa1_c,csa1_s;
wire [91:0] csa2_c,csa2_s;
wire [92:0] csa3_c,csa3_s;
wire [93:0] csa4_c,csa4_s;
wire [90:0] c,s;
wire [88:0] corr_add;

//Generate neg of b
xor_89_array xor_89_array_i0(b_i_c, {89{1'b1}}, neg_c[88:0]);
xor_89_array xor_89_array_i1(b_i_s, {89{1'b1}}, neg_s[88:0]);
//assign neg_c[88:0] = b_i_c ^ {89{1'b1}};
//assign neg_s[88:0] = b_i_s ^ {89{1'b1}};

assign neg_c[89] = 1'b1;
assign neg_c[90] = 1'b1;
assign neg_s[89] = 1'b1;
assign neg_s[90] = 1'b1;

// small CSA tree
csa_90 csa1({1'b0,a_i_c},{1'b0,a_i_s},{1'b0,two},csa1_c,csa1_s);
csa_92 csa2({1'b0,neg_c},{1'b0,neg_s},{1'b0,three_p},csa2_c,csa2_s);
csa_93 csa3({1'b0,csa2_c},{1'b0,csa2_s},{3'b0,csa1_c},csa3_c,csa3_s);
csa_94 csa4({1'b0,csa3_c},{1'b0,csa3_s},{4'b0,csa1_s},csa4_c,csa4_s);

assign c = csa4_c[90:0];
assign s = csa4_s[90:0];

//Reduction mod p
ha ha_red (c[88],s[88],ha_c,ha_s);
fa fa_red (c[89],s[89],ha_c,fa_c,fa_s);
fa fa2_red(c[90],s[90],fa_c,fa2_c,fa2_s);

assign M = {fa2_c,fa2_s,fa_s,ha_s};

//LUT for assign corr_add depending on the value of p
sub_89_lut sub_89_lut_i(M,corr_add);

csa_89 csa5({1'b0,c[87:0]},{1'b0,s[87:0]},corr_add,c_f,s_f);
assign c_o = c_f;
assign s_o = s_f;

endmodule
    