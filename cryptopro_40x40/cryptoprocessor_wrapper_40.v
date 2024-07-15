
module cryptoprocessor_wrapper_40(
    input clk,rst,get_output,data_en,ins_in,
    input [23:0] command_cp,
    input [39:0] din_1,din_2,
    output [39:0] dout_1,dout_2
);

wire [39:0] add_i1_c,add_i1_s,add_i2_c,add_i2_s;
wire [39:0] add_o_c,add_o_s;

wire [39:0] sub_i1_c,sub_i1_s,sub_i2_c,sub_i2_s;
wire [39:0] sub_o_c,sub_o_s;

wire [39:0] mul_i1_c,mul_i1_s,mul_i2_c,mul_i2_s;
wire [81:0] mul_o_c,mul_o_s;
wire [39:0] red_o_c,red_o_s;

// -----> Cryptoprocessor module with memory unit + MUXes
cryptoprocessor_40 cryptoprocess_i(clk,rst,get_output,data_en,ins_in,command_cp,
               din_1,din_2,add_o_c,add_o_s,sub_o_c,sub_o_s,red_o_c,red_o_s,
               dout_1,dout_2,add_i1_c,add_i1_s,add_i2_c,add_i2_s,sub_i1_c,
               sub_i1_s,sub_i2_c,sub_i2_s,mul_i1_c,mul_i1_s,mul_i2_c,mul_i2_s);

// -----> ADD module
add_40 add(add_i1_c,add_i1_s,add_i2_c,add_i2_s,add_o_c,add_o_s);

// -----> SUB module
sub_40 sub(sub_i1_c,sub_i1_s,sub_i2_c,sub_i2_s,sub_o_c,sub_o_s);

// -----> MUL implementation
// mul_40x40 mul(mul_i1_c,mul_i1_s,mul_i2_c,mul_i2_s,mul_o_c,mul_o_s);
wire [3199:0] mul_ins_andmatrix_output0,mul_ins_andmatrix_output1,mul_ins_andmatrix_output2,mul_ins_andmatrix_output3;

wire [79:0] mul_ins_s_0,mul_ins_s_1,mul_ins_s_2,mul_ins_s_3,mul_ins_s_4,mul_ins_s_5,mul_ins_s_6,mul_ins_s_7;
wire [81:0] mul_ins_t_0,mul_ins_t_1,mul_ins_t_2,mul_ins_t_3,mul_ins_t_4,mul_ins_t_5,mul_ins_t_6,mul_ins_t_7,mul_ins_t_8,mul_ins_t_9;

AND_matrix_40x40 AND_matrix_40x40_i0(mul_i1_c,mul_i2_c,mul_ins_andmatrix_output0);
csa_tree_40x80 csa_tree_40x80_i0(mul_ins_andmatrix_output0,mul_ins_s_0,mul_ins_s_1);

AND_matrix_40x40 AND_matrix_40x40_i1(mul_i1_c,mul_i2_s,mul_ins_andmatrix_output1);
csa_tree_40x80 csa_tree_40x80_i1(mul_ins_andmatrix_output1,mul_ins_s_2,mul_ins_s_3);

AND_matrix_40x40 AND_matrix_40x40_i2(mul_i1_s,mul_i2_c,mul_ins_andmatrix_output2);
csa_tree_40x80 csa_tree_40x80_i2(mul_ins_andmatrix_output2,mul_ins_s_4,mul_ins_s_5);

AND_matrix_40x40 AND_matrix_40x40_i3(mul_i1_s,mul_i2_s,mul_ins_andmatrix_output3);
csa_tree_40x80 csa_tree_40x80_i3(mul_ins_andmatrix_output3,mul_ins_s_6,mul_ins_s_7);

