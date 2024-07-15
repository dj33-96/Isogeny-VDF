
module tb_dbl_89();

// Instruction list + effect:
/*
INS = 0 => Idle
INS = 1 => load input
INS = 2 => copy point rd to wr
INS = 3 => ADD
INS = 4 => SUB
INS = 5 => MUL
*/

reg clk,rst,get_output,data_en,ins_in;
wire [24-1:0] command_in;
reg [89-1:0] din_1,din_2;
wire [89-1:0] dout_1,dout_2;
reg [9:0] i;

reg [2:0] INS;
reg [7-1:0] rd_addr_1,rd_addr_2,wr_addr;

assign command_in = {INS,rd_addr_1,rd_addr_2,wr_addr};

wire [89:0] p, calculated;
assign p = 90'd501974515280983173562892287;
assign calculated = (dout_1 + dout_2) % p;

wire [89-1:0] x,z,a,c,x_dbl,z_dbl;

assign x = 89'd37002296351524533193411810;
assign z = 89'd34343669167373110674336784;
assign a = 89'd8;
assign c = 89'd4;
assign x_dbl = 89'd56371913204586772807521660;
assign z_dbl = 89'd251340096499134955060779407;

cryptoprocessor_wrapper_89 UUT(clk,rst,get_output,data_en,ins_in,command_in,din_1,din_2,dout_1,dout_2);

always #1 clk = ~clk;

initial begin
    clk = 0; rst = 0; data_en = 0; ins_in = 0; get_output = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd0,7'd0,7'd0};
    @(posedge clk);
    rst = 1;get_output = 0;
    @(posedge clk);
    rst = 0;
    @(posedge clk);
    //Load x in addr 0
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,7'd0,7'd0,7'd0};
    din_1 = x;
    din_2 = 0;
    @(posedge clk);
    //Load z in addr 1
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,7'd0,7'd0,7'd1};
    din_1 = z;
    din_2 = 0;
    @(posedge clk);
    //Load a in addr 2
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,7'd0,7'd0,7'd2};
    din_1 = a;
    din_2 = 0;
    @(posedge clk);
    //Load c in addr 3
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,7'd0,7'd0,7'd3};
    din_1 = c;
    din_2 = 0;
    @(posedge clk);
    //Start the operations
    //addr4 = addr0 - addr1 | t0 = x - z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,7'd0,7'd1,7'd4};
    @(posedge clk);
    //addr5 = addr0 + addr1 | t1 = x + z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd0,7'd1,7'd5};
    @(posedge clk);
    //addr4 = addr4 * addr4 | t0 = t0 ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd4,7'd4,7'd4};
    @(posedge clk);
    //addr5 = addr5 * addr5 | t1 = t1 ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd5,7'd5,7'd5};
    @(posedge clk);
    //addr7 = addr3 * addr4 | z_dbl = c * t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd3,7'd4,7'd7};
    @(posedge clk);
    //addr6 = addr7 * addr5 | x = z * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd7,7'd5,7'd6};
    @(posedge clk);
    //addr5 = addr5 * addr4 | t1 = t1 - t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,7'd5,7'd4,7'd5};
    @(posedge clk);
    //addr4 = addr2 * addr5 | t0 = a * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd2,7'd5,7'd4};
    @(posedge clk);
    //addr7 = addr7 + addr4 | z_dbl = z_dbl + t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd7,7'd4,7'd7};
    @(posedge clk);
    //addr7 = addr7 * addr5 | z_dbl = z_dbl * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd7,7'd5,7'd7};
    @(posedge clk);
    
    //Get output of addr = 6
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd6,7'd0,7'd0};
    @(posedge clk);
    if (x_dbl != calculated) begin
        $display("TEST for dbl(x): FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | dbl(x) = 0x%x, calculated = 0x%x",dout_1,dout_2,x_dbl,calculated);
        $display("Failed TEST: inputs: x,z,a,c = 0x%x,0x%x,0x%x,0x%x",x,z,a,c);
        $stop();
    end
    //Get output of addr = 7
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd7,7'd0,7'd0};
    @(posedge clk);
    if(z_dbl != calculated)begin
        $display("TEST for dbl(z): FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | dbl(z) = 0x%x, calculated = 0x%x",dout_1,dout_2,z_dbl,calculated);
        $display("Failed TEST: inputs: x,z,a,c = 0x%x,0x%x,0x%x,0x%x",x,z,a,c);
        $stop();
    end
    @(posedge clk);
    
    $display("DBL correct");
    $finish();
end

endmodule
    