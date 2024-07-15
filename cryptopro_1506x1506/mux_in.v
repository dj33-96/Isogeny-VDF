
module mux_in(
    input d_in,
    input [2:0] INS,
    input [1505:0] a_1,a_2,a_3,a_4,a_5,
    output [1505:0] a_o);

assign a_o = (d_in) ? a_1:
             (d_in == 1'b0 && INS == 3'd0) ? 0:
             (d_in == 1'b0 && INS == 3'd1) ? a_1:    //din_
             (d_in == 1'b0 && INS == 3'd2) ? a_2:    //douta_
             (d_in == 1'b0 && INS == 3'd3) ? a_3:    //add
             (d_in == 1'b0 && INS == 3'd4) ? a_4:    //sub
             (d_in == 1'b0 && INS == 3'd5) ? a_5: 0; //mul

endmodule
    