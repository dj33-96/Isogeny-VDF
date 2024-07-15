
module wrapper_1506_tb();

localparam TESTNUM = 100;
localparam W = 40;
localparam L = $rtoi($ceil(W/32.0));

reg clk,rst,get_output,data_en,ins_in;
reg [24-1:0] command_in;
reg [1506-1:0] din_1,din_2;
wire [1506-1:0] dout_1,dout_2;
reg [9:0] i,j;

wire [1506-1:0] p,correction;
wire [1506:0]  test0,test1,test2,calculated,test5;
wire [1506+1:0]  test3;
wire [1506+4:0]  test4;
wire [4518-1:0] test5_pre;
reg r_in1,r_in2;
reg [1506-1:0] random1,random2,random3,random4;
assign calculated = dout_1 + dout_2;
always@(posedge clk)begin
    if(rst)begin
        random1 <= 0;
        random2 <= 0; 
        random3 <= 0;
        random4 <= 0; end
    else if(r_in1)begin
        random1 <= din_1;
        random2 <= din_2; end
    else if(r_in2)begin
        random3 <= din_1;
        random4 <= din_2;end
    else begin
        random1 <= random1;
        random2 <= random2;
        random3 <= random3;
        random4 <= random4; 
    end
end
assign p = 1506'd1658539334852043956605014686969369842243820155059458240864380460354175875596746126442552006529285980003318752448184629099761975446397870870332614114924526019655624366944770281974501212314250998405682106067115619475132937730960746637418716661215852316737808364060021400361715167852784987427099666051667608448888314571788638487985846716927693574019769274326804364407638203115258648742883949562283207610572974523311143132532016594886767069744238342663307263;
assign correction = 1506'd153175072637649841534283577861098304850784522076536998599754781337761079881100990444871960495186289431270665901855384183195135465552681451239531134057673996017913037649348294211751296791899305867240257165350638568905091748109149870828658885359637200768080406877729116506730969432693133667017963413760755238594450479348480666884060543773223574695672981179665005790379181051889481634383538151108061972969222589066463202584147318414719686102597027189751808;
assign test0 = random1 + random2;
assign test1 = random3 + random4;
assign test2 = test0;
assign test3 = test0 + test0;
assign test4 = test3 - test1 + 4*p;
assign test5_pre = test1 * test2 * correction;
assign test5 = (test5_pre % p);

cryptoprocessor_wrapper_1506 UUT(clk,rst,get_output,data_en,ins_in,command_in,din_1,din_2,dout_1,dout_2);

always #1 clk = ~clk;

