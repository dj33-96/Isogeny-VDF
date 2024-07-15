
module cryptoprocessor_wrapper_89(
    input clk,rst,get_output,data_en,ins_in,
    input [23:0] command_cp,
    input [88:0] din_1,din_2,
    output [88:0] dout_1,dout_2
);

wire [88:0] add_i1_c,add_i1_s,add_i2_c,add_i2_s;
wire [88:0] add_o_c,add_o_s;

wire [88:0] sub_i1_c,sub_i1_s,sub_i2_c,sub_i2_s;
wire [88:0] sub_o_c,sub_o_s;

wire [88:0] mul_i1_c,mul_i1_s,mul_i2_c,mul_i2_s;
wire [179:0] mul_o_c,mul_o_s;
wire [88:0] red_o_c,red_o_s;

// -----> Cryptoprocessor module with memory unit + MUXes
cryptoprocessor_89 cryptoprocess_i(clk,rst,get_output,data_en,ins_in,command_cp,
               din_1,din_2,add_o_c,add_o_s,sub_o_c,sub_o_s,red_o_c,red_o_s,
               dout_1,dout_2,add_i1_c,add_i1_s,add_i2_c,add_i2_s,sub_i1_c,
               sub_i1_s,sub_i2_c,sub_i2_s,mul_i1_c,mul_i1_s,mul_i2_c,mul_i2_s);

// -----> ADD module
add_89 add(add_i1_c,add_i1_s,add_i2_c,add_i2_s,add_o_c,add_o_s);

// -----> SUB module
sub_89 sub(sub_i1_c,sub_i1_s,sub_i2_c,sub_i2_s,sub_o_c,sub_o_s);

// -----> MUL implementation
// mul_89x89 mul(mul_i1_c,mul_i1_s,mul_i2_c,mul_i2_s,mul_o_c,mul_o_s);
wire [15841:0] mul_ins_andmatrix_output0,mul_ins_andmatrix_output1,mul_ins_andmatrix_output2,mul_ins_andmatrix_output3;

wire [177:0] mul_ins_s_0,mul_ins_s_1,mul_ins_s_2,mul_ins_s_3,mul_ins_s_4,mul_ins_s_5,mul_ins_s_6,mul_ins_s_7;
wire [179:0] mul_ins_t_0,mul_ins_t_1,mul_ins_t_2,mul_ins_t_3,mul_ins_t_4,mul_ins_t_5,mul_ins_t_6,mul_ins_t_7,mul_ins_t_8,mul_ins_t_9;

AND_matrix_89x89 AND_matrix_89x89_i0(mul_i1_c,mul_i2_c,mul_ins_andmatrix_output0);
csa_tree_89x178 csa_tree_89x178_i0(mul_ins_andmatrix_output0,mul_ins_s_0,mul_ins_s_1);

AND_matrix_89x89 AND_matrix_89x89_i1(mul_i1_c,mul_i2_s,mul_ins_andmatrix_output1);
csa_tree_89x178 csa_tree_89x178_i1(mul_ins_andmatrix_output1,mul_ins_s_2,mul_ins_s_3);

AND_matrix_89x89 AND_matrix_89x89_i2(mul_i1_s,mul_i2_c,mul_ins_andmatrix_output2);
csa_tree_89x178 csa_tree_89x178_i2(mul_ins_andmatrix_output2,mul_ins_s_4,mul_ins_s_5);

AND_matrix_89x89 AND_matrix_89x89_i3(mul_i1_s,mul_i2_s,mul_ins_andmatrix_output3);
csa_tree_89x178 csa_tree_89x178_i3(mul_ins_andmatrix_output3,mul_ins_s_6,mul_ins_s_7);

