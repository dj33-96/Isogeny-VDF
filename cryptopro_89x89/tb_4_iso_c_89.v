
module tb_4_iso_c_89();

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

wire [89-1:0] x,z;//inputs
wire [89-1:0] a,c,k1,k2,k3;//expected values

assign x = 89'd219513348215526598254688462;
assign z = 89'd311709987135296178519977821;
assign a = 89'd169445174286397496419593991;
assign c = 89'd394587032033149431667857675;
assign k1 = 89'd281346929215585976290483311;
assign k2 = 89'd409777876361213593297602928;
assign k3 = 89'd29248820069839603211773996;

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
    //Start the operations
    //addr5 = addr0 - addr1 | k2 = x - z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,7'd0,7'd1,7'd5};
    @(posedge clk);
    //addr6 = addr0 + addr1 | k3 = x + z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd0,7'd1,7'd6};
    @(posedge clk);
    //addr4 = addr1 * addr1 | k1 = z ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd1,7'd1,7'd4};
    @(posedge clk);
    //addr4 = addr4 + addr4 | k1 = k1 + k1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd4,7'd4,7'd4};
    @(posedge clk);
    //addr3 = addr4 * addr4 | c_iso = k1 ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd4,7'd4,7'd3};
    @(posedge clk);
    //addr4 = addr4 + addr4 | k1 = k1 + k1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd4,7'd4,7'd4};
    @(posedge clk);
    //addr2 = addr0 * addr0 | a_iso = x ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd0,7'd0,7'd2};
    @(posedge clk);
    //addr2 = addr2 + addr2 | a_iso = a_iso + a_iso
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,7'd2,7'd2,7'd2};
    @(posedge clk);
    //addr2 = addr2 * addr1 | a_iso = a_iso * a_iso
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,7'd2,7'd2,7'd2};
    @(posedge clk);
    
    //Get output of addr = 2
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd2,7'd0,7'd0};
    @(posedge clk);
    if (a != calculated) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | a->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,a,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 3
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd3,7'd0,7'd0};
    @(posedge clk);
    if (c != calculated) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | c->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,c,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 4
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd4,7'd0,7'd0};
    @(posedge clk);
    if (k1%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | k1->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,k1,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 5
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd5,7'd0,7'd0};
    @(posedge clk);
    if (k2%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | k2->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,k2,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 6
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,7'd6,7'd0,7'd0};
    @(posedge clk);
    if (k3%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | k3->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,k3,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    @(posedge clk);
    
    $display("4-iso-c correct");
    $finish();
end

endmodule
    