
module add_40(
    input [39:0] a_i_c,a_i_s,
    input [39:0] b_i_c,b_i_s,
    output [39:0] c_o,
    output [39:0] s_o
);

wire [39:0] p;
assign p = 40'h85bfc65fef;

wire ha_c,ha_s,fa_c,fa_s;
wire [2:0] M;
wire [39:0] c_t,s_t,c_t2,s_t2;
wire [39:0] c_f,s_f;
wire [39:0] corr_add;
wire [40:0] c,s;

// FAs
    
fa fau_0_0(a_i_c[0],a_i_s[0],b_i_c[0],c_t[0],s_t[0]);
fa fau_0_1(a_i_c[1],a_i_s[1],b_i_c[1],c_t[1],s_t[1]);
fa fau_0_2(a_i_c[2],a_i_s[2],b_i_c[2],c_t[2],s_t[2]);
fa fau_0_3(a_i_c[3],a_i_s[3],b_i_c[3],c_t[3],s_t[3]);
fa fau_0_4(a_i_c[4],a_i_s[4],b_i_c[4],c_t[4],s_t[4]);
fa fau_0_5(a_i_c[5],a_i_s[5],b_i_c[5],c_t[5],s_t[5]);
fa fau_0_6(a_i_c[6],a_i_s[6],b_i_c[6],c_t[6],s_t[6]);
fa fau_0_7(a_i_c[7],a_i_s[7],b_i_c[7],c_t[7],s_t[7]);
fa fau_0_8(a_i_c[8],a_i_s[8],b_i_c[8],c_t[8],s_t[8]);
fa fau_0_9(a_i_c[9],a_i_s[9],b_i_c[9],c_t[9],s_t[9]);
fa fau_0_10(a_i_c[10],a_i_s[10],b_i_c[10],c_t[10],s_t[10]);
fa fau_0_11(a_i_c[11],a_i_s[11],b_i_c[11],c_t[11],s_t[11]);
fa fau_0_12(a_i_c[12],a_i_s[12],b_i_c[12],c_t[12],s_t[12]);
fa fau_0_13(a_i_c[13],a_i_s[13],b_i_c[13],c_t[13],s_t[13]);
fa fau_0_14(a_i_c[14],a_i_s[14],b_i_c[14],c_t[14],s_t[14]);
fa fau_0_15(a_i_c[15],a_i_s[15],b_i_c[15],c_t[15],s_t[15]);
fa fau_0_16(a_i_c[16],a_i_s[16],b_i_c[16],c_t[16],s_t[16]);
fa fau_0_17(a_i_c[17],a_i_s[17],b_i_c[17],c_t[17],s_t[17]);
fa fau_0_18(a_i_c[18],a_i_s[18],b_i_c[18],c_t[18],s_t[18]);
fa fau_0_19(a_i_c[19],a_i_s[19],b_i_c[19],c_t[19],s_t[19]);
fa fau_0_20(a_i_c[20],a_i_s[20],b_i_c[20],c_t[20],s_t[20]);
fa fau_0_21(a_i_c[21],a_i_s[21],b_i_c[21],c_t[21],s_t[21]);
fa fau_0_22(a_i_c[22],a_i_s[22],b_i_c[22],c_t[22],s_t[22]);
fa fau_0_23(a_i_c[23],a_i_s[23],b_i_c[23],c_t[23],s_t[23]);
fa fau_0_24(a_i_c[24],a_i_s[24],b_i_c[24],c_t[24],s_t[24]);
fa fau_0_25(a_i_c[25],a_i_s[25],b_i_c[25],c_t[25],s_t[25]);
fa fau_0_26(a_i_c[26],a_i_s[26],b_i_c[26],c_t[26],s_t[26]);
fa fau_0_27(a_i_c[27],a_i_s[27],b_i_c[27],c_t[27],s_t[27]);
fa fau_0_28(a_i_c[28],a_i_s[28],b_i_c[28],c_t[28],s_t[28]);
fa fau_0_29(a_i_c[29],a_i_s[29],b_i_c[29],c_t[29],s_t[29]);
fa fau_0_30(a_i_c[30],a_i_s[30],b_i_c[30],c_t[30],s_t[30]);
fa fau_0_31(a_i_c[31],a_i_s[31],b_i_c[31],c_t[31],s_t[31]);
fa fau_0_32(a_i_c[32],a_i_s[32],b_i_c[32],c_t[32],s_t[32]);
fa fau_0_33(a_i_c[33],a_i_s[33],b_i_c[33],c_t[33],s_t[33]);
fa fau_0_34(a_i_c[34],a_i_s[34],b_i_c[34],c_t[34],s_t[34]);
fa fau_0_35(a_i_c[35],a_i_s[35],b_i_c[35],c_t[35],s_t[35]);
fa fau_0_36(a_i_c[36],a_i_s[36],b_i_c[36],c_t[36],s_t[36]);
fa fau_0_37(a_i_c[37],a_i_s[37],b_i_c[37],c_t[37],s_t[37]);
fa fau_0_38(a_i_c[38],a_i_s[38],b_i_c[38],c_t[38],s_t[38]);
fa fau_0_39(a_i_c[39],a_i_s[39],b_i_c[39],c_t[39],s_t[39]);
    