initial begin
    clk = 0; rst = 0; data_en = 0; ins_in = 0; command_in = 0; get_output = 0; r_in1 = 0; r_in2 = 0;
    @(posedge clk);
    for(i=0; i<TESTNUM; i=i+1) begin
        rst = 1;get_output = 0;
        @(posedge clk);
        rst = 0;
        @(posedge clk);
        //Load data in addr 0
        data_en = 1; ins_in = 1; command_in = 2097152; r_in1 = 1; r_in2 = 0;
        for(j=0; j<L; j=j+1) begin
            din_1[32*j +: 32] = $urandom();
            din_2[32*j +: 32] = $urandom();
        end
        @(posedge clk);
        //Load data in addr 1
        data_en = 1; ins_in = 1; command_in = 2097153; r_in1 = 0; r_in2 = 1;
        for(j=0; j<L; j=j+1) begin
            din_1[32*j +: 32] = $urandom();
            din_2[32*j +: 32] = $urandom();
        end
        @(posedge clk);
        //Copy addr0 -> addr2
        data_en = 0;ins_in = 1; command_in = 4194306; din_1 = 0;din_2 = 0; r_in1 = 0; r_in2 = 0;
        @(posedge clk);
        //addr3 = addr0 + addr0
        data_en = 0;ins_in = 1; command_in = 6291459; din_1 = 0;din_2 = 0;
        @(posedge clk);
        //addr4 = addr3 - addr1
        data_en = 0;ins_in = 1; command_in = 8437892; din_1 = 0;din_2 = 0;
        @(posedge clk);
        //addr5 = addr2 * addr1
        data_en = 0;ins_in = 1; command_in = 10518661; din_1 = 0;din_2 = 0;
        @(posedge clk);
        //Get output of addr = 0 => (0,1)
        get_output = 1; command_in = 0;
        @(posedge clk);
        if (test0%p != calculated%p) begin
            $display("TEST0 for i = %d: FAILED.",i);
            $display("Failed TEST: output = 0x%x,0x%x | expected = 0x%x, calculated = 0x%x",dout_1,dout_2,test0,calculated);
            $stop();
        end
        @(posedge clk);
        //Get output of addr = 1 => (2,3)
        get_output = 1; command_in = 16384;
        @(posedge clk);
        if(test1%p != calculated%p)begin
            $display("TEST1 for i = %d: FAILED.",i);
            $display("Failed TEST: output = 0x%x,0x%x | expected = 0x%x, calculated = 0x%x",dout_1,dout_2,test1,calculated);
            $stop();
        end
        @(posedge clk);
        //Get output of addr = 2 => (4,5)
        get_output = 1; command_in = 32768;
        @(posedge clk);
        if(test2%p != calculated%p)begin
            $display("TEST2 for i = %d: FAILED.",i);
            $display("Failed TEST: output = 0x%x,0x%x | expected = 0x%x, calculated = 0x%x",dout_1,dout_2,test2,calculated);
            $stop();
        end
        @(posedge clk);
        //Get output of addr = 3 => (6,7)
        get_output = 1; command_in = 49152;
        @(posedge clk);
        if((test3 != calculated%p) && (test3%p != calculated%p))begin
            $display("TEST3 for i = %d: FAILED.",i);
            $display("Failed TEST: output = 0x%x,0x%x | expected = 0x%x/0x%x, calculated = 0x%x/0x%x",dout_1,dout_2,test3,test3%p,calculated,calculated%p);
            $stop();
        end
        @(posedge clk);
        //Get output of addr = 4 => (8,9)
        get_output = 1; command_in = 65536;
        @(posedge clk);
        if((test4 != calculated%p) && (test4%p != calculated%p))begin
            $display("TEST4 for i = %d: FAILED.",i);
            $display("Failed TEST: output = 0x%x,0x%x | expected = 0x%x/0x%x, calculated = 0x%x/0x%x",dout_1,dout_2,test4,test4%p,calculated,calculated%p);
            $stop();
        end
        @(posedge clk);
        //Get output of addr = 5 => (10,11)
        get_output = 1; command_in = 81920;
        @(posedge clk);
        if(test5%p != calculated%p)begin
            $display("TEST5 for i = %d: FAILED.",i);
            $display("Failed TEST: output = 0x%x,0x%x | expected = 0x%x, calculated = 0x%x",dout_1,dout_2,test5,calculated);
            $stop();
        end
        @(posedge clk);
        $display("TEST i = %d: PASSED.",i);
    end
    
    $display("All TESTs passed.");
    $finish();
    
    //Load data in addr 0
    /*data_en = 1; ins_in = 1; command_in = 2097152;
    din_1 = $urandom();din_2 = $urandom();
    @(posedge clk);
    //Load data in addr 1
    data_en = 1; ins_in = 1; command_in = 2097153;
    din_1 = $urandom();din_2 = $urandom();
    @(posedge clk);
    //Copy addr0 -> addr2
    data_en = 0;ins_in = 1;command_in = 4194306;din_1 = 0;din_2 = 0;
    @(posedge clk);
    //addr3 = addr0 + addr0
    data_en = 0;ins_in = 1;command_in = 6291459;din_1 = 0;din_2 = 0;
    @(posedge clk);
    //addr4 = addr3 - addr1
    data_en = 0;ins_in = 1;command_in = 8437892;din_1 = 0;din_2 = 0;
    @(posedge clk);
    //addr5 = addr2 * addr1
    data_en = 0;ins_in = 1;command_in = 10518661;din_1 = 0;din_2 = 0;
    @(posedge clk);
    //Get output of addr1
    get_output = 1; command_in = 0;*/
end

endmodule
    