csa_82 csa_82_i0({2'b0,mul_ins_s_0},{2'b0,mul_ins_s_1},{2'b0,mul_ins_s_2},mul_ins_t_0,mul_ins_t_1);
csa_82 csa_82_i1({2'b0,mul_ins_s_3},{2'b0,mul_ins_s_4},{2'b0,mul_ins_s_5},mul_ins_t_2,mul_ins_t_3);

csa_82 csa_82_i2({2'b0,mul_ins_s_6},{2'b0,mul_ins_s_7},mul_ins_t_0,mul_ins_t_4,mul_ins_t_5);
csa_82 csa_82_i3(mul_ins_t_1,mul_ins_t_2,mul_ins_t_3,mul_ins_t_6,mul_ins_t_7);

csa_82 csa_82_i4(mul_ins_t_4,mul_ins_t_5,mul_ins_t_6,mul_ins_t_8,mul_ins_t_9);

csa_82 csa_82_i5(mul_ins_t_7,mul_ins_t_8,mul_ins_t_9,mul_o_c,mul_o_s);

// -----> RED implementation
// red_40x40 red(mul_o_c,mul_o_s,red_o_c,red_o_s);
wire [39:0] red_ins_p;
wire [42:0] red_ins_p_prime;
    
assign red_ins_p = 40'h85bfc65fef;
assign red_ins_p_prime = 43'h5a370b50f1;

wire red_ins_ha_c,red_ins_ha_s,red_ins_fa_c,red_ins_fa_s; //,fa_c2,fa_s2,fa_c3,fa_s3;
wire [2:0] red_ins_M;

wire [40:0] red_ins_c_f,red_ins_s_f;
wire [40:0] red_ins_c_c,red_ins_c_s,red_ins_c2,red_ins_cf,red_ins_sf;
wire [42:0] red_ins_mu1c,red_ins_mu1s,red_ins_mu2c,red_ins_mu2s,red_ins_mu_bis,red_ins_mu_bis2,red_ins_mu_t0,red_ins_mu_t1,red_ins_mu_c,red_ins_mu_s;

wire [85:0] red_ins_t1c,red_ins_t1s,red_ins_t2c,red_ins_t2s;
wire [87:0] red_ins_csa_3a_o_c,red_ins_csa_3a_o_s,red_ins_csa_3b_o_c,red_ins_csa_3b_o_s,red_ins_csa_4_o_c,red_ins_csa_4_o_s,red_ins_t_c,red_ins_t_s;
wire [1848:0] red_ins_mu_1,red_ins_mu_2;
wire [3697:0] red_ins_t_1,red_ins_t_2;

wire [40:0] red_ins_corr_add;

//Multiplication mod 2**43
red_part1_43x43 reduction_unit_part1(mul_o_c,mul_o_s,red_ins_p_prime,red_ins_mu_1,red_ins_mu_2);

//ADDER Tree to reduce it to two parts
csa_tree_43x43_truncated ad_tr0(red_ins_mu_1,red_ins_mu1c,red_ins_mu1s); // +3bit long adder treee
csa_tree_43x43_truncated ad_tr1(red_ins_mu_2,red_ins_mu2c,red_ins_mu2s); // +3bit long adder treee
csa_43 csa_1(red_ins_mu1c,red_ins_mu1s,red_ins_mu2c,red_ins_mu_bis,red_ins_mu_bis2); // verify if putting everything at P works
csa_43 csa_2(red_ins_mu_bis,red_ins_mu_bis2,red_ins_mu2s,red_ins_mu_t0,red_ins_mu_t1);

//Trimming
trimming trimming_i0(red_ins_mu_t0[42],red_ins_mu_t1[42],red_ins_mu_c[42]);
trimming trimming_i1(red_ins_mu_t1[42],red_ins_mu_t0[42],red_ins_mu_s[42]);
assign red_ins_mu_c[41:0] = red_ins_mu_t0[41:0];
assign red_ins_mu_s[41:0] = red_ins_mu_t1[41:0];

//t <- t + p*mu
//Done using a 40 multiplier and after compute the three extra bit
AND_matrix_43x43 part2_c({3'd0,red_ins_p},red_ins_mu_c,red_ins_t_1); // 43 * 43  multiplication
AND_matrix_43x43 part2_s({3'd0,red_ins_p},red_ins_mu_s,red_ins_t_2); // 43 * 43  multiplication

//ADDER TREE + CSA
csa_tree_43x86 ad_tr2(red_ins_t_1,red_ins_t1c,red_ins_t1s);
csa_tree_43x86 ad_tr3(red_ins_t_2,red_ins_t2c,red_ins_t2s);

csa_88 csa_3a({2'd0,red_ins_t1c},{2'd0,red_ins_t1s},{2'd0,red_ins_t2c},red_ins_csa_3a_o_c,red_ins_csa_3a_o_s);
csa_88 csa_3b({2'd0,red_ins_t2s},{6'd0,mul_o_c},{6'd0,mul_o_s},red_ins_csa_3b_o_c,red_ins_csa_3b_o_s);

csa_88 csa_4(red_ins_csa_3a_o_c,red_ins_csa_3a_o_s,red_ins_csa_3b_o_c,red_ins_csa_4_o_c,red_ins_csa_4_o_s);//adding t to the product
csa_88 csa_5(red_ins_csa_4_o_c,red_ins_csa_4_o_s,red_ins_csa_3b_o_s,red_ins_t_c,red_ins_t_s);

assign red_ins_c_c = red_ins_t_c[83:43];
assign red_ins_c_s = red_ins_t_s[83:43];

or_gate or_gate_i0(red_ins_t_c[42],red_ins_t_s[42],red_ins_c2[0]);
assign red_ins_c2[40:1] = 0; 

csa_41 csa_f(red_ins_c_c,red_ins_c_s,red_ins_c2,red_ins_cf,red_ins_sf);

//Small Reduction mod p
ha ha_i(red_ins_cf[39],red_ins_sf[39],red_ins_ha_c,red_ins_ha_s);
fa fa_i(red_ins_cf[40],red_ins_sf[40],red_ins_ha_c,red_ins_fa_c,red_ins_fa_s);

assign red_ins_M = {red_ins_fa_c,red_ins_fa_s,red_ins_ha_s};

//LUT for assign corr_add depending on the value of p
red_40_lut red_40_lut_i(red_ins_M,red_ins_corr_add);

//Last reduction
csa_41 csa1({2'b0,red_ins_cf[38:0]},{2'b0,red_ins_sf[38:0]},red_ins_corr_add,red_ins_c_f,red_ins_s_f);
assign red_o_c = red_ins_c_f[39:0];
assign red_o_s = red_ins_s_f[39:0];

endmodule
    