fa fau_1_1(b_i_s[1],s_t[1],c_t[0],c_t2[1],s_t2[1]);
fa fau_1_2(b_i_s[2],s_t[2],c_t[1],c_t2[2],s_t2[2]);
fa fau_1_3(b_i_s[3],s_t[3],c_t[2],c_t2[3],s_t2[3]);
fa fau_1_4(b_i_s[4],s_t[4],c_t[3],c_t2[4],s_t2[4]);
fa fau_1_5(b_i_s[5],s_t[5],c_t[4],c_t2[5],s_t2[5]);
fa fau_1_6(b_i_s[6],s_t[6],c_t[5],c_t2[6],s_t2[6]);
fa fau_1_7(b_i_s[7],s_t[7],c_t[6],c_t2[7],s_t2[7]);
fa fau_1_8(b_i_s[8],s_t[8],c_t[7],c_t2[8],s_t2[8]);
fa fau_1_9(b_i_s[9],s_t[9],c_t[8],c_t2[9],s_t2[9]);
fa fau_1_10(b_i_s[10],s_t[10],c_t[9],c_t2[10],s_t2[10]);
fa fau_1_11(b_i_s[11],s_t[11],c_t[10],c_t2[11],s_t2[11]);
fa fau_1_12(b_i_s[12],s_t[12],c_t[11],c_t2[12],s_t2[12]);
fa fau_1_13(b_i_s[13],s_t[13],c_t[12],c_t2[13],s_t2[13]);
fa fau_1_14(b_i_s[14],s_t[14],c_t[13],c_t2[14],s_t2[14]);
fa fau_1_15(b_i_s[15],s_t[15],c_t[14],c_t2[15],s_t2[15]);
fa fau_1_16(b_i_s[16],s_t[16],c_t[15],c_t2[16],s_t2[16]);
fa fau_1_17(b_i_s[17],s_t[17],c_t[16],c_t2[17],s_t2[17]);
fa fau_1_18(b_i_s[18],s_t[18],c_t[17],c_t2[18],s_t2[18]);
fa fau_1_19(b_i_s[19],s_t[19],c_t[18],c_t2[19],s_t2[19]);
fa fau_1_20(b_i_s[20],s_t[20],c_t[19],c_t2[20],s_t2[20]);
fa fau_1_21(b_i_s[21],s_t[21],c_t[20],c_t2[21],s_t2[21]);
fa fau_1_22(b_i_s[22],s_t[22],c_t[21],c_t2[22],s_t2[22]);
fa fau_1_23(b_i_s[23],s_t[23],c_t[22],c_t2[23],s_t2[23]);
fa fau_1_24(b_i_s[24],s_t[24],c_t[23],c_t2[24],s_t2[24]);
fa fau_1_25(b_i_s[25],s_t[25],c_t[24],c_t2[25],s_t2[25]);
fa fau_1_26(b_i_s[26],s_t[26],c_t[25],c_t2[26],s_t2[26]);
fa fau_1_27(b_i_s[27],s_t[27],c_t[26],c_t2[27],s_t2[27]);
fa fau_1_28(b_i_s[28],s_t[28],c_t[27],c_t2[28],s_t2[28]);
fa fau_1_29(b_i_s[29],s_t[29],c_t[28],c_t2[29],s_t2[29]);
fa fau_1_30(b_i_s[30],s_t[30],c_t[29],c_t2[30],s_t2[30]);
fa fau_1_31(b_i_s[31],s_t[31],c_t[30],c_t2[31],s_t2[31]);
fa fau_1_32(b_i_s[32],s_t[32],c_t[31],c_t2[32],s_t2[32]);
fa fau_1_33(b_i_s[33],s_t[33],c_t[32],c_t2[33],s_t2[33]);
fa fau_1_34(b_i_s[34],s_t[34],c_t[33],c_t2[34],s_t2[34]);
fa fau_1_35(b_i_s[35],s_t[35],c_t[34],c_t2[35],s_t2[35]);
fa fau_1_36(b_i_s[36],s_t[36],c_t[35],c_t2[36],s_t2[36]);
fa fau_1_37(b_i_s[37],s_t[37],c_t[36],c_t2[37],s_t2[37]);
fa fau_1_38(b_i_s[38],s_t[38],c_t[37],c_t2[38],s_t2[38]);
fa fau_1_39(b_i_s[39],s_t[39],c_t[38],c_t2[39],s_t2[39]);

fa fau_2(b_i_s[0],s_t[0],1'b0,c_t2[0],s_t2[0]);

assign c = {c_t2,1'b0};
assign s = {c_t[39],s_t2};

ha ha_red(c[39],s[39],ha_c,ha_s);
fa fa_red(c[40],s[40],ha_c,fa_c,fa_s);

assign M = {fa_c,fa_s,ha_s};

//LUT for assign corr_add depending on the value of p
add_40_lut add_40_lut_i(M,corr_add);

csa_40 csau({1'b0,c[38:0]},{1'b0,s[38:0]},corr_add,c_f,s_f);

assign c_o = c_f;
assign s_o = s_f;

endmodule
    