
module sub_1506(
    input [1505:0] a_i_c,a_i_s,
    input [1505:0] b_i_c,b_i_s,
    output [1505:0] c_o,
    output [1505:0] s_o
);

wire [1505:0] p;
assign p = 1506'h2f49352b949f8f4812c7e263157738b15f6d37c9bfc0cd4914d536ce3542642d5cfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

wire [1507:0] three_p;
assign three_p = 1508'hbd24d4ae527e3d204b1f898c55dce2c57db4df26ff0335245354db38d50990b573ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc;

wire [1505:0] two;
assign two = 1506'h2;

wire ha_c,ha_s,fa_c,fa_s,fa2_c,fa2_s;
wire [3:0] M;
wire [1505:0] c_f,s_f;
wire [1507:0] neg_c,neg_s;
wire [1506:0] csa1_c,csa1_s;
wire [1508:0] csa2_c,csa2_s;
wire [1509:0] csa3_c,csa3_s;
wire [1510:0] csa4_c,csa4_s;
wire [1507:0] c,s;
wire [1505:0] corr_add;

//Generate neg of b
xor_1506_array xor_1506_array_i0(b_i_c, {1506{1'b1}}, neg_c[1505:0]);
xor_1506_array xor_1506_array_i1(b_i_s, {1506{1'b1}}, neg_s[1505:0]);
//assign neg_c[1505:0] = b_i_c ^ {1506{1'b1}};
//assign neg_s[1505:0] = b_i_s ^ {1506{1'b1}};

assign neg_c[1506] = 1'b1;
assign neg_c[1507] = 1'b1;
assign neg_s[1506] = 1'b1;
assign neg_s[1507] = 1'b1;

// small CSA tree
csa_1507 csa1({1'b0,a_i_c},{1'b0,a_i_s},{1'b0,two},csa1_c,csa1_s);
csa_1509 csa2({1'b0,neg_c},{1'b0,neg_s},{1'b0,three_p},csa2_c,csa2_s);
csa_1510 csa3({1'b0,csa2_c},{1'b0,csa2_s},{3'b0,csa1_c},csa3_c,csa3_s);
csa_1511 csa4({1'b0,csa3_c},{1'b0,csa3_s},{4'b0,csa1_s},csa4_c,csa4_s);

assign c = csa4_c[1507:0];
assign s = csa4_s[1507:0];

//Reduction mod p
ha ha_red (c[1505],s[1505],ha_c,ha_s);
fa fa_red (c[1506],s[1506],ha_c,fa_c,fa_s);
fa fa2_red(c[1507],s[1507],fa_c,fa2_c,fa2_s);

assign M = {fa2_c,fa2_s,fa_s,ha_s};

//LUT for assign corr_add depending on the value of p
sub_1506_lut sub_1506_lut_i(M,corr_add);

csa_1506 csa5({1'b0,c[1504:0]},{1'b0,s[1504:0]},corr_add,c_f,s_f);
assign c_o = c_f;
assign s_o = s_f;

endmodule
    