
module AND_matrix_40x40(
    input [39:0] a,
    input [39:0] b,
    output [3199:0] c // lines are appended together
);
    
wire [39:0] c_w_0;
wire [39:0] c_w_1;
wire [39:0] c_w_2;
wire [39:0] c_w_3;
wire [39:0] c_w_4;
wire [39:0] c_w_5;
wire [39:0] c_w_6;
wire [39:0] c_w_7;
wire [39:0] c_w_8;
wire [39:0] c_w_9;
wire [39:0] c_w_10;
wire [39:0] c_w_11;
wire [39:0] c_w_12;
wire [39:0] c_w_13;
wire [39:0] c_w_14;
wire [39:0] c_w_15;
wire [39:0] c_w_16;
wire [39:0] c_w_17;
wire [39:0] c_w_18;
wire [39:0] c_w_19;
wire [39:0] c_w_20;
wire [39:0] c_w_21;
wire [39:0] c_w_22;
wire [39:0] c_w_23;
wire [39:0] c_w_24;
wire [39:0] c_w_25;
wire [39:0] c_w_26;
wire [39:0] c_w_27;
wire [39:0] c_w_28;
wire [39:0] c_w_29;
wire [39:0] c_w_30;
wire [39:0] c_w_31;
wire [39:0] c_w_32;
wire [39:0] c_w_33;
wire [39:0] c_w_34;
wire [39:0] c_w_35;
wire [39:0] c_w_36;
wire [39:0] c_w_37;
wire [39:0] c_w_38;
wire [39:0] c_w_39;
    
AND_array_40 AND_array_40_i0(a,b[0],c_w_0);
AND_array_40 AND_array_40_i1(a,b[1],c_w_1);
AND_array_40 AND_array_40_i2(a,b[2],c_w_2);
AND_array_40 AND_array_40_i3(a,b[3],c_w_3);
AND_array_40 AND_array_40_i4(a,b[4],c_w_4);
AND_array_40 AND_array_40_i5(a,b[5],c_w_5);
AND_array_40 AND_array_40_i6(a,b[6],c_w_6);
AND_array_40 AND_array_40_i7(a,b[7],c_w_7);
AND_array_40 AND_array_40_i8(a,b[8],c_w_8);
AND_array_40 AND_array_40_i9(a,b[9],c_w_9);
AND_array_40 AND_array_40_i10(a,b[10],c_w_10);
AND_array_40 AND_array_40_i11(a,b[11],c_w_11);
AND_array_40 AND_array_40_i12(a,b[12],c_w_12);
AND_array_40 AND_array_40_i13(a,b[13],c_w_13);
AND_array_40 AND_array_40_i14(a,b[14],c_w_14);
AND_array_40 AND_array_40_i15(a,b[15],c_w_15);
AND_array_40 AND_array_40_i16(a,b[16],c_w_16);
AND_array_40 AND_array_40_i17(a,b[17],c_w_17);
AND_array_40 AND_array_40_i18(a,b[18],c_w_18);
AND_array_40 AND_array_40_i19(a,b[19],c_w_19);
AND_array_40 AND_array_40_i20(a,b[20],c_w_20);
AND_array_40 AND_array_40_i21(a,b[21],c_w_21);
AND_array_40 AND_array_40_i22(a,b[22],c_w_22);
AND_array_40 AND_array_40_i23(a,b[23],c_w_23);
AND_array_40 AND_array_40_i24(a,b[24],c_w_24);
AND_array_40 AND_array_40_i25(a,b[25],c_w_25);
AND_array_40 AND_array_40_i26(a,b[26],c_w_26);
AND_array_40 AND_array_40_i27(a,b[27],c_w_27);
AND_array_40 AND_array_40_i28(a,b[28],c_w_28);
AND_array_40 AND_array_40_i29(a,b[29],c_w_29);
AND_array_40 AND_array_40_i30(a,b[30],c_w_30);
AND_array_40 AND_array_40_i31(a,b[31],c_w_31);
AND_array_40 AND_array_40_i32(a,b[32],c_w_32);
AND_array_40 AND_array_40_i33(a,b[33],c_w_33);
AND_array_40 AND_array_40_i34(a,b[34],c_w_34);
AND_array_40 AND_array_40_i35(a,b[35],c_w_35);
AND_array_40 AND_array_40_i36(a,b[36],c_w_36);
AND_array_40 AND_array_40_i37(a,b[37],c_w_37);
AND_array_40 AND_array_40_i38(a,b[38],c_w_38);
AND_array_40 AND_array_40_i39(a,b[39],c_w_39);
    
assign c[79:0] = {40'b0,c_w_0};
assign c[159:80] = {39'b0,c_w_1,1'b0};
assign c[239:160] = {38'b0,c_w_2,2'b0};
assign c[319:240] = {37'b0,c_w_3,3'b0};
assign c[399:320] = {36'b0,c_w_4,4'b0};
assign c[479:400] = {35'b0,c_w_5,5'b0};
assign c[559:480] = {34'b0,c_w_6,6'b0};
assign c[639:560] = {33'b0,c_w_7,7'b0};
assign c[719:640] = {32'b0,c_w_8,8'b0};
assign c[799:720] = {31'b0,c_w_9,9'b0};
assign c[879:800] = {30'b0,c_w_10,10'b0};
assign c[959:880] = {29'b0,c_w_11,11'b0};
assign c[1039:960] = {28'b0,c_w_12,12'b0};
assign c[1119:1040] = {27'b0,c_w_13,13'b0};
assign c[1199:1120] = {26'b0,c_w_14,14'b0};
assign c[1279:1200] = {25'b0,c_w_15,15'b0};
assign c[1359:1280] = {24'b0,c_w_16,16'b0};
assign c[1439:1360] = {23'b0,c_w_17,17'b0};
assign c[1519:1440] = {22'b0,c_w_18,18'b0};
assign c[1599:1520] = {21'b0,c_w_19,19'b0};
assign c[1679:1600] = {20'b0,c_w_20,20'b0};
assign c[1759:1680] = {19'b0,c_w_21,21'b0};
assign c[1839:1760] = {18'b0,c_w_22,22'b0};
assign c[1919:1840] = {17'b0,c_w_23,23'b0};
assign c[1999:1920] = {16'b0,c_w_24,24'b0};
assign c[2079:2000] = {15'b0,c_w_25,25'b0};
assign c[2159:2080] = {14'b0,c_w_26,26'b0};
assign c[2239:2160] = {13'b0,c_w_27,27'b0};
assign c[2319:2240] = {12'b0,c_w_28,28'b0};
assign c[2399:2320] = {11'b0,c_w_29,29'b0};
assign c[2479:2400] = {10'b0,c_w_30,30'b0};
assign c[2559:2480] = {9'b0,c_w_31,31'b0};
assign c[2639:2560] = {8'b0,c_w_32,32'b0};
assign c[2719:2640] = {7'b0,c_w_33,33'b0};
assign c[2799:2720] = {6'b0,c_w_34,34'b0};
assign c[2879:2800] = {5'b0,c_w_35,35'b0};
assign c[2959:2880] = {4'b0,c_w_36,36'b0};
assign c[3039:2960] = {3'b0,c_w_37,37'b0};
assign c[3119:3040] = {2'b0,c_w_38,38'b0};
assign c[3199:3120] = {1'b0,c_w_39,39'b0};
    
endmodule
    