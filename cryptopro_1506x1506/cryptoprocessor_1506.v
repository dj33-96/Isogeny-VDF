
module cryptoprocessor_1506(
    input clk,rst,get_output,data_en,ins_in,
    input [23:0] command_cp,
    input [1505:0] din_1,din_2,add_o_c,add_o_s,sub_o_c,sub_o_s,red_o_c,red_o_s,
    output [1505:0] dout_1,dout_2,add_i1_c,add_i1_s,add_i2_c,add_i2_s,sub_i1_c,sub_i1_s,sub_i2_c,sub_i2_s,mul_i1_c,mul_i1_s,mul_i2_c,mul_i2_s
);

wire d_in_en,ins_done;
wire [2:0] INS;
wire [1505:0] douta_1,douta_2,douta_3,douta_4,mux_o_1,mux_o_2;

assign INS = command_cp[23:21];
assign d_in_en = (data_en || ins_in)?1'b1:1'b0;
assign dout_1 = ((data_en && ins_in == 1'd0) | get_output == 1'd1)?douta_1:0;
assign dout_2 = ((data_en && ins_in == 1'd0) | get_output == 1'd1)?douta_2:0;

assign add_i1_c = douta_1; assign add_i1_s = douta_2;
assign add_i2_c = douta_3; assign add_i2_s = douta_4;
assign sub_i1_c = douta_1; assign sub_i1_s = douta_2;
assign sub_i2_c = douta_3; assign sub_i2_s = douta_4;
assign mul_i1_c = douta_1; assign mul_i1_s = douta_2;
assign mul_i2_c = douta_3; assign mul_i2_s = douta_4;

mux_in mux1(data_en,INS,din_1,douta_1,add_o_c,sub_o_c,red_o_c,mux_o_1);
mux_in mux2(data_en,INS,din_2,douta_2,add_o_s,sub_o_s,red_o_s,mux_o_2);

mem_unit_1506 mem(.clk(clk),.rst(rst),.command_wea(ins_in),.d_in_en(d_in_en),.dina_1(mux_o_1),.dina_2(mux_o_2),
                .command_in(command_cp),.douta_1(douta_1),.douta_2(douta_2),.douta_3(douta_3),.douta_4(douta_4),.done_ins_computation(ins_done));

endmodule
    