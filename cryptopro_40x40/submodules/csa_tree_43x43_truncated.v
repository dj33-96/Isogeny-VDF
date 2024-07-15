

module csa_tree_43x43_truncated(
    input [1848:0] A, // lines are appended together
    output[42:0] B_0,
    output[42:0] B_1
);

wire [1246:0] tree_1;
wire [859:0] tree_2;
wire [601:0] tree_3;
wire [429:0] tree_4;
wire [300:0] tree_5;
wire [214:0] tree_6;
wire [171:0] tree_7;
wire [128:0] tree_8;
wire [85:0] tree_9;
// layer-1
csa_43 csau_43_i0(A[42:0],A[85:43],A[128:86],tree_1[42:0],tree_1[85:43]);
csa_43 csau_43_i1(A[171:129],A[214:172],A[257:215],tree_1[128:86],tree_1[171:129]);
csa_43 csau_43_i2(A[300:258],A[343:301],A[386:344],tree_1[214:172],tree_1[257:215]);
csa_43 csau_43_i3(A[429:387],A[472:430],A[515:473],tree_1[300:258],tree_1[343:301]);
csa_43 csau_43_i4(A[558:516],A[601:559],A[644:602],tree_1[386:344],tree_1[429:387]);
csa_43 csau_43_i5(A[687:645],A[730:688],A[773:731],tree_1[472:430],tree_1[515:473]);
csa_43 csau_43_i6(A[816:774],A[859:817],A[902:860],tree_1[558:516],tree_1[601:559]);
csa_43 csau_43_i7(A[945:903],A[988:946],A[1031:989],tree_1[644:602],tree_1[687:645]);
csa_43 csau_43_i8(A[1074:1032],A[1117:1075],A[1160:1118],tree_1[730:688],tree_1[773:731]);
csa_43 csau_43_i9(A[1203:1161],A[1246:1204],A[1289:1247],tree_1[816:774],tree_1[859:817]);
csa_43 csau_43_i10(A[1332:1290],A[1375:1333],A[1418:1376],tree_1[902:860],tree_1[945:903]);
csa_43 csau_43_i11(A[1461:1419],A[1504:1462],A[1547:1505],tree_1[988:946],tree_1[1031:989]);
csa_43 csau_43_i12(A[1590:1548],A[1633:1591],A[1676:1634],tree_1[1074:1032],tree_1[1117:1075]);
csa_43 csau_43_i13(A[1719:1677],A[1762:1720],A[1805:1763],tree_1[1160:1118],tree_1[1203:1161]);
assign tree_1[1246:1204] = A[1848:1806];
// layer-2
csa_43 csau_43_i14(tree_1[42:0],tree_1[85:43],tree_1[128:86],tree_2[42:0],tree_2[85:43]);
csa_43 csau_43_i15(tree_1[171:129],tree_1[214:172],tree_1[257:215],tree_2[128:86],tree_2[171:129]);
csa_43 csau_43_i16(tree_1[300:258],tree_1[343:301],tree_1[386:344],tree_2[214:172],tree_2[257:215]);
csa_43 csau_43_i17(tree_1[429:387],tree_1[472:430],tree_1[515:473],tree_2[300:258],tree_2[343:301]);
csa_43 csau_43_i18(tree_1[558:516],tree_1[601:559],tree_1[644:602],tree_2[386:344],tree_2[429:387]);
csa_43 csau_43_i19(tree_1[687:645],tree_1[730:688],tree_1[773:731],tree_2[472:430],tree_2[515:473]);
csa_43 csau_43_i20(tree_1[816:774],tree_1[859:817],tree_1[902:860],tree_2[558:516],tree_2[601:559]);
csa_43 csau_43_i21(tree_1[945:903],tree_1[988:946],tree_1[1031:989],tree_2[644:602],tree_2[687:645]);
csa_43 csau_43_i22(tree_1[1074:1032],tree_1[1117:1075],tree_1[1160:1118],tree_2[730:688],tree_2[773:731]);
assign tree_2[816:774] = tree_1[1203:1161];
assign tree_2[859:817] = tree_1[1246:1204];
// layer-3
csa_43 csau_43_i23(tree_2[42:0],tree_2[85:43],tree_2[128:86],tree_3[42:0],tree_3[85:43]);
csa_43 csau_43_i24(tree_2[171:129],tree_2[214:172],tree_2[257:215],tree_3[128:86],tree_3[171:129]);
csa_43 csau_43_i25(tree_2[300:258],tree_2[343:301],tree_2[386:344],tree_3[214:172],tree_3[257:215]);
csa_43 csau_43_i26(tree_2[429:387],tree_2[472:430],tree_2[515:473],tree_3[300:258],tree_3[343:301]);
csa_43 csau_43_i27(tree_2[558:516],tree_2[601:559],tree_2[644:602],tree_3[386:344],tree_3[429:387]);
csa_43 csau_43_i28(tree_2[687:645],tree_2[730:688],tree_2[773:731],tree_3[472:430],tree_3[515:473]);
assign tree_3[558:516] = tree_2[816:774];
assign tree_3[601:559] = tree_2[859:817];
// layer-4
csa_43 csau_43_i29(tree_3[42:0],tree_3[85:43],tree_3[128:86],tree_4[42:0],tree_4[85:43]);
csa_43 csau_43_i30(tree_3[171:129],tree_3[214:172],tree_3[257:215],tree_4[128:86],tree_4[171:129]);
csa_43 csau_43_i31(tree_3[300:258],tree_3[343:301],tree_3[386:344],tree_4[214:172],tree_4[257:215]);
csa_43 csau_43_i32(tree_3[429:387],tree_3[472:430],tree_3[515:473],tree_4[300:258],tree_4[343:301]);
assign tree_4[386:344] = tree_3[558:516];
assign tree_4[429:387] = tree_3[601:559];
// layer-5
csa_43 csau_43_i33(tree_4[42:0],tree_4[85:43],tree_4[128:86],tree_5[42:0],tree_5[85:43]);
csa_43 csau_43_i34(tree_4[171:129],tree_4[214:172],tree_4[257:215],tree_5[128:86],tree_5[171:129]);
csa_43 csau_43_i35(tree_4[300:258],tree_4[343:301],tree_4[386:344],tree_5[214:172],tree_5[257:215]);
assign tree_5[300:258] = tree_4[429:387];
// layer-6
csa_43 csau_43_i36(tree_5[42:0],tree_5[85:43],tree_5[128:86],tree_6[42:0],tree_6[85:43]);
csa_43 csau_43_i37(tree_5[171:129],tree_5[214:172],tree_5[257:215],tree_6[128:86],tree_6[171:129]);
assign tree_6[214:172] = tree_5[300:258];
// layer-7
csa_43 csau_43_i38(tree_6[42:0],tree_6[85:43],tree_6[128:86],tree_7[42:0],tree_7[85:43]);
assign tree_7[128:86] = tree_6[171:129];
assign tree_7[171:129] = tree_6[214:172];
// layer-8
csa_43 csau_43_i39(tree_7[42:0],tree_7[85:43],tree_7[128:86],tree_8[42:0],tree_8[85:43]);
assign tree_8[128:86] = tree_7[171:129];
// layer-9
csa_43 csau_43_i40(tree_8[42:0],tree_8[85:43],tree_8[128:86],tree_9[42:0],tree_9[85:43]);

// final assignment
assign B_0 = tree_9[42:0];
assign B_1 = tree_9[85:43];

endmodule
