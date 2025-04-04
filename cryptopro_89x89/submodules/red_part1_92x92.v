
module red_part1_92x92(
    input [179:0] a_c,a_s,
    input [91:0] p_prime,
    output [8463:0] b_c,b_s // lines are appended together
);
    
wire [91:0] c_w_0, s_w_0;
wire [91:0] c_w_1, s_w_1;
wire [91:0] c_w_2, s_w_2;
wire [91:0] c_w_3, s_w_3;
wire [91:0] c_w_4, s_w_4;
wire [91:0] c_w_5, s_w_5;
wire [91:0] c_w_6, s_w_6;
wire [91:0] c_w_7, s_w_7;
wire [91:0] c_w_8, s_w_8;
wire [91:0] c_w_9, s_w_9;
wire [91:0] c_w_10, s_w_10;
wire [91:0] c_w_11, s_w_11;
wire [91:0] c_w_12, s_w_12;
wire [91:0] c_w_13, s_w_13;
wire [91:0] c_w_14, s_w_14;
wire [91:0] c_w_15, s_w_15;
wire [91:0] c_w_16, s_w_16;
wire [91:0] c_w_17, s_w_17;
wire [91:0] c_w_18, s_w_18;
wire [91:0] c_w_19, s_w_19;
wire [91:0] c_w_20, s_w_20;
wire [91:0] c_w_21, s_w_21;
wire [91:0] c_w_22, s_w_22;
wire [91:0] c_w_23, s_w_23;
wire [91:0] c_w_24, s_w_24;
wire [91:0] c_w_25, s_w_25;
wire [91:0] c_w_26, s_w_26;
wire [91:0] c_w_27, s_w_27;
wire [91:0] c_w_28, s_w_28;
wire [91:0] c_w_29, s_w_29;
wire [91:0] c_w_30, s_w_30;
wire [91:0] c_w_31, s_w_31;
wire [91:0] c_w_32, s_w_32;
wire [91:0] c_w_33, s_w_33;
wire [91:0] c_w_34, s_w_34;
wire [91:0] c_w_35, s_w_35;
wire [91:0] c_w_36, s_w_36;
wire [91:0] c_w_37, s_w_37;
wire [91:0] c_w_38, s_w_38;
wire [91:0] c_w_39, s_w_39;
wire [91:0] c_w_40, s_w_40;
wire [91:0] c_w_41, s_w_41;
wire [91:0] c_w_42, s_w_42;
wire [91:0] c_w_43, s_w_43;
wire [91:0] c_w_44, s_w_44;
wire [91:0] c_w_45, s_w_45;
wire [91:0] c_w_46, s_w_46;
wire [91:0] c_w_47, s_w_47;
wire [91:0] c_w_48, s_w_48;
wire [91:0] c_w_49, s_w_49;
wire [91:0] c_w_50, s_w_50;
wire [91:0] c_w_51, s_w_51;
wire [91:0] c_w_52, s_w_52;
wire [91:0] c_w_53, s_w_53;
wire [91:0] c_w_54, s_w_54;
wire [91:0] c_w_55, s_w_55;
wire [91:0] c_w_56, s_w_56;
wire [91:0] c_w_57, s_w_57;
wire [91:0] c_w_58, s_w_58;
wire [91:0] c_w_59, s_w_59;
wire [91:0] c_w_60, s_w_60;
wire [91:0] c_w_61, s_w_61;
wire [91:0] c_w_62, s_w_62;
wire [91:0] c_w_63, s_w_63;
wire [91:0] c_w_64, s_w_64;
wire [91:0] c_w_65, s_w_65;
wire [91:0] c_w_66, s_w_66;
wire [91:0] c_w_67, s_w_67;
wire [91:0] c_w_68, s_w_68;
wire [91:0] c_w_69, s_w_69;
wire [91:0] c_w_70, s_w_70;
wire [91:0] c_w_71, s_w_71;
wire [91:0] c_w_72, s_w_72;
wire [91:0] c_w_73, s_w_73;
wire [91:0] c_w_74, s_w_74;
wire [91:0] c_w_75, s_w_75;
wire [91:0] c_w_76, s_w_76;
wire [91:0] c_w_77, s_w_77;
wire [91:0] c_w_78, s_w_78;
wire [91:0] c_w_79, s_w_79;
wire [91:0] c_w_80, s_w_80;
wire [91:0] c_w_81, s_w_81;
wire [91:0] c_w_82, s_w_82;
wire [91:0] c_w_83, s_w_83;
wire [91:0] c_w_84, s_w_84;
wire [91:0] c_w_85, s_w_85;
wire [91:0] c_w_86, s_w_86;
wire [91:0] c_w_87, s_w_87;
wire [91:0] c_w_88, s_w_88;
wire [91:0] c_w_89, s_w_89;
wire [91:0] c_w_90, s_w_90;
wire [91:0] c_w_91, s_w_91;
    
