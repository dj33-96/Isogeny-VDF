
module add_89(
    input [88:0] a_i_c,a_i_s,
    input [88:0] b_i_c,b_i_s,
    output [88:0] c_o,
    output [88:0] s_o
);

wire [88:0] p;
assign p = 89'h19f393cffffffffffffffff;

wire ha_c,ha_s,fa_c,fa_s;
wire [2:0] M;
wire [88:0] c_t,s_t,c_t2,s_t2;
wire [88:0] c_f,s_f;
wire [88:0] corr_add;
wire [89:0] c,s;

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
fa fau_0_40(a_i_c[40],a_i_s[40],b_i_c[40],c_t[40],s_t[40]);
fa fau_0_41(a_i_c[41],a_i_s[41],b_i_c[41],c_t[41],s_t[41]);
fa fau_0_42(a_i_c[42],a_i_s[42],b_i_c[42],c_t[42],s_t[42]);
fa fau_0_43(a_i_c[43],a_i_s[43],b_i_c[43],c_t[43],s_t[43]);
fa fau_0_44(a_i_c[44],a_i_s[44],b_i_c[44],c_t[44],s_t[44]);
fa fau_0_45(a_i_c[45],a_i_s[45],b_i_c[45],c_t[45],s_t[45]);
fa fau_0_46(a_i_c[46],a_i_s[46],b_i_c[46],c_t[46],s_t[46]);
fa fau_0_47(a_i_c[47],a_i_s[47],b_i_c[47],c_t[47],s_t[47]);
fa fau_0_48(a_i_c[48],a_i_s[48],b_i_c[48],c_t[48],s_t[48]);
fa fau_0_49(a_i_c[49],a_i_s[49],b_i_c[49],c_t[49],s_t[49]);
fa fau_0_50(a_i_c[50],a_i_s[50],b_i_c[50],c_t[50],s_t[50]);
fa fau_0_51(a_i_c[51],a_i_s[51],b_i_c[51],c_t[51],s_t[51]);
fa fau_0_52(a_i_c[52],a_i_s[52],b_i_c[52],c_t[52],s_t[52]);
fa fau_0_53(a_i_c[53],a_i_s[53],b_i_c[53],c_t[53],s_t[53]);
fa fau_0_54(a_i_c[54],a_i_s[54],b_i_c[54],c_t[54],s_t[54]);
fa fau_0_55(a_i_c[55],a_i_s[55],b_i_c[55],c_t[55],s_t[55]);
fa fau_0_56(a_i_c[56],a_i_s[56],b_i_c[56],c_t[56],s_t[56]);
fa fau_0_57(a_i_c[57],a_i_s[57],b_i_c[57],c_t[57],s_t[57]);
fa fau_0_58(a_i_c[58],a_i_s[58],b_i_c[58],c_t[58],s_t[58]);
fa fau_0_59(a_i_c[59],a_i_s[59],b_i_c[59],c_t[59],s_t[59]);
fa fau_0_60(a_i_c[60],a_i_s[60],b_i_c[60],c_t[60],s_t[60]);
fa fau_0_61(a_i_c[61],a_i_s[61],b_i_c[61],c_t[61],s_t[61]);
fa fau_0_62(a_i_c[62],a_i_s[62],b_i_c[62],c_t[62],s_t[62]);
fa fau_0_63(a_i_c[63],a_i_s[63],b_i_c[63],c_t[63],s_t[63]);
fa fau_0_64(a_i_c[64],a_i_s[64],b_i_c[64],c_t[64],s_t[64]);
fa fau_0_65(a_i_c[65],a_i_s[65],b_i_c[65],c_t[65],s_t[65]);
fa fau_0_66(a_i_c[66],a_i_s[66],b_i_c[66],c_t[66],s_t[66]);
fa fau_0_67(a_i_c[67],a_i_s[67],b_i_c[67],c_t[67],s_t[67]);
fa fau_0_68(a_i_c[68],a_i_s[68],b_i_c[68],c_t[68],s_t[68]);
fa fau_0_69(a_i_c[69],a_i_s[69],b_i_c[69],c_t[69],s_t[69]);
fa fau_0_70(a_i_c[70],a_i_s[70],b_i_c[70],c_t[70],s_t[70]);
fa fau_0_71(a_i_c[71],a_i_s[71],b_i_c[71],c_t[71],s_t[71]);
fa fau_0_72(a_i_c[72],a_i_s[72],b_i_c[72],c_t[72],s_t[72]);
fa fau_0_73(a_i_c[73],a_i_s[73],b_i_c[73],c_t[73],s_t[73]);
fa fau_0_74(a_i_c[74],a_i_s[74],b_i_c[74],c_t[74],s_t[74]);
fa fau_0_75(a_i_c[75],a_i_s[75],b_i_c[75],c_t[75],s_t[75]);
fa fau_0_76(a_i_c[76],a_i_s[76],b_i_c[76],c_t[76],s_t[76]);
fa fau_0_77(a_i_c[77],a_i_s[77],b_i_c[77],c_t[77],s_t[77]);
fa fau_0_78(a_i_c[78],a_i_s[78],b_i_c[78],c_t[78],s_t[78]);
fa fau_0_79(a_i_c[79],a_i_s[79],b_i_c[79],c_t[79],s_t[79]);
fa fau_0_80(a_i_c[80],a_i_s[80],b_i_c[80],c_t[80],s_t[80]);
fa fau_0_81(a_i_c[81],a_i_s[81],b_i_c[81],c_t[81],s_t[81]);
fa fau_0_82(a_i_c[82],a_i_s[82],b_i_c[82],c_t[82],s_t[82]);
fa fau_0_83(a_i_c[83],a_i_s[83],b_i_c[83],c_t[83],s_t[83]);
fa fau_0_84(a_i_c[84],a_i_s[84],b_i_c[84],c_t[84],s_t[84]);
fa fau_0_85(a_i_c[85],a_i_s[85],b_i_c[85],c_t[85],s_t[85]);
fa fau_0_86(a_i_c[86],a_i_s[86],b_i_c[86],c_t[86],s_t[86]);
fa fau_0_87(a_i_c[87],a_i_s[87],b_i_c[87],c_t[87],s_t[87]);
fa fau_0_88(a_i_c[88],a_i_s[88],b_i_c[88],c_t[88],s_t[88]);
    
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
fa fau_1_40(b_i_s[40],s_t[40],c_t[39],c_t2[40],s_t2[40]);
fa fau_1_41(b_i_s[41],s_t[41],c_t[40],c_t2[41],s_t2[41]);
fa fau_1_42(b_i_s[42],s_t[42],c_t[41],c_t2[42],s_t2[42]);
fa fau_1_43(b_i_s[43],s_t[43],c_t[42],c_t2[43],s_t2[43]);
fa fau_1_44(b_i_s[44],s_t[44],c_t[43],c_t2[44],s_t2[44]);
fa fau_1_45(b_i_s[45],s_t[45],c_t[44],c_t2[45],s_t2[45]);
fa fau_1_46(b_i_s[46],s_t[46],c_t[45],c_t2[46],s_t2[46]);
fa fau_1_47(b_i_s[47],s_t[47],c_t[46],c_t2[47],s_t2[47]);
fa fau_1_48(b_i_s[48],s_t[48],c_t[47],c_t2[48],s_t2[48]);
fa fau_1_49(b_i_s[49],s_t[49],c_t[48],c_t2[49],s_t2[49]);
fa fau_1_50(b_i_s[50],s_t[50],c_t[49],c_t2[50],s_t2[50]);
fa fau_1_51(b_i_s[51],s_t[51],c_t[50],c_t2[51],s_t2[51]);
fa fau_1_52(b_i_s[52],s_t[52],c_t[51],c_t2[52],s_t2[52]);
fa fau_1_53(b_i_s[53],s_t[53],c_t[52],c_t2[53],s_t2[53]);
fa fau_1_54(b_i_s[54],s_t[54],c_t[53],c_t2[54],s_t2[54]);
fa fau_1_55(b_i_s[55],s_t[55],c_t[54],c_t2[55],s_t2[55]);
fa fau_1_56(b_i_s[56],s_t[56],c_t[55],c_t2[56],s_t2[56]);
fa fau_1_57(b_i_s[57],s_t[57],c_t[56],c_t2[57],s_t2[57]);
fa fau_1_58(b_i_s[58],s_t[58],c_t[57],c_t2[58],s_t2[58]);
fa fau_1_59(b_i_s[59],s_t[59],c_t[58],c_t2[59],s_t2[59]);
fa fau_1_60(b_i_s[60],s_t[60],c_t[59],c_t2[60],s_t2[60]);
fa fau_1_61(b_i_s[61],s_t[61],c_t[60],c_t2[61],s_t2[61]);
fa fau_1_62(b_i_s[62],s_t[62],c_t[61],c_t2[62],s_t2[62]);
fa fau_1_63(b_i_s[63],s_t[63],c_t[62],c_t2[63],s_t2[63]);
fa fau_1_64(b_i_s[64],s_t[64],c_t[63],c_t2[64],s_t2[64]);
fa fau_1_65(b_i_s[65],s_t[65],c_t[64],c_t2[65],s_t2[65]);
fa fau_1_66(b_i_s[66],s_t[66],c_t[65],c_t2[66],s_t2[66]);
fa fau_1_67(b_i_s[67],s_t[67],c_t[66],c_t2[67],s_t2[67]);
fa fau_1_68(b_i_s[68],s_t[68],c_t[67],c_t2[68],s_t2[68]);
fa fau_1_69(b_i_s[69],s_t[69],c_t[68],c_t2[69],s_t2[69]);
fa fau_1_70(b_i_s[70],s_t[70],c_t[69],c_t2[70],s_t2[70]);
fa fau_1_71(b_i_s[71],s_t[71],c_t[70],c_t2[71],s_t2[71]);
fa fau_1_72(b_i_s[72],s_t[72],c_t[71],c_t2[72],s_t2[72]);
fa fau_1_73(b_i_s[73],s_t[73],c_t[72],c_t2[73],s_t2[73]);
fa fau_1_74(b_i_s[74],s_t[74],c_t[73],c_t2[74],s_t2[74]);
fa fau_1_75(b_i_s[75],s_t[75],c_t[74],c_t2[75],s_t2[75]);
fa fau_1_76(b_i_s[76],s_t[76],c_t[75],c_t2[76],s_t2[76]);
fa fau_1_77(b_i_s[77],s_t[77],c_t[76],c_t2[77],s_t2[77]);
fa fau_1_78(b_i_s[78],s_t[78],c_t[77],c_t2[78],s_t2[78]);
fa fau_1_79(b_i_s[79],s_t[79],c_t[78],c_t2[79],s_t2[79]);
fa fau_1_80(b_i_s[80],s_t[80],c_t[79],c_t2[80],s_t2[80]);
fa fau_1_81(b_i_s[81],s_t[81],c_t[80],c_t2[81],s_t2[81]);
fa fau_1_82(b_i_s[82],s_t[82],c_t[81],c_t2[82],s_t2[82]);
fa fau_1_83(b_i_s[83],s_t[83],c_t[82],c_t2[83],s_t2[83]);
fa fau_1_84(b_i_s[84],s_t[84],c_t[83],c_t2[84],s_t2[84]);
fa fau_1_85(b_i_s[85],s_t[85],c_t[84],c_t2[85],s_t2[85]);
fa fau_1_86(b_i_s[86],s_t[86],c_t[85],c_t2[86],s_t2[86]);
fa fau_1_87(b_i_s[87],s_t[87],c_t[86],c_t2[87],s_t2[87]);
fa fau_1_88(b_i_s[88],s_t[88],c_t[87],c_t2[88],s_t2[88]);

fa fau_2(b_i_s[0],s_t[0],1'b0,c_t2[0],s_t2[0]);

assign c = {c_t2,1'b0};
assign s = {c_t[88],s_t2};

ha ha_red(c[88],s[88],ha_c,ha_s);
fa fa_red(c[89],s[89],ha_c,fa_c,fa_s);

assign M = {fa_c,fa_s,ha_s};

//LUT for assign corr_add depending on the value of p
add_89_lut add_89_lut_i(M,corr_add);

csa_89 csau({1'b0,c[87:0]},{1'b0,s[87:0]},corr_add,c_f,s_f);

assign c_o = c_f;
assign s_o = s_f;

endmodule
    