
module mem_unit_1506(
    input clk,rst,command_wea,
    input d_in_en,
    input [23:0] command_in,
    input [1505:0] dina_1,dina_2,
    output [1505:0] douta_1,douta_2,douta_3,douta_4,
    output done_ins_computation
);

wire mem_0_en,mem_1_en,mem_2_en,mem_3_en,mem_4_en,mem_5_en,mem_6_en,mem_7_en,mem_8_en,mem_9_en,mem_10_en,mem_11_en,mem_12_en,mem_13_en,mem_14_en,mem_15_en,mem_16_en,mem_17_en,mem_18_en,mem_19_en,
mem_20_en,mem_21_en,mem_22_en,mem_23_en,mem_24_en,mem_25_en,mem_26_en,mem_27_en,mem_28_en,mem_29_en,mem_30_en,mem_31_en,mem_32_en,mem_33_en,mem_34_en,mem_35_en,mem_36_en,mem_37_en,mem_38_en,mem_39_en,
mem_40_en,mem_41_en,mem_42_en,mem_43_en,mem_44_en,mem_45_en,mem_46_en,mem_47_en,mem_48_en,mem_49_en,mem_50_en,mem_51_en,mem_52_en,mem_53_en,mem_54_en,mem_55_en,mem_56_en,mem_57_en,mem_58_en,mem_59_en,
mem_60_en,mem_61_en,mem_62_en,mem_63_en;
wire mem_a_en,mem_c_en;
wire [2:0] INS;
wire [6:0] rd_addr_1,rd_addr_2,wr_addr;
wire [1505:0] mem_mux1_o,mem_mux2_o,mem_mux3_o,mem_mux4_o;
reg command_end;
reg [23:0] command_reg;
reg [1505:0] mem_a_c,mem_a_s,mem_c_c,mem_c_s;
reg [1505:0] mem_0,mem_1,mem_2,mem_3,mem_4,mem_5,mem_6,mem_7,mem_8,mem_9,mem_10,mem_11,mem_12,mem_13,mem_14,mem_15,mem_16,mem_17,mem_18,mem_19,
mem_20,mem_21,mem_22,mem_23,mem_24,mem_25,mem_26,mem_27,mem_28,mem_29,mem_30,mem_31,mem_32,mem_33,mem_34,mem_35,mem_36,mem_37,mem_38,mem_39,
mem_40,mem_41,mem_42,mem_43,mem_44,mem_45,mem_46,mem_47,mem_48,mem_49,mem_50,mem_51,mem_52,mem_53,mem_54,mem_55,mem_56,mem_57,mem_58,mem_59,
mem_60,mem_61,mem_62,mem_63,mem_64,mem_65,mem_66,mem_67,mem_68,mem_69,mem_70,mem_71,mem_72,mem_73,mem_74,mem_75,mem_76,mem_77,mem_78,mem_79,
mem_80,mem_81,mem_82,mem_83,mem_84,mem_85,mem_86,mem_87,mem_88,mem_89,mem_90,mem_91,mem_92,mem_93,mem_94,mem_95,mem_96,mem_97,mem_98,mem_99,
mem_100,mem_101,mem_102,mem_103,mem_104,mem_105,mem_106,mem_107,mem_108,mem_109,mem_110,mem_111,mem_112,mem_113,mem_114,mem_115,mem_116,mem_117,mem_118,mem_119,
mem_120,mem_121,mem_122,mem_123,mem_124,mem_125,mem_126,mem_127;
//To Change if instruction last longer than 1 cc.
assign INS = (command_wea)?command_in[23:21]:command_reg[23:21];
assign rd_addr_1 = (command_wea)?command_in[20:14]:command_reg[20:14];
assign rd_addr_2 = (command_wea)?command_in[13:7]:command_reg[13:7];
assign wr_addr = (command_wea)?command_in[6:0]:command_reg[6:0];
assign douta_1 = mem_mux1_o;
assign douta_2 = mem_mux2_o;
assign douta_3 = mem_mux3_o;
assign douta_4 = mem_mux4_o;

// Instruction list + effect:
/*
INS = 0 => Idle
INS = 1 => load input
INS = 2 => copy point rd to wr
INS = 3 => ADD
INS = 4 => SUB
INS = 5 => MUL
*/
assign done_ins_computation = d_in_en;