AND_array_92 AND_array_92_c0({a_c[91:0]},p_prime[0],c_w_0);
AND_array_92 AND_array_92_s0({a_s[91:0]},p_prime[0],s_w_0);
AND_array_92 AND_array_92_c1({a_c[90:0],1'd0},p_prime[1],c_w_1);
AND_array_92 AND_array_92_s1({a_s[90:0],1'd0},p_prime[1],s_w_1);
AND_array_92 AND_array_92_c2({a_c[89:0],2'd0},p_prime[2],c_w_2);
AND_array_92 AND_array_92_s2({a_s[89:0],2'd0},p_prime[2],s_w_2);
AND_array_92 AND_array_92_c3({a_c[88:0],3'd0},p_prime[3],c_w_3);
AND_array_92 AND_array_92_s3({a_s[88:0],3'd0},p_prime[3],s_w_3);
AND_array_92 AND_array_92_c4({a_c[87:0],4'd0},p_prime[4],c_w_4);
AND_array_92 AND_array_92_s4({a_s[87:0],4'd0},p_prime[4],s_w_4);
AND_array_92 AND_array_92_c5({a_c[86:0],5'd0},p_prime[5],c_w_5);
AND_array_92 AND_array_92_s5({a_s[86:0],5'd0},p_prime[5],s_w_5);
AND_array_92 AND_array_92_c6({a_c[85:0],6'd0},p_prime[6],c_w_6);
AND_array_92 AND_array_92_s6({a_s[85:0],6'd0},p_prime[6],s_w_6);
AND_array_92 AND_array_92_c7({a_c[84:0],7'd0},p_prime[7],c_w_7);
AND_array_92 AND_array_92_s7({a_s[84:0],7'd0},p_prime[7],s_w_7);
AND_array_92 AND_array_92_c8({a_c[83:0],8'd0},p_prime[8],c_w_8);
AND_array_92 AND_array_92_s8({a_s[83:0],8'd0},p_prime[8],s_w_8);
AND_array_92 AND_array_92_c9({a_c[82:0],9'd0},p_prime[9],c_w_9);
AND_array_92 AND_array_92_s9({a_s[82:0],9'd0},p_prime[9],s_w_9);
AND_array_92 AND_array_92_c10({a_c[81:0],10'd0},p_prime[10],c_w_10);
AND_array_92 AND_array_92_s10({a_s[81:0],10'd0},p_prime[10],s_w_10);
AND_array_92 AND_array_92_c11({a_c[80:0],11'd0},p_prime[11],c_w_11);
AND_array_92 AND_array_92_s11({a_s[80:0],11'd0},p_prime[11],s_w_11);
AND_array_92 AND_array_92_c12({a_c[79:0],12'd0},p_prime[12],c_w_12);
AND_array_92 AND_array_92_s12({a_s[79:0],12'd0},p_prime[12],s_w_12);
AND_array_92 AND_array_92_c13({a_c[78:0],13'd0},p_prime[13],c_w_13);
AND_array_92 AND_array_92_s13({a_s[78:0],13'd0},p_prime[13],s_w_13);
AND_array_92 AND_array_92_c14({a_c[77:0],14'd0},p_prime[14],c_w_14);
AND_array_92 AND_array_92_s14({a_s[77:0],14'd0},p_prime[14],s_w_14);
AND_array_92 AND_array_92_c15({a_c[76:0],15'd0},p_prime[15],c_w_15);
AND_array_92 AND_array_92_s15({a_s[76:0],15'd0},p_prime[15],s_w_15);
AND_array_92 AND_array_92_c16({a_c[75:0],16'd0},p_prime[16],c_w_16);
AND_array_92 AND_array_92_s16({a_s[75:0],16'd0},p_prime[16],s_w_16);
AND_array_92 AND_array_92_c17({a_c[74:0],17'd0},p_prime[17],c_w_17);
AND_array_92 AND_array_92_s17({a_s[74:0],17'd0},p_prime[17],s_w_17);
AND_array_92 AND_array_92_c18({a_c[73:0],18'd0},p_prime[18],c_w_18);
AND_array_92 AND_array_92_s18({a_s[73:0],18'd0},p_prime[18],s_w_18);
AND_array_92 AND_array_92_c19({a_c[72:0],19'd0},p_prime[19],c_w_19);
AND_array_92 AND_array_92_s19({a_s[72:0],19'd0},p_prime[19],s_w_19);
AND_array_92 AND_array_92_c20({a_c[71:0],20'd0},p_prime[20],c_w_20);
AND_array_92 AND_array_92_s20({a_s[71:0],20'd0},p_prime[20],s_w_20);
AND_array_92 AND_array_92_c21({a_c[70:0],21'd0},p_prime[21],c_w_21);
AND_array_92 AND_array_92_s21({a_s[70:0],21'd0},p_prime[21],s_w_21);
AND_array_92 AND_array_92_c22({a_c[69:0],22'd0},p_prime[22],c_w_22);
AND_array_92 AND_array_92_s22({a_s[69:0],22'd0},p_prime[22],s_w_22);
AND_array_92 AND_array_92_c23({a_c[68:0],23'd0},p_prime[23],c_w_23);
AND_array_92 AND_array_92_s23({a_s[68:0],23'd0},p_prime[23],s_w_23);
AND_array_92 AND_array_92_c24({a_c[67:0],24'd0},p_prime[24],c_w_24);
AND_array_92 AND_array_92_s24({a_s[67:0],24'd0},p_prime[24],s_w_24);
AND_array_92 AND_array_92_c25({a_c[66:0],25'd0},p_prime[25],c_w_25);
AND_array_92 AND_array_92_s25({a_s[66:0],25'd0},p_prime[25],s_w_25);
AND_array_92 AND_array_92_c26({a_c[65:0],26'd0},p_prime[26],c_w_26);
AND_array_92 AND_array_92_s26({a_s[65:0],26'd0},p_prime[26],s_w_26);
AND_array_92 AND_array_92_c27({a_c[64:0],27'd0},p_prime[27],c_w_27);
AND_array_92 AND_array_92_s27({a_s[64:0],27'd0},p_prime[27],s_w_27);
AND_array_92 AND_array_92_c28({a_c[63:0],28'd0},p_prime[28],c_w_28);
AND_array_92 AND_array_92_s28({a_s[63:0],28'd0},p_prime[28],s_w_28);
AND_array_92 AND_array_92_c29({a_c[62:0],29'd0},p_prime[29],c_w_29);
AND_array_92 AND_array_92_s29({a_s[62:0],29'd0},p_prime[29],s_w_29);
AND_array_92 AND_array_92_c30({a_c[61:0],30'd0},p_prime[30],c_w_30);
AND_array_92 AND_array_92_s30({a_s[61:0],30'd0},p_prime[30],s_w_30);
AND_array_92 AND_array_92_c31({a_c[60:0],31'd0},p_prime[31],c_w_31);
AND_array_92 AND_array_92_s31({a_s[60:0],31'd0},p_prime[31],s_w_31);
AND_array_92 AND_array_92_c32({a_c[59:0],32'd0},p_prime[32],c_w_32);
AND_array_92 AND_array_92_s32({a_s[59:0],32'd0},p_prime[32],s_w_32);
AND_array_92 AND_array_92_c33({a_c[58:0],33'd0},p_prime[33],c_w_33);
AND_array_92 AND_array_92_s33({a_s[58:0],33'd0},p_prime[33],s_w_33);
AND_array_92 AND_array_92_c34({a_c[57:0],34'd0},p_prime[34],c_w_34);
AND_array_92 AND_array_92_s34({a_s[57:0],34'd0},p_prime[34],s_w_34);
AND_array_92 AND_array_92_c35({a_c[56:0],35'd0},p_prime[35],c_w_35);
AND_array_92 AND_array_92_s35({a_s[56:0],35'd0},p_prime[35],s_w_35);
AND_array_92 AND_array_92_c36({a_c[55:0],36'd0},p_prime[36],c_w_36);
AND_array_92 AND_array_92_s36({a_s[55:0],36'd0},p_prime[36],s_w_36);
AND_array_92 AND_array_92_c37({a_c[54:0],37'd0},p_prime[37],c_w_37);
AND_array_92 AND_array_92_s37({a_s[54:0],37'd0},p_prime[37],s_w_37);
AND_array_92 AND_array_92_c38({a_c[53:0],38'd0},p_prime[38],c_w_38);
AND_array_92 AND_array_92_s38({a_s[53:0],38'd0},p_prime[38],s_w_38);
AND_array_92 AND_array_92_c39({a_c[52:0],39'd0},p_prime[39],c_w_39);
AND_array_92 AND_array_92_s39({a_s[52:0],39'd0},p_prime[39],s_w_39);
AND_array_92 AND_array_92_c40({a_c[51:0],40'd0},p_prime[40],c_w_40);
AND_array_92 AND_array_92_s40({a_s[51:0],40'd0},p_prime[40],s_w_40);
AND_array_92 AND_array_92_c41({a_c[50:0],41'd0},p_prime[41],c_w_41);
AND_array_92 AND_array_92_s41({a_s[50:0],41'd0},p_prime[41],s_w_41);
AND_array_92 AND_array_92_c42({a_c[49:0],42'd0},p_prime[42],c_w_42);
AND_array_92 AND_array_92_s42({a_s[49:0],42'd0},p_prime[42],s_w_42);
AND_array_92 AND_array_92_c43({a_c[48:0],43'd0},p_prime[43],c_w_43);
AND_array_92 AND_array_92_s43({a_s[48:0],43'd0},p_prime[43],s_w_43);
AND_array_92 AND_array_92_c44({a_c[47:0],44'd0},p_prime[44],c_w_44);
AND_array_92 AND_array_92_s44({a_s[47:0],44'd0},p_prime[44],s_w_44);
AND_array_92 AND_array_92_c45({a_c[46:0],45'd0},p_prime[45],c_w_45);
AND_array_92 AND_array_92_s45({a_s[46:0],45'd0},p_prime[45],s_w_45);
AND_array_92 AND_array_92_c46({a_c[45:0],46'd0},p_prime[46],c_w_46);
AND_array_92 AND_array_92_s46({a_s[45:0],46'd0},p_prime[46],s_w_46);
AND_array_92 AND_array_92_c47({a_c[44:0],47'd0},p_prime[47],c_w_47);
AND_array_92 AND_array_92_s47({a_s[44:0],47'd0},p_prime[47],s_w_47);
AND_array_92 AND_array_92_c48({a_c[43:0],48'd0},p_prime[48],c_w_48);
AND_array_92 AND_array_92_s48({a_s[43:0],48'd0},p_prime[48],s_w_48);
AND_array_92 AND_array_92_c49({a_c[42:0],49'd0},p_prime[49],c_w_49);
AND_array_92 AND_array_92_s49({a_s[42:0],49'd0},p_prime[49],s_w_49);
AND_array_92 AND_array_92_c50({a_c[41:0],50'd0},p_prime[50],c_w_50);
AND_array_92 AND_array_92_s50({a_s[41:0],50'd0},p_prime[50],s_w_50);
AND_array_92 AND_array_92_c51({a_c[40:0],51'd0},p_prime[51],c_w_51);
AND_array_92 AND_array_92_s51({a_s[40:0],51'd0},p_prime[51],s_w_51);
AND_array_92 AND_array_92_c52({a_c[39:0],52'd0},p_prime[52],c_w_52);
AND_array_92 AND_array_92_s52({a_s[39:0],52'd0},p_prime[52],s_w_52);
AND_array_92 AND_array_92_c53({a_c[38:0],53'd0},p_prime[53],c_w_53);
AND_array_92 AND_array_92_s53({a_s[38:0],53'd0},p_prime[53],s_w_53);
AND_array_92 AND_array_92_c54({a_c[37:0],54'd0},p_prime[54],c_w_54);
AND_array_92 AND_array_92_s54({a_s[37:0],54'd0},p_prime[54],s_w_54);
AND_array_92 AND_array_92_c55({a_c[36:0],55'd0},p_prime[55],c_w_55);
AND_array_92 AND_array_92_s55({a_s[36:0],55'd0},p_prime[55],s_w_55);
AND_array_92 AND_array_92_c56({a_c[35:0],56'd0},p_prime[56],c_w_56);
AND_array_92 AND_array_92_s56({a_s[35:0],56'd0},p_prime[56],s_w_56);
AND_array_92 AND_array_92_c57({a_c[34:0],57'd0},p_prime[57],c_w_57);
AND_array_92 AND_array_92_s57({a_s[34:0],57'd0},p_prime[57],s_w_57);
AND_array_92 AND_array_92_c58({a_c[33:0],58'd0},p_prime[58],c_w_58);
AND_array_92 AND_array_92_s58({a_s[33:0],58'd0},p_prime[58],s_w_58);
AND_array_92 AND_array_92_c59({a_c[32:0],59'd0},p_prime[59],c_w_59);
AND_array_92 AND_array_92_s59({a_s[32:0],59'd0},p_prime[59],s_w_59);
AND_array_92 AND_array_92_c60({a_c[31:0],60'd0},p_prime[60],c_w_60);
AND_array_92 AND_array_92_s60({a_s[31:0],60'd0},p_prime[60],s_w_60);
AND_array_92 AND_array_92_c61({a_c[30:0],61'd0},p_prime[61],c_w_61);
AND_array_92 AND_array_92_s61({a_s[30:0],61'd0},p_prime[61],s_w_61);
AND_array_92 AND_array_92_c62({a_c[29:0],62'd0},p_prime[62],c_w_62);
AND_array_92 AND_array_92_s62({a_s[29:0],62'd0},p_prime[62],s_w_62);
AND_array_92 AND_array_92_c63({a_c[28:0],63'd0},p_prime[63],c_w_63);
AND_array_92 AND_array_92_s63({a_s[28:0],63'd0},p_prime[63],s_w_63);
AND_array_92 AND_array_92_c64({a_c[27:0],64'd0},p_prime[64],c_w_64);
AND_array_92 AND_array_92_s64({a_s[27:0],64'd0},p_prime[64],s_w_64);
AND_array_92 AND_array_92_c65({a_c[26:0],65'd0},p_prime[65],c_w_65);
AND_array_92 AND_array_92_s65({a_s[26:0],65'd0},p_prime[65],s_w_65);
AND_array_92 AND_array_92_c66({a_c[25:0],66'd0},p_prime[66],c_w_66);
AND_array_92 AND_array_92_s66({a_s[25:0],66'd0},p_prime[66],s_w_66);
AND_array_92 AND_array_92_c67({a_c[24:0],67'd0},p_prime[67],c_w_67);
AND_array_92 AND_array_92_s67({a_s[24:0],67'd0},p_prime[67],s_w_67);
AND_array_92 AND_array_92_c68({a_c[23:0],68'd0},p_prime[68],c_w_68);
AND_array_92 AND_array_92_s68({a_s[23:0],68'd0},p_prime[68],s_w_68);
AND_array_92 AND_array_92_c69({a_c[22:0],69'd0},p_prime[69],c_w_69);
AND_array_92 AND_array_92_s69({a_s[22:0],69'd0},p_prime[69],s_w_69);
AND_array_92 AND_array_92_c70({a_c[21:0],70'd0},p_prime[70],c_w_70);
AND_array_92 AND_array_92_s70({a_s[21:0],70'd0},p_prime[70],s_w_70);
AND_array_92 AND_array_92_c71({a_c[20:0],71'd0},p_prime[71],c_w_71);
AND_array_92 AND_array_92_s71({a_s[20:0],71'd0},p_prime[71],s_w_71);
AND_array_92 AND_array_92_c72({a_c[19:0],72'd0},p_prime[72],c_w_72);
AND_array_92 AND_array_92_s72({a_s[19:0],72'd0},p_prime[72],s_w_72);
AND_array_92 AND_array_92_c73({a_c[18:0],73'd0},p_prime[73],c_w_73);
AND_array_92 AND_array_92_s73({a_s[18:0],73'd0},p_prime[73],s_w_73);
AND_array_92 AND_array_92_c74({a_c[17:0],74'd0},p_prime[74],c_w_74);
AND_array_92 AND_array_92_s74({a_s[17:0],74'd0},p_prime[74],s_w_74);
AND_array_92 AND_array_92_c75({a_c[16:0],75'd0},p_prime[75],c_w_75);
AND_array_92 AND_array_92_s75({a_s[16:0],75'd0},p_prime[75],s_w_75);
AND_array_92 AND_array_92_c76({a_c[15:0],76'd0},p_prime[76],c_w_76);
AND_array_92 AND_array_92_s76({a_s[15:0],76'd0},p_prime[76],s_w_76);
AND_array_92 AND_array_92_c77({a_c[14:0],77'd0},p_prime[77],c_w_77);
AND_array_92 AND_array_92_s77({a_s[14:0],77'd0},p_prime[77],s_w_77);
AND_array_92 AND_array_92_c78({a_c[13:0],78'd0},p_prime[78],c_w_78);
AND_array_92 AND_array_92_s78({a_s[13:0],78'd0},p_prime[78],s_w_78);
AND_array_92 AND_array_92_c79({a_c[12:0],79'd0},p_prime[79],c_w_79);
AND_array_92 AND_array_92_s79({a_s[12:0],79'd0},p_prime[79],s_w_79);
AND_array_92 AND_array_92_c80({a_c[11:0],80'd0},p_prime[80],c_w_80);
AND_array_92 AND_array_92_s80({a_s[11:0],80'd0},p_prime[80],s_w_80);
AND_array_92 AND_array_92_c81({a_c[10:0],81'd0},p_prime[81],c_w_81);
AND_array_92 AND_array_92_s81({a_s[10:0],81'd0},p_prime[81],s_w_81);
AND_array_92 AND_array_92_c82({a_c[9:0],82'd0},p_prime[82],c_w_82);
AND_array_92 AND_array_92_s82({a_s[9:0],82'd0},p_prime[82],s_w_82);
AND_array_92 AND_array_92_c83({a_c[8:0],83'd0},p_prime[83],c_w_83);
AND_array_92 AND_array_92_s83({a_s[8:0],83'd0},p_prime[83],s_w_83);
AND_array_92 AND_array_92_c84({a_c[7:0],84'd0},p_prime[84],c_w_84);
AND_array_92 AND_array_92_s84({a_s[7:0],84'd0},p_prime[84],s_w_84);
AND_array_92 AND_array_92_c85({a_c[6:0],85'd0},p_prime[85],c_w_85);
AND_array_92 AND_array_92_s85({a_s[6:0],85'd0},p_prime[85],s_w_85);
AND_array_92 AND_array_92_c86({a_c[5:0],86'd0},p_prime[86],c_w_86);
AND_array_92 AND_array_92_s86({a_s[5:0],86'd0},p_prime[86],s_w_86);
AND_array_92 AND_array_92_c87({a_c[4:0],87'd0},p_prime[87],c_w_87);
AND_array_92 AND_array_92_s87({a_s[4:0],87'd0},p_prime[87],s_w_87);
AND_array_92 AND_array_92_c88({a_c[3:0],88'd0},p_prime[88],c_w_88);
AND_array_92 AND_array_92_s88({a_s[3:0],88'd0},p_prime[88],s_w_88);
AND_array_92 AND_array_92_c89({a_c[2:0],89'd0},p_prime[89],c_w_89);
AND_array_92 AND_array_92_s89({a_s[2:0],89'd0},p_prime[89],s_w_89);
AND_array_92 AND_array_92_c90({a_c[1:0],90'd0},p_prime[90],c_w_90);
AND_array_92 AND_array_92_s90({a_s[1:0],90'd0},p_prime[90],s_w_90);
AND_array_92 AND_array_92_c91({a_c[0:0],91'd0},p_prime[91],c_w_91);
AND_array_92 AND_array_92_s91({a_s[0:0],91'd0},p_prime[91],s_w_91);
    
assign b_c[91:0] = c_w_0;assign b_s[91:0] = s_w_0;
assign b_c[183:92] = c_w_1;assign b_s[183:92] = s_w_1;
assign b_c[275:184] = c_w_2;assign b_s[275:184] = s_w_2;
assign b_c[367:276] = c_w_3;assign b_s[367:276] = s_w_3;
assign b_c[459:368] = c_w_4;assign b_s[459:368] = s_w_4;
assign b_c[551:460] = c_w_5;assign b_s[551:460] = s_w_5;
assign b_c[643:552] = c_w_6;assign b_s[643:552] = s_w_6;
assign b_c[735:644] = c_w_7;assign b_s[735:644] = s_w_7;
assign b_c[827:736] = c_w_8;assign b_s[827:736] = s_w_8;
assign b_c[919:828] = c_w_9;assign b_s[919:828] = s_w_9;
assign b_c[1011:920] = c_w_10;assign b_s[1011:920] = s_w_10;
assign b_c[1103:1012] = c_w_11;assign b_s[1103:1012] = s_w_11;
assign b_c[1195:1104] = c_w_12;assign b_s[1195:1104] = s_w_12;
assign b_c[1287:1196] = c_w_13;assign b_s[1287:1196] = s_w_13;
assign b_c[1379:1288] = c_w_14;assign b_s[1379:1288] = s_w_14;
assign b_c[1471:1380] = c_w_15;assign b_s[1471:1380] = s_w_15;
assign b_c[1563:1472] = c_w_16;assign b_s[1563:1472] = s_w_16;
assign b_c[1655:1564] = c_w_17;assign b_s[1655:1564] = s_w_17;
assign b_c[1747:1656] = c_w_18;assign b_s[1747:1656] = s_w_18;
assign b_c[1839:1748] = c_w_19;assign b_s[1839:1748] = s_w_19;
assign b_c[1931:1840] = c_w_20;assign b_s[1931:1840] = s_w_20;
assign b_c[2023:1932] = c_w_21;assign b_s[2023:1932] = s_w_21;
assign b_c[2115:2024] = c_w_22;assign b_s[2115:2024] = s_w_22;
assign b_c[2207:2116] = c_w_23;assign b_s[2207:2116] = s_w_23;
assign b_c[2299:2208] = c_w_24;assign b_s[2299:2208] = s_w_24;
assign b_c[2391:2300] = c_w_25;assign b_s[2391:2300] = s_w_25;
assign b_c[2483:2392] = c_w_26;assign b_s[2483:2392] = s_w_26;
assign b_c[2575:2484] = c_w_27;assign b_s[2575:2484] = s_w_27;
assign b_c[2667:2576] = c_w_28;assign b_s[2667:2576] = s_w_28;
assign b_c[2759:2668] = c_w_29;assign b_s[2759:2668] = s_w_29;
assign b_c[2851:2760] = c_w_30;assign b_s[2851:2760] = s_w_30;
assign b_c[2943:2852] = c_w_31;assign b_s[2943:2852] = s_w_31;
assign b_c[3035:2944] = c_w_32;assign b_s[3035:2944] = s_w_32;
assign b_c[3127:3036] = c_w_33;assign b_s[3127:3036] = s_w_33;
assign b_c[3219:3128] = c_w_34;assign b_s[3219:3128] = s_w_34;
assign b_c[3311:3220] = c_w_35;assign b_s[3311:3220] = s_w_35;
assign b_c[3403:3312] = c_w_36;assign b_s[3403:3312] = s_w_36;
assign b_c[3495:3404] = c_w_37;assign b_s[3495:3404] = s_w_37;
assign b_c[3587:3496] = c_w_38;assign b_s[3587:3496] = s_w_38;
assign b_c[3679:3588] = c_w_39;assign b_s[3679:3588] = s_w_39;
assign b_c[3771:3680] = c_w_40;assign b_s[3771:3680] = s_w_40;
assign b_c[3863:3772] = c_w_41;assign b_s[3863:3772] = s_w_41;
assign b_c[3955:3864] = c_w_42;assign b_s[3955:3864] = s_w_42;
assign b_c[4047:3956] = c_w_43;assign b_s[4047:3956] = s_w_43;
assign b_c[4139:4048] = c_w_44;assign b_s[4139:4048] = s_w_44;
assign b_c[4231:4140] = c_w_45;assign b_s[4231:4140] = s_w_45;
assign b_c[4323:4232] = c_w_46;assign b_s[4323:4232] = s_w_46;
assign b_c[4415:4324] = c_w_47;assign b_s[4415:4324] = s_w_47;
assign b_c[4507:4416] = c_w_48;assign b_s[4507:4416] = s_w_48;
assign b_c[4599:4508] = c_w_49;assign b_s[4599:4508] = s_w_49;
assign b_c[4691:4600] = c_w_50;assign b_s[4691:4600] = s_w_50;
assign b_c[4783:4692] = c_w_51;assign b_s[4783:4692] = s_w_51;
assign b_c[4875:4784] = c_w_52;assign b_s[4875:4784] = s_w_52;
assign b_c[4967:4876] = c_w_53;assign b_s[4967:4876] = s_w_53;
assign b_c[5059:4968] = c_w_54;assign b_s[5059:4968] = s_w_54;
assign b_c[5151:5060] = c_w_55;assign b_s[5151:5060] = s_w_55;
assign b_c[5243:5152] = c_w_56;assign b_s[5243:5152] = s_w_56;
assign b_c[5335:5244] = c_w_57;assign b_s[5335:5244] = s_w_57;
assign b_c[5427:5336] = c_w_58;assign b_s[5427:5336] = s_w_58;
assign b_c[5519:5428] = c_w_59;assign b_s[5519:5428] = s_w_59;
assign b_c[5611:5520] = c_w_60;assign b_s[5611:5520] = s_w_60;
assign b_c[5703:5612] = c_w_61;assign b_s[5703:5612] = s_w_61;
assign b_c[5795:5704] = c_w_62;assign b_s[5795:5704] = s_w_62;
assign b_c[5887:5796] = c_w_63;assign b_s[5887:5796] = s_w_63;
assign b_c[5979:5888] = c_w_64;assign b_s[5979:5888] = s_w_64;
assign b_c[6071:5980] = c_w_65;assign b_s[6071:5980] = s_w_65;
assign b_c[6163:6072] = c_w_66;assign b_s[6163:6072] = s_w_66;
assign b_c[6255:6164] = c_w_67;assign b_s[6255:6164] = s_w_67;
assign b_c[6347:6256] = c_w_68;assign b_s[6347:6256] = s_w_68;
assign b_c[6439:6348] = c_w_69;assign b_s[6439:6348] = s_w_69;
assign b_c[6531:6440] = c_w_70;assign b_s[6531:6440] = s_w_70;
assign b_c[6623:6532] = c_w_71;assign b_s[6623:6532] = s_w_71;
assign b_c[6715:6624] = c_w_72;assign b_s[6715:6624] = s_w_72;
assign b_c[6807:6716] = c_w_73;assign b_s[6807:6716] = s_w_73;
assign b_c[6899:6808] = c_w_74;assign b_s[6899:6808] = s_w_74;
assign b_c[6991:6900] = c_w_75;assign b_s[6991:6900] = s_w_75;
assign b_c[7083:6992] = c_w_76;assign b_s[7083:6992] = s_w_76;
assign b_c[7175:7084] = c_w_77;assign b_s[7175:7084] = s_w_77;
assign b_c[7267:7176] = c_w_78;assign b_s[7267:7176] = s_w_78;
assign b_c[7359:7268] = c_w_79;assign b_s[7359:7268] = s_w_79;
assign b_c[7451:7360] = c_w_80;assign b_s[7451:7360] = s_w_80;
assign b_c[7543:7452] = c_w_81;assign b_s[7543:7452] = s_w_81;
assign b_c[7635:7544] = c_w_82;assign b_s[7635:7544] = s_w_82;
assign b_c[7727:7636] = c_w_83;assign b_s[7727:7636] = s_w_83;
assign b_c[7819:7728] = c_w_84;assign b_s[7819:7728] = s_w_84;
assign b_c[7911:7820] = c_w_85;assign b_s[7911:7820] = s_w_85;
assign b_c[8003:7912] = c_w_86;assign b_s[8003:7912] = s_w_86;
assign b_c[8095:8004] = c_w_87;assign b_s[8095:8004] = s_w_87;
assign b_c[8187:8096] = c_w_88;assign b_s[8187:8096] = s_w_88;
assign b_c[8279:8188] = c_w_89;assign b_s[8279:8188] = s_w_89;
assign b_c[8371:8280] = c_w_90;assign b_s[8371:8280] = s_w_90;
assign b_c[8463:8372] = c_w_91;assign b_s[8463:8372] = s_w_91;
    
endmodule
    