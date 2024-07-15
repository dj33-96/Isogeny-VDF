
module tb_dbl_1506();

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
reg [1506-1:0] din_1,din_2;
wire [1506-1:0] dout_1,dout_2;
reg [9:0] i;

reg [2:0] INS;
reg [7-1:0] rd_addr_1,rd_addr_2,wr_addr;

assign command_in = {INS,rd_addr_1,rd_addr_2,wr_addr};

wire [1506:0] p, calculated;
assign p = 1507'd1658539334852043956605014686969369842243820155059458240864380460354175875596746126442552006529285980003318752448184629099761975446397870870332614114924526019655624366944770281974501212314250998405682106067115619475132937730960746637418716661215852316737808364060021400361715167852784987427099666051667608448888314571788638487985846716927693574019769274326804364407638203115258648742883949562283207610572974523311143132532016594886767069744238342663307263;
assign calculated = (dout_1 + dout_2) % p;

wire [1506-1:0] x,z,a,c,x_dbl,z_dbl;

assign x = 1506'd1535911245929948905122173636821255078110877988117461682309150983763226942015131571194994457491253569579068767696951781594495147426767922486988861128986219084075733797343070912235010716329869571181296916006815447102445226395519984774764002233089984472417999495741722682726846711237931877972226539084321021196414978209482910427806804546163847936326780934828104916434282557887177503556271226692982457556174218633177200705096332344219269687558905457489677294;
assign z = 1506'd1589347080526913022929735804708804371967498541499825256928437309205264878652309479291684917307361683853193449948760803367195103204020185207754307925345299605752622394097352682194812296758316839181120628611482345895154653110984208155885462984825317564466366295889499395480774181826596286723464615565163981239523562524876302751366625246169146437641140987207917045464139523566978286890126017232748882873990704072226610585445209108509248344354248244516293631;
assign a = 1506'd8;
assign c = 1506'd4;
assign x_dbl = 1506'd977666109827451514662045160593880195303011250905165506353697084705450111535487952290712547520505416785110015467712711963975628995606091797648114437033018666128690679080202006656318840768417414476142889318834735650364894414958940903867205573100638079569167097713129005358228049685604305605151939481912845247251229658132743395601295967542725311093208869933502343417170454369182125283119820749850928851087466905165023095626935306949223482303007337862719439;
assign z_dbl = 1506'd1424410585390992848529633679166551058713272073423790705732173972428933968755097650568424190764476054875925012788479520968485445135036707397823793085157576170993197823244855178260371535193643206071735802730309131789611048065811391767735885535501058171501761653038264875740677831746156397840695194243277361588843281323970539523586076444008207440781026494583990565734447637858864662795783445912107925147556348940890389277143493460969869730582969323133581914;

cryptoprocessor_wrapper_1506 UUT(clk,rst,get_output,data_en,ins_in,command_in,din_1,din_2,dout_1,dout_2);

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
    