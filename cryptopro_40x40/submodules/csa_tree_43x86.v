

module csa_tree_43x86(
    input [3697:0] A, // lines are appended together
    output[85:0] B_0,
    output[85:0] B_1
);

wire [2493:0] tree_1;
wire [1719:0] tree_2;
wire [1203:0] tree_3;
wire [859:0] tree_4;
wire [601:0] tree_5;
wire [429:0] tree_6;
wire [343:0] tree_7;
wire [257:0] tree_8;
wire [171:0] tree_9;
// layer-1
csa_86 csau_86_i0(A[85:0],A[171:86],A[257:172],tree_1[85:0],tree_1[171:86]);
csa_86 csau_86_i1(A[343:258],A[429:344],A[515:430],tree_1[257:172],tree_1[343:258]);
csa_86 csau_86_i2(A[601:516],A[687:602],A[773:688],tree_1[429:344],tree_1[515:430]);
csa_86 csau_86_i3(A[859:774],A[945:860],A[1031:946],tree_1[601:516],tree_1[687:602]);
csa_86 csau_86_i4(A[1117:1032],A[1203:1118],A[1289:1204],tree_1[773:688],tree_1[859:774]);
csa_86 csau_86_i5(A[1375:1290],A[1461:1376],A[1547:1462],tree_1[945:860],tree_1[1031:946]);
csa_86 csau_86_i6(A[1633:1548],A[1719:1634],A[1805:1720],tree_1[1117:1032],tree_1[1203:1118]);
csa_86 csau_86_i7(A[1891:1806],A[1977:1892],A[2063:1978],tree_1[1289:1204],tree_1[1375:1290]);
csa_86 csau_86_i8(A[2149:2064],A[2235:2150],A[2321:2236],tree_1[1461:1376],tree_1[1547:1462]);
csa_86 csau_86_i9(A[2407:2322],A[2493:2408],A[2579:2494],tree_1[1633:1548],tree_1[1719:1634]);
csa_86 csau_86_i10(A[2665:2580],A[2751:2666],A[2837:2752],tree_1[1805:1720],tree_1[1891:1806]);
csa_86 csau_86_i11(A[2923:2838],A[3009:2924],A[3095:3010],tree_1[1977:1892],tree_1[2063:1978]);
csa_86 csau_86_i12(A[3181:3096],A[3267:3182],A[3353:3268],tree_1[2149:2064],tree_1[2235:2150]);
csa_86 csau_86_i13(A[3439:3354],A[3525:3440],A[3611:3526],tree_1[2321:2236],tree_1[2407:2322]);
assign tree_1[2493:2408] = A[3697:3612];
// layer-2
csa_86 csau_86_i14(tree_1[85:0],tree_1[171:86],tree_1[257:172],tree_2[85:0],tree_2[171:86]);
csa_86 csau_86_i15(tree_1[343:258],tree_1[429:344],tree_1[515:430],tree_2[257:172],tree_2[343:258]);
csa_86 csau_86_i16(tree_1[601:516],tree_1[687:602],tree_1[773:688],tree_2[429:344],tree_2[515:430]);
csa_86 csau_86_i17(tree_1[859:774],tree_1[945:860],tree_1[1031:946],tree_2[601:516],tree_2[687:602]);
csa_86 csau_86_i18(tree_1[1117:1032],tree_1[1203:1118],tree_1[1289:1204],tree_2[773:688],tree_2[859:774]);
csa_86 csau_86_i19(tree_1[1375:1290],tree_1[1461:1376],tree_1[1547:1462],tree_2[945:860],tree_2[1031:946]);
csa_86 csau_86_i20(tree_1[1633:1548],tree_1[1719:1634],tree_1[1805:1720],tree_2[1117:1032],tree_2[1203:1118]);
csa_86 csau_86_i21(tree_1[1891:1806],tree_1[1977:1892],tree_1[2063:1978],tree_2[1289:1204],tree_2[1375:1290]);
csa_86 csau_86_i22(tree_1[2149:2064],tree_1[2235:2150],tree_1[2321:2236],tree_2[1461:1376],tree_2[1547:1462]);
assign tree_2[1633:1548] = tree_1[2407:2322];
assign tree_2[1719:1634] = tree_1[2493:2408];
// layer-3
csa_86 csau_86_i23(tree_2[85:0],tree_2[171:86],tree_2[257:172],tree_3[85:0],tree_3[171:86]);
csa_86 csau_86_i24(tree_2[343:258],tree_2[429:344],tree_2[515:430],tree_3[257:172],tree_3[343:258]);
csa_86 csau_86_i25(tree_2[601:516],tree_2[687:602],tree_2[773:688],tree_3[429:344],tree_3[515:430]);
csa_86 csau_86_i26(tree_2[859:774],tree_2[945:860],tree_2[1031:946],tree_3[601:516],tree_3[687:602]);
csa_86 csau_86_i27(tree_2[1117:1032],tree_2[1203:1118],tree_2[1289:1204],tree_3[773:688],tree_3[859:774]);
csa_86 csau_86_i28(tree_2[1375:1290],tree_2[1461:1376],tree_2[1547:1462],tree_3[945:860],tree_3[1031:946]);
assign tree_3[1117:1032] = tree_2[1633:1548];
assign tree_3[1203:1118] = tree_2[1719:1634];
// layer-4
csa_86 csau_86_i29(tree_3[85:0],tree_3[171:86],tree_3[257:172],tree_4[85:0],tree_4[171:86]);
csa_86 csau_86_i30(tree_3[343:258],tree_3[429:344],tree_3[515:430],tree_4[257:172],tree_4[343:258]);
csa_86 csau_86_i31(tree_3[601:516],tree_3[687:602],tree_3[773:688],tree_4[429:344],tree_4[515:430]);
csa_86 csau_86_i32(tree_3[859:774],tree_3[945:860],tree_3[1031:946],tree_4[601:516],tree_4[687:602]);
assign tree_4[773:688] = tree_3[1117:1032];
assign tree_4[859:774] = tree_3[1203:1118];
// layer-5
csa_86 csau_86_i33(tree_4[85:0],tree_4[171:86],tree_4[257:172],tree_5[85:0],tree_5[171:86]);
csa_86 csau_86_i34(tree_4[343:258],tree_4[429:344],tree_4[515:430],tree_5[257:172],tree_5[343:258]);
csa_86 csau_86_i35(tree_4[601:516],tree_4[687:602],tree_4[773:688],tree_5[429:344],tree_5[515:430]);
assign tree_5[601:516] = tree_4[859:774];
// layer-6
csa_86 csau_86_i36(tree_5[85:0],tree_5[171:86],tree_5[257:172],tree_6[85:0],tree_6[171:86]);
csa_86 csau_86_i37(tree_5[343:258],tree_5[429:344],tree_5[515:430],tree_6[257:172],tree_6[343:258]);
assign tree_6[429:344] = tree_5[601:516];
// layer-7
csa_86 csau_86_i38(tree_6[85:0],tree_6[171:86],tree_6[257:172],tree_7[85:0],tree_7[171:86]);
assign tree_7[257:172] = tree_6[343:258];
assign tree_7[343:258] = tree_6[429:344];
// layer-8
csa_86 csau_86_i39(tree_7[85:0],tree_7[171:86],tree_7[257:172],tree_8[85:0],tree_8[171:86]);
assign tree_8[257:172] = tree_7[343:258];
// layer-9
csa_86 csau_86_i40(tree_8[85:0],tree_8[171:86],tree_8[257:172],tree_9[85:0],tree_9[171:86]);

// final assignment
assign B_0 = tree_9[85:0];
assign B_1 = tree_9[171:86];

endmodule