assign mem_a_en = (wr_addr==7'd126 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_c_en = (wr_addr==7'd127 && d_in_en == 1'd1)? 1'd1 : 1'd0;

assign mem_0_en = (wr_addr==7'd0 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_1_en = (wr_addr==7'd1 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_2_en = (wr_addr==7'd2 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_3_en = (wr_addr==7'd3 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_4_en = (wr_addr==7'd4 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_5_en = (wr_addr==7'd5 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_6_en = (wr_addr==7'd6 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_7_en = (wr_addr==7'd7 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_8_en = (wr_addr==7'd8 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_9_en = (wr_addr==7'd9 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_10_en = (wr_addr==7'd10 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_11_en = (wr_addr==7'd11 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_12_en = (wr_addr==7'd12 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_13_en = (wr_addr==7'd13 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_14_en = (wr_addr==7'd14 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_15_en = (wr_addr==7'd15 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_16_en = (wr_addr==7'd16 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_17_en = (wr_addr==7'd17 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_18_en = (wr_addr==7'd18 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_19_en = (wr_addr==7'd19 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_20_en = (wr_addr==7'd20 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_21_en = (wr_addr==7'd21 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_22_en = (wr_addr==7'd22 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_23_en = (wr_addr==7'd23 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_24_en = (wr_addr==7'd24 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_25_en = (wr_addr==7'd25 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_26_en = (wr_addr==7'd26 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_27_en = (wr_addr==7'd27 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_28_en = (wr_addr==7'd28 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_29_en = (wr_addr==7'd29 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_30_en = (wr_addr==7'd30 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_31_en = (wr_addr==7'd31 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_32_en = (wr_addr==7'd32 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_33_en = (wr_addr==7'd33 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_34_en = (wr_addr==7'd34 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_35_en = (wr_addr==7'd35 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_36_en = (wr_addr==7'd36 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_37_en = (wr_addr==7'd37 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_38_en = (wr_addr==7'd38 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_39_en = (wr_addr==7'd39 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_40_en = (wr_addr==7'd40 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_41_en = (wr_addr==7'd41 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_42_en = (wr_addr==7'd42 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_43_en = (wr_addr==7'd43 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_44_en = (wr_addr==7'd44 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_45_en = (wr_addr==7'd45 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_46_en = (wr_addr==7'd46 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_47_en = (wr_addr==7'd47 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_48_en = (wr_addr==7'd48 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_49_en = (wr_addr==7'd49 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_50_en = (wr_addr==7'd50 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_51_en = (wr_addr==7'd51 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_52_en = (wr_addr==7'd52 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_53_en = (wr_addr==7'd53 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_54_en = (wr_addr==7'd54 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_55_en = (wr_addr==7'd55 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_56_en = (wr_addr==7'd56 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_57_en = (wr_addr==7'd57 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_58_en = (wr_addr==7'd58 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_59_en = (wr_addr==7'd59 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_60_en = (wr_addr==7'd60 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_61_en = (wr_addr==7'd61 && d_in_en == 1'd1)? 1'd1 : 1'd0;
assign mem_62_en = (wr_addr==7'd62 && d_in_en == 1'd1)? 1'd1 : 1'd0; assign mem_63_en = (wr_addr==7'd63 && d_in_en == 1'd1)? 1'd1 : 1'd0;


always@(posedge clk)begin
    if (rst)begin
        mem_0 <= 0;mem_1 <= 0;mem_2 <= 0;mem_3 <= 0;mem_4 <= 0;mem_5 <= 0;mem_6 <= 0;mem_7 <= 0;mem_8 <= 0;mem_9 <= 0;mem_10 <= 0;mem_11 <= 0;mem_12 <= 0;mem_13 <= 0;mem_14 <= 0;mem_15 <= 0;mem_16 <= 0;mem_17 <= 0;mem_18 <= 0;mem_19 <= 0;
        mem_20 <= 0;mem_21 <= 0;mem_22 <= 0;mem_23 <= 0;mem_24 <= 0;mem_25 <= 0;mem_26 <= 0;mem_27 <= 0;mem_28 <= 0;mem_29 <= 0;mem_30 <= 0;mem_31 <= 0;mem_32 <= 0;mem_33 <= 0;mem_34 <= 0;mem_35 <= 0;mem_36 <= 0;mem_37 <= 0;mem_38 <= 0;mem_39 <= 0;
        mem_40 <= 0;mem_41 <= 0;mem_42 <= 0;mem_43 <= 0;mem_44 <= 0;mem_45 <= 0;mem_46 <= 0;mem_47 <= 0;mem_48 <= 0;mem_49 <= 0;mem_50 <= 0;mem_51 <= 0;mem_52 <= 0;mem_53 <= 0;mem_54 <= 0;mem_55 <= 0;mem_56 <= 0;mem_57 <= 0;mem_58 <= 0;mem_59 <= 0;
        mem_60 <= 0;mem_61 <= 0;mem_62 <= 0;mem_63 <= 0;mem_64 <= 0;mem_65 <= 0;mem_66 <= 0;mem_67 <= 0;mem_68 <= 0;mem_69 <= 0;mem_70 <= 0;mem_71 <= 0;mem_72 <= 0;mem_73 <= 0;mem_74 <= 0;mem_75 <= 0;mem_76 <= 0;mem_77 <= 0;mem_78 <= 0;mem_79 <= 0;
        mem_80 <= 0;mem_81 <= 0;mem_82 <= 0;mem_83 <= 0;mem_84 <= 0;mem_85 <= 0;mem_86 <= 0;mem_87 <= 0;mem_88 <= 0;mem_89 <= 0;mem_90 <= 0;mem_91 <= 0;mem_92 <= 0;mem_93 <= 0;mem_94 <= 0;mem_95 <= 0;mem_96 <= 0;mem_97 <= 0;mem_98 <= 0;mem_99 <= 0;
        mem_100 <= 0;mem_101 <= 0;mem_102 <= 0;mem_103 <= 0;mem_104 <= 0;mem_105 <= 0;mem_106 <= 0;mem_107 <= 0;mem_108 <= 0;mem_109 <= 0;mem_110 <= 0;mem_111 <= 0;mem_112 <= 0;mem_113 <= 0;mem_114 <= 0;mem_115 <= 0;mem_116 <= 0;mem_117 <= 0;mem_118 <= 0;mem_119 <= 0;
        mem_120 <= 0;mem_121 <= 0;mem_122 <= 0;mem_123 <= 0;mem_124 <= 0;mem_125 <= 0;mem_126 <= 0;mem_127 <= 0;
        mem_a_c <= 0; mem_a_s <= 0; mem_c_c <= 0; mem_c_s <= 0;
    end
    else if(INS == 3'd1 || INS == 3'd2 || INS == 3'd3 || INS == 3'd4 || INS == 3'd5) begin
        if(mem_a_en) begin mem_a_c <= dina_1; mem_a_s <= dina_2; end
        if(mem_c_en) begin mem_c_c <= dina_1; mem_c_s <= dina_2; end
        if(mem_0_en) begin mem_0 <= dina_1; mem_1 <= dina_2; end
        if(mem_0_en) begin mem_0 <= dina_1; mem_1 <= dina_2; end
        if(mem_1_en) begin mem_2 <= dina_1; mem_3 <= dina_2; end
        if(mem_2_en) begin mem_4 <= dina_1; mem_5 <= dina_2; end
        if(mem_3_en) begin mem_6 <= dina_1; mem_7 <= dina_2; end
        if(mem_4_en) begin mem_8 <= dina_1; mem_9 <= dina_2; end
        if(mem_5_en) begin mem_10 <= dina_1; mem_11 <= dina_2; end
        if(mem_6_en) begin mem_12 <= dina_1; mem_13 <= dina_2; end
        if(mem_7_en) begin mem_14 <= dina_1; mem_15 <= dina_2; end
        if(mem_8_en) begin mem_16 <= dina_1; mem_17 <= dina_2; end
        if(mem_9_en) begin mem_18 <= dina_1; mem_19 <= dina_2; end
        if(mem_10_en) begin mem_20 <= dina_1; mem_21 <= dina_2; end
        if(mem_11_en) begin mem_22 <= dina_1; mem_23 <= dina_2; end
        if(mem_12_en) begin mem_24 <= dina_1; mem_25 <= dina_2; end
        if(mem_13_en) begin mem_26 <= dina_1; mem_27 <= dina_2; end
        if(mem_14_en) begin mem_28 <= dina_1; mem_29 <= dina_2; end
        if(mem_15_en) begin mem_30 <= dina_1; mem_31 <= dina_2; end
        if(mem_16_en) begin mem_32 <= dina_1; mem_33 <= dina_2; end
        if(mem_17_en) begin mem_34 <= dina_1; mem_35 <= dina_2; end
        if(mem_18_en) begin mem_36 <= dina_1; mem_37 <= dina_2; end
        if(mem_19_en) begin mem_38 <= dina_1; mem_39 <= dina_2; end
        if(mem_20_en) begin mem_40 <= dina_1; mem_41 <= dina_2; end
        if(mem_21_en) begin mem_42 <= dina_1; mem_43 <= dina_2; end
        if(mem_22_en) begin mem_44 <= dina_1; mem_45 <= dina_2; end
        if(mem_23_en) begin mem_46 <= dina_1; mem_47 <= dina_2; end
        if(mem_24_en) begin mem_48 <= dina_1; mem_49 <= dina_2; end
        if(mem_25_en) begin mem_50 <= dina_1; mem_51 <= dina_2; end
        if(mem_26_en) begin mem_52 <= dina_1; mem_53 <= dina_2; end
        if(mem_27_en) begin mem_54 <= dina_1; mem_55 <= dina_2; end
        if(mem_28_en) begin mem_56 <= dina_1; mem_57 <= dina_2; end
        if(mem_29_en) begin mem_58 <= dina_1; mem_59 <= dina_2; end
        if(mem_30_en) begin mem_60 <= dina_1; mem_61 <= dina_2; end
        if(mem_31_en) begin mem_62 <= dina_1; mem_63 <= dina_2; end
        if(mem_32_en) begin mem_64 <= dina_1; mem_65 <= dina_2; end
        if(mem_33_en) begin mem_66 <= dina_1; mem_67 <= dina_2; end
        if(mem_34_en) begin mem_68 <= dina_1; mem_69 <= dina_2; end
        if(mem_35_en) begin mem_70 <= dina_1; mem_71 <= dina_2; end
        if(mem_36_en) begin mem_72 <= dina_1; mem_73 <= dina_2; end
        if(mem_37_en) begin mem_74 <= dina_1; mem_75 <= dina_2; end
        if(mem_38_en) begin mem_76 <= dina_1; mem_77 <= dina_2; end
        if(mem_39_en) begin mem_78 <= dina_1; mem_79 <= dina_2; end
        if(mem_40_en) begin mem_80 <= dina_1; mem_81 <= dina_2; end
        if(mem_41_en) begin mem_82 <= dina_1; mem_83 <= dina_2; end
        if(mem_42_en) begin mem_84 <= dina_1; mem_85 <= dina_2; end
        if(mem_43_en) begin mem_86 <= dina_1; mem_87 <= dina_2; end
        if(mem_44_en) begin mem_88 <= dina_1; mem_89 <= dina_2; end
        if(mem_45_en) begin mem_90 <= dina_1; mem_91 <= dina_2; end
        if(mem_46_en) begin mem_92 <= dina_1; mem_93 <= dina_2; end
        if(mem_47_en) begin mem_94 <= dina_1; mem_95 <= dina_2; end
        if(mem_48_en) begin mem_96 <= dina_1; mem_97 <= dina_2; end
        if(mem_49_en) begin mem_98 <= dina_1; mem_99 <= dina_2; end
        if(mem_50_en) begin mem_100 <= dina_1; mem_101 <= dina_2; end
        if(mem_51_en) begin mem_102 <= dina_1; mem_103 <= dina_2; end
        if(mem_52_en) begin mem_104 <= dina_1; mem_105 <= dina_2; end
        if(mem_53_en) begin mem_106 <= dina_1; mem_107 <= dina_2; end
        if(mem_54_en) begin mem_108 <= dina_1; mem_109 <= dina_2; end
        if(mem_55_en) begin mem_110 <= dina_1; mem_111 <= dina_2; end
        if(mem_56_en) begin mem_112 <= dina_1; mem_113 <= dina_2; end
        if(mem_57_en) begin mem_114 <= dina_1; mem_115 <= dina_2; end
        if(mem_58_en) begin mem_116 <= dina_1; mem_117 <= dina_2; end
        if(mem_59_en) begin mem_118 <= dina_1; mem_119 <= dina_2; end
        if(mem_60_en) begin mem_120 <= dina_1; mem_121 <= dina_2; end
        if(mem_61_en) begin mem_122 <= dina_1; mem_123 <= dina_2; end
        if(mem_62_en) begin mem_124 <= dina_1; mem_125 <= dina_2; end
        if(mem_63_en) begin mem_126 <= dina_1; mem_127 <= dina_2; end

    end
    else begin
        mem_a_c <= mem_a_c; mem_a_s <= mem_a_s; mem_c_c <= mem_c_c; mem_c_s <= mem_c_s;
        mem_0 <= mem_0;mem_1 <= mem_1;mem_2 <= mem_2;mem_3 <= mem_3;mem_4 <= mem_4;mem_5 <= mem_5;mem_6 <= mem_6;mem_7 <= mem_7;mem_8 <= mem_8;mem_9 <= mem_9;
        mem_10 <= mem_10;mem_11 <= mem_11;mem_12 <= mem_12;mem_13 <= mem_13;mem_14 <= mem_14;mem_15 <= mem_15;mem_16 <= mem_16;mem_17 <= mem_17;mem_18 <= mem_18;mem_19 <= mem_19;
        mem_20 <= mem_20;mem_21 <= mem_21;mem_22 <= mem_22;mem_23 <= mem_23;mem_24 <= mem_24;mem_25 <= mem_25;mem_26 <= mem_26;mem_27 <= mem_27;mem_28 <= mem_28;mem_29 <= mem_29;
        mem_30 <= mem_30;mem_31 <= mem_31;mem_32 <= mem_32;mem_33 <= mem_33;mem_34 <= mem_34;mem_35 <= mem_35;mem_36 <= mem_36;mem_37 <= mem_37;mem_38 <= mem_38;mem_39 <= mem_39;
        mem_40 <= mem_40;mem_41 <= mem_41;mem_42 <= mem_42;mem_43 <= mem_43;mem_44 <= mem_44;mem_45 <= mem_45;mem_46 <= mem_46;mem_47 <= mem_47;mem_48 <= mem_48;mem_49 <= mem_49;
        mem_50 <= mem_50;mem_51 <= mem_51;mem_52 <= mem_52;mem_53 <= mem_53;mem_54 <= mem_54;mem_55 <= mem_55;mem_56 <= mem_56;mem_57 <= mem_57;mem_58 <= mem_58;mem_59 <= mem_59;
        mem_60 <= mem_60;mem_61 <= mem_61;mem_62 <= mem_62;mem_63 <= mem_63;mem_64 <= mem_64;mem_65 <= mem_65;mem_66 <= mem_66;mem_67 <= mem_67;mem_68 <= mem_68;mem_69 <= mem_69;
        mem_70 <= mem_70;mem_71 <= mem_71;mem_72 <= mem_72;mem_73 <= mem_73;mem_74 <= mem_74;mem_75 <= mem_75;mem_76 <= mem_76;mem_77 <= mem_77;mem_78 <= mem_78;mem_79 <= mem_79;
        mem_80 <= mem_80;mem_81 <= mem_81;mem_82 <= mem_82;mem_83 <= mem_83;mem_84 <= mem_84;mem_85 <= mem_85;mem_86 <= mem_86;mem_87 <= mem_87;mem_88 <= mem_88;mem_89 <= mem_89;
        mem_90 <= mem_90;mem_91 <= mem_91;mem_92 <= mem_92;mem_93 <= mem_93;mem_94 <= mem_94;mem_95 <= mem_95;mem_96 <= mem_96;mem_97 <= mem_97;mem_98 <= mem_98;mem_99 <= mem_99;
        mem_100 <= mem_100;mem_101 <= mem_101;mem_102 <= mem_102;mem_103 <= mem_103;mem_104 <= mem_104;mem_105 <= mem_105;mem_106 <= mem_106;mem_107 <= mem_107;mem_108 <= mem_108;mem_109 <= mem_109;
        mem_110 <= mem_110;mem_111 <= mem_111;mem_112 <= mem_112;mem_113 <= mem_113;mem_114 <= mem_114;mem_115 <= mem_115;mem_116 <= mem_116;mem_117 <= mem_117;mem_118 <= mem_118;mem_119 <= mem_119;
        mem_120 <= mem_120;mem_121 <= mem_121;mem_122 <= mem_122;mem_123 <= mem_123;mem_124 <= mem_124;mem_125 <= mem_125;mem_126 <= mem_126;mem_127 <= mem_127;
    end
end

mem_mux mem_addr1(rd_addr_1,mem_0,mem_2,mem_4,mem_6,mem_8,mem_10,mem_12,mem_14,mem_16,mem_18,mem_20,mem_22,mem_24,mem_26,mem_28,mem_30,mem_32,mem_34,mem_36,mem_38,
mem_40,mem_42,mem_44,mem_46,mem_48,mem_50,mem_52,mem_54,mem_56,mem_58,mem_60,mem_62,mem_64,mem_66,mem_68,mem_70,mem_72,mem_74,mem_76,mem_78,
mem_80,mem_82,mem_84,mem_86,mem_88,mem_90,mem_92,mem_94,mem_96,mem_98,mem_100,mem_102,mem_104,mem_106,mem_108,mem_110,mem_112,mem_114,mem_116,mem_118,
mem_120,mem_122,mem_124,mem_126,mem_a_c,mem_c_c,mem_mux1_o);

mem_mux mem_addr2(rd_addr_1,mem_1,mem_3,mem_5,mem_7,mem_9,mem_11,mem_13,mem_15,mem_17,mem_19,mem_21,mem_23,mem_25,mem_27,mem_29,mem_31,mem_33,mem_35,mem_37,mem_39,
mem_41,mem_43,mem_45,mem_47,mem_49,mem_51,mem_53,mem_55,mem_57,mem_59,mem_61,mem_63,mem_65,mem_67,mem_69,mem_71,mem_73,mem_75,mem_77,mem_79,
mem_81,mem_83,mem_85,mem_87,mem_89,mem_91,mem_93,mem_95,mem_97,mem_99,mem_101,mem_103,mem_105,mem_107,mem_109,mem_111,mem_113,mem_115,mem_117,mem_119,
mem_121,mem_123,mem_125,mem_127,mem_a_s,mem_c_s,mem_mux2_o);

mem_mux mem_addr3(rd_addr_2,mem_0,mem_2,mem_4,mem_6,mem_8,mem_10,mem_12,mem_14,mem_16,mem_18,mem_20,mem_22,mem_24,mem_26,mem_28,mem_30,mem_32,mem_34,mem_36,mem_38,
mem_40,mem_42,mem_44,mem_46,mem_48,mem_50,mem_52,mem_54,mem_56,mem_58,mem_60,mem_62,mem_64,mem_66,mem_68,mem_70,mem_72,mem_74,mem_76,mem_78,
mem_80,mem_82,mem_84,mem_86,mem_88,mem_90,mem_92,mem_94,mem_96,mem_98,mem_100,mem_102,mem_104,mem_106,mem_108,mem_110,mem_112,mem_114,mem_116,mem_118,
mem_120,mem_122,mem_124,mem_126,mem_a_c,mem_c_c,mem_mux3_o);

mem_mux mem_addr4(rd_addr_2,mem_1,mem_3,mem_5,mem_7,mem_9,mem_11,mem_13,mem_15,mem_17,mem_19,mem_21,mem_23,mem_25,mem_27,mem_29,mem_31,mem_33,mem_35,mem_37,mem_39,
mem_41,mem_43,mem_45,mem_47,mem_49,mem_51,mem_53,mem_55,mem_57,mem_59,mem_61,mem_63,mem_65,mem_67,mem_69,mem_71,mem_73,mem_75,mem_77,mem_79,
mem_81,mem_83,mem_85,mem_87,mem_89,mem_91,mem_93,mem_95,mem_97,mem_99,mem_101,mem_103,mem_105,mem_107,mem_109,mem_111,mem_113,mem_115,mem_117,mem_119,
mem_121,mem_123,mem_125,mem_127,mem_a_s,mem_c_s,mem_mux4_o);

always@(posedge clk)begin
    command_reg <= command_in;
end
endmodule
    