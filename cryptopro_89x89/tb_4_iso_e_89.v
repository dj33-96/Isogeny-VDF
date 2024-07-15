
module tb_4_iso_e_89();

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

reg [2:0] INS;
reg [7-1:0] rd_addr_1,rd_addr_2,wr_addr;

assign command_in = {INS,rd_addr_1,rd_addr_2,wr_addr};

wire [89:0] p, calculated;
assign p = 90'd501974515280983173562892287;
assign calculated = (dout_1 + dout_2) % p;

wire [89-1:0] x,z,k1,k2,k3;//inputs
wire [89-1:0] xo,zo;//expected values

assign x = 89'd176909458998936010280750333;
assign z = 89'd495664254298952203775311364;
assign k1 = 89'd99086439528964388384382275;
assign k2 = 89'd175986074495581597606351284;
assign k3 = 89'd246701993219136970637341908;
assign xo = 89'd237483847358316621482009597;
assign zo = 89'd399613166054991988846304673;

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
    //Load k1 in addr 2
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,7'd0,7'd0,7'd2};
    din_1 = k1;
    din_2 = 0;
    @(posedge clk);
    //Load k2 in addr 3
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,7'd0,7'd0,7'd3};
    din_1 = k2;
    din_2 = 0;
    @(posedge clk);
    //Load k3 in addr 4
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,7'd0,7'd0,7'd4};
    din_1 = k3;
    din_2 = 0;
    @(posedge clk);
    
    //Start the operations
    //addr5 = addr0 + addr1 | t0 = x + z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd0,7'd1,7'd5};
    @(posedge clk);
    //addr6 = addr0 - addr1 | t1 = x - z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,7'd0,7'd1,7'd6};
    @(posedge clk);
    //addr7 = addr5 * addr3 | x0 = t0 * K2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd5,7'd3,7'd7};
    @(posedge clk);
    //addr8 = addr6 * addr4 | z0 = t1 * K3
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd6,7'd4,7'd8};
    @(posedge clk);
    //addr5 = addr5 * addr6 | t0 = t0 * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd5,7'd6,7'd5};
    @(posedge clk);
    //addr5 = addr5 * addr2 | t0 = t0 * k1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd5,7'd2,7'd5};
    @(posedge clk);
    //addr6 = addr7 + addr8 | t1 = xo + zo 
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd7,7'd8,7'd6};
    @(posedge clk);
    //addr8 = addr7 - addr8 | zo = xo - zo   
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,7'd7,7'd8,7'd8};
    @(posedge clk);
    //addr6 = addr6 * addr6 | t1 = t1 * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd6,7'd6,7'd6};
    @(posedge clk);
    //addr8 = addr8 * addr8 | zo = zo * zo 
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd8,7'd8,7'd8};
    @(posedge clk);
    //addr7 = addr5 + addr6 | xo = t0 + t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd5,7'd6,7'd7};
    @(posedge clk);
    //addr5 = addr8 - addr5 | t0 = zo - t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,7'd8,7'd5,7'd5};
    @(posedge clk);
    //addr7 = addr7 * addr6 | xo = xo * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd7,7'd6,7'd7};
    @(posedge clk);
    //addr8 = addr8 * addr5 | zo = zo * t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd8,7'd5,7'd8};
    @(posedge clk);
    
    //Get output of addr = 7
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd7,7'd0,7'd0};
    @(posedge clk);
    if (xo != calculated) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | x->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,xo,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 8
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd8,7'd0,7'd0};
    @(posedge clk);
    if (zo != calculated) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | z->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,zo,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end

    @(posedge clk);
    
    $display("4-iso-e correct");
    $finish();
end

endmodule
    