csa_180 csa_180_i0({2'b0,mul_ins_s_0},{2'b0,mul_ins_s_1},{2'b0,mul_ins_s_2},mul_ins_t_0,mul_ins_t_1);
csa_180 csa_180_i1({2'b0,mul_ins_s_3},{2'b0,mul_ins_s_4},{2'b0,mul_ins_s_5},mul_ins_t_2,mul_ins_t_3);

csa_180 csa_180_i2({2'b0,mul_ins_s_6},{2'b0,mul_ins_s_7},mul_ins_t_0,mul_ins_t_4,mul_ins_t_5);
csa_180 csa_180_i3(mul_ins_t_1,mul_ins_t_2,mul_ins_t_3,mul_ins_t_6,mul_ins_t_7);

csa_180 csa_180_i4(mul_ins_t_4,mul_ins_t_5,mul_ins_t_6,mul_ins_t_8,mul_ins_t_9);

csa_180 csa_180_i5(mul_ins_t_7,mul_ins_t_8,mul_ins_t_9,mul_o_c,mul_o_s);

// -----> RED implementation
// red_89x89 red(mul_o_c,mul_o_s,red_o_c,red_o_s);
wire [88:0] red_ins_p;
wire [91:0] red_ins_p_prime;
    
assign red_ins_p = 89'h19f393cffffffffffffffff;
assign red_ins_p_prime = 92'h19f393d0000000000000001;

wire red_ins_ha_c,red_ins_ha_s,red_ins_fa_c,red_ins_fa_s; //,fa_c2,fa_s2,fa_c3,fa_s3;
wire [2:0] red_ins_M;

wire [89:0] red_ins_c_f,red_ins_s_f;
wire [89:0] red_ins_c_c,red_ins_c_s,red_ins_c2,red_ins_cf,red_ins_sf;
wire [91:0] red_ins_mu1c,red_ins_mu1s,red_ins_mu2c,red_ins_mu2s,red_ins_mu_bis,red_ins_mu_bis2,red_ins_mu_t0,red_ins_mu_t1,red_ins_mu_c,red_ins_mu_s;

wire [183:0] red_ins_t1c,red_ins_t1s,red_ins_t2c,red_ins_t2s;
wire [185:0] red_ins_csa_3a_o_c,red_ins_csa_3a_o_s,red_ins_csa_3b_o_c,red_ins_csa_3b_o_s,red_ins_csa_4_o_c,red_ins_csa_4_o_s,red_ins_t_c,red_ins_t_s;
wire [8463:0] red_ins_mu_1,red_ins_mu_2;
wire [16927:0] red_ins_t_1,red_ins_t_2;

wire [89:0] red_ins_corr_add;

//Multiplication mod 2**92
red_part1_92x92 reduction_unit_part1(mul_o_c,mul_o_s,red_ins_p_prime,red_ins_mu_1,red_ins_mu_2);

//ADDER Tree to reduce it to two parts
csa_tree_92x92_truncated ad_tr0(red_ins_mu_1,red_ins_mu1c,red_ins_mu1s); // +3bit long adder treee
csa_tree_92x92_truncated ad_tr1(red_ins_mu_2,red_ins_mu2c,red_ins_mu2s); // +3bit long adder treee
csa_92 csa_1(red_ins_mu1c,red_ins_mu1s,red_ins_mu2c,red_ins_mu_bis,red_ins_mu_bis2); // verify if putting everything at P works
csa_92 csa_2(red_ins_mu_bis,red_ins_mu_bis2,red_ins_mu2s,red_ins_mu_t0,red_ins_mu_t1);

//Trimming
trimming trimming_i0(red_ins_mu_t0[91],red_ins_mu_t1[91],red_ins_mu_c[91]);
trimming trimming_i1(red_ins_mu_t1[91],red_ins_mu_t0[91],red_ins_mu_s[91]);
assign red_ins_mu_c[90:0] = red_ins_mu_t0[90:0];
assign red_ins_mu_s[90:0] = red_ins_mu_t1[90:0];

//t <- t + p*mu
//Done using a 89 multiplier and after compute the three extra bit
AND_matrix_92x92 part2_c({3'd0,red_ins_p},red_ins_mu_c,red_ins_t_1); // 92 * 92  multiplication
AND_matrix_92x92 part2_s({3'd0,red_ins_p},red_ins_mu_s,red_ins_t_2); // 92 * 92  multiplication

//ADDER TREE + CSA
csa_tree_92x184 ad_tr2(red_ins_t_1,red_ins_t1c,red_ins_t1s);
csa_tree_92x184 ad_tr3(red_ins_t_2,red_ins_t2c,red_ins_t2s);

csa_186 csa_3a({2'd0,red_ins_t1c},{2'd0,red_ins_t1s},{2'd0,red_ins_t2c},red_ins_csa_3a_o_c,red_ins_csa_3a_o_s);
csa_186 csa_3b({2'd0,red_ins_t2s},{6'd0,mul_o_c},{6'd0,mul_o_s},red_ins_csa_3b_o_c,red_ins_csa_3b_o_s);

csa_186 csa_4(red_ins_csa_3a_o_c,red_ins_csa_3a_o_s,red_ins_csa_3b_o_c,red_ins_csa_4_o_c,red_ins_csa_4_o_s);//adding t to the product
csa_186 csa_5(red_ins_csa_4_o_c,red_ins_csa_4_o_s,red_ins_csa_3b_o_s,red_ins_t_c,red_ins_t_s);

assign red_ins_c_c = red_ins_t_c[181:92];
assign red_ins_c_s = red_ins_t_s[181:92];

or_gate or_gate_i0(red_ins_t_c[91],red_ins_t_s[91],red_ins_c2[0]);
assign red_ins_c2[89:1] = 0; 

csa_90 csa_f(red_ins_c_c,red_ins_c_s,red_ins_c2,red_ins_cf,red_ins_sf);

//Small Reduction mod p
ha ha_i(red_ins_cf[88],red_ins_sf[88],red_ins_ha_c,red_ins_ha_s);
fa fa_i(red_ins_cf[89],red_ins_sf[89],red_ins_ha_c,red_ins_fa_c,red_ins_fa_s);

assign red_ins_M = {red_ins_fa_c,red_ins_fa_s,red_ins_ha_s};

//LUT for assign corr_add depending on the value of p
red_89_lut red_89_lut_i(red_ins_M,red_ins_corr_add);

//Last reduction
csa_90 csa1({2'b0,red_ins_cf[87:0]},{2'b0,red_ins_sf[87:0]},red_ins_corr_add,red_ins_c_f,red_ins_s_f);
assign red_o_c = red_ins_c_f[88:0];
assign red_o_s = red_ins_s_f[88:0];

endmodule
    