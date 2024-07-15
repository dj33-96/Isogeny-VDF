
module mem_mux(
    input [6:0] rd_addr,
    input [88:0] mem_0,mem_1,mem_2,mem_3,mem_4,mem_5,mem_6,mem_7,mem_8,mem_9,mem_10,mem_11,mem_12,mem_13,mem_14,mem_15,mem_16,mem_17,mem_18,mem_19,
    mem_20,mem_21,mem_22,mem_23,mem_24,mem_25,mem_26,mem_27,mem_28,mem_29,mem_30,mem_31,mem_32,mem_33,mem_34,mem_35,mem_36,mem_37,mem_38,mem_39,
    mem_40,mem_41,mem_42,mem_43,mem_44,mem_45,mem_46,mem_47,mem_48,mem_49,mem_50,mem_51,mem_52,mem_53,mem_54,mem_55,mem_56,mem_57,mem_58,mem_59,
    mem_60,mem_61,mem_62,mem_63,mem_a_c,mem_c_c,
    output reg [88:0] mem_rd);

always @(*) begin
    case(rd_addr)
        7'd0: mem_rd = mem_0; 7'd1: mem_rd = mem_1; 7'd2: mem_rd = mem_2; 7'd3: mem_rd = mem_3; 
        7'd4: mem_rd = mem_4; 7'd5: mem_rd = mem_5; 7'd6: mem_rd = mem_6; 7'd7: mem_rd = mem_7; 
        7'd8: mem_rd = mem_8; 7'd9: mem_rd = mem_9; 7'd10: mem_rd = mem_10; 7'd11: mem_rd = mem_11; 
        7'd12: mem_rd = mem_12; 7'd13: mem_rd = mem_13; 7'd14: mem_rd = mem_14; 7'd15: mem_rd = mem_15; 
        7'd16: mem_rd = mem_16; 7'd17: mem_rd = mem_17; 7'd18: mem_rd = mem_18; 7'd19: mem_rd = mem_19; 
        7'd20: mem_rd = mem_20; 7'd21: mem_rd = mem_21; 7'd22: mem_rd = mem_22; 7'd23: mem_rd = mem_23; 
        7'd24: mem_rd = mem_24; 7'd25: mem_rd = mem_25; 7'd26: mem_rd = mem_26; 7'd27: mem_rd = mem_27; 
        7'd28: mem_rd = mem_28; 7'd29: mem_rd = mem_29; 7'd30: mem_rd = mem_30; 7'd31: mem_rd = mem_31; 
        7'd32: mem_rd = mem_32; 7'd33: mem_rd = mem_33; 7'd34: mem_rd = mem_34; 7'd35: mem_rd = mem_35; 
        7'd36: mem_rd = mem_36; 7'd37: mem_rd = mem_37; 7'd38: mem_rd = mem_38; 7'd39: mem_rd = mem_39; 
        7'd40: mem_rd = mem_40; 7'd41: mem_rd = mem_41; 7'd42: mem_rd = mem_42; 7'd43: mem_rd = mem_43; 
        7'd44: mem_rd = mem_44; 7'd45: mem_rd = mem_45; 7'd46: mem_rd = mem_46; 7'd47: mem_rd = mem_47; 
        7'd48: mem_rd = mem_48; 7'd49: mem_rd = mem_49; 7'd50: mem_rd = mem_50; 7'd51: mem_rd = mem_51; 
        7'd52: mem_rd = mem_52; 7'd53: mem_rd = mem_53; 7'd54: mem_rd = mem_54; 7'd55: mem_rd = mem_55; 
        7'd56: mem_rd = mem_56; 7'd57: mem_rd = mem_57; 7'd58: mem_rd = mem_58; 7'd59: mem_rd = mem_59; 
        7'd60: mem_rd = mem_60; 7'd61: mem_rd = mem_61; 7'd62: mem_rd = mem_62; 7'd63: mem_rd = mem_63; 
        //7'd0: mem_rd = mem_0; 7'd1: mem_rd = mem_1; 7'd2: mem_rd = mem_2; 7'd3: mem_rd = mem_3;
        //7'd100: mem_rd = mem_100; 7'd101: mem_rd = mem_101; 7'd102: mem_rd = mem_102; 7'd103: mem_rd = mem_103;        
        default: mem_rd = 0;
    endcase
end

endmodule

    