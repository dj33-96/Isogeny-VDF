# -*- coding: utf-8 -*-
"""
Created on Mon Jul  1 22:28:50 2024

@author: David1
"""
from ecc_functions import *
from random import *

def print_dbl_tb(W,p,Num,correction,k,dir_name=""):
    M = 2*W
    C = 3 + 3* Num
    INS_1 = 2**Num
    INS_2 = 2**(Num*2)
    INS_3 = 2**(Num*3)
    N = 2**(W+3)
    correction = pow(N,-1,p)
    #Generate Point
    x,z = randint(0,p),randint(0,p)
    #To select a random cuve, set curve to false
    curve = True
    if curve:
        #Standard E(A): y**2 = x**3 + 6*x + x curve
        a,c = 8,4
    else:
        a,c = randint(0,p),randint(0,p)
    x_dbl,z_dbl = dbl(x, z, a, c, p, correction)
    x_dbl,z_dbl = (x_dbl)%p,(z_dbl)%p
    module_name = "dbl_{}_tb".format(W)
    S = """
module """+module_name+"""();

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
wire ["""+str(C)+"""-1:0] command_in;
reg ["""+str(W)+"""-1:0] din_1,din_2;
wire ["""+str(W)+"""-1:0] dout_1,dout_2;
reg [9:0] i;

reg [2:0] INS;
reg ["""+str(Num)+"""-1:0] rd_addr_1,rd_addr_2,wr_addr;

assign command_in = {INS,rd_addr_1,rd_addr_2,wr_addr};

//The calculated wire is the output of the cryptoprocessor
wire ["""+str(W)+""":0] calculated,p,calculated_modp;

assign calculated = dout_1 + dout_2;
assign calculated_modp = calculated%p;

assign p = """+str(W)+"""'d"""+str(p)+""";

/*
    x,z : represent your input point in projective coordinate
    a,c : represent your input curve in projective coordinate
    x_dbl,z_dbl : the double of the point (x,z) in (a,c)
*/

wire ["""+str(W)+"""-1:0] x,z,a,c,x_dbl,z_dbl;

assign x = """+str(W)+"""'d"""+str(x)+""";
assign z = """+str(W)+"""'d"""+str(z)+""";
assign a = """+str(W)+"""'d"""+str(a)+""";
assign c = """+str(W)+"""'d"""+str(c)+""";
assign x_dbl = """+str(W)+"""'d"""+str(x_dbl)+""";
assign z_dbl = """+str(W)+"""'d"""+str(z_dbl)+""";

cryptoprocessor_wrapper_"""+str(W)+""" UUT(clk,rst,get_output,data_en,ins_in,command_in,din_1,din_2,dout_1,dout_2);

always #1 clk = ~clk;

initial begin
    clk = 0; rst = 0; data_en = 0; ins_in = 0; get_output = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    rst = 1;get_output = 0;
    @(posedge clk);
    rst = 0;
    @(posedge clk);
    //Load x in addr 0
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    din_1 = x;
    din_2 = 0;
    @(posedge clk);
    //Load z in addr 1
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1};
    din_1 = z;
    din_2 = 0;
    @(posedge clk);
    //Load a in addr 2
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d2};
    din_1 = a;
    din_2 = 0;
    @(posedge clk);
    //Load c in addr 3
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d3};
    din_1 = c;
    din_2 = 0;
    @(posedge clk);
    //Start the operations
    //addr4 = addr0 - addr1 | t0 = x - z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1,"""+str(Num)+"""'d4};
    @(posedge clk);
    //addr5 = addr0 + addr1 | t1 = x + z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr4 = addr4 * addr4 | t0 = t0 ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d4,"""+str(Num)+"""'d4,"""+str(Num)+"""'d4};
    @(posedge clk);
    //addr5 = addr5 * addr5 | t1 = t1 ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d5,"""+str(Num)+"""'d5,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr7 = addr3 * addr4 | z_dbl = c * t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d3,"""+str(Num)+"""'d4,"""+str(Num)+"""'d7};
    @(posedge clk);
    //addr6 = addr7 * addr5 | x = z * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d7,"""+str(Num)+"""'d5,"""+str(Num)+"""'d6};
    @(posedge clk);
    //addr5 = addr5 * addr4 | t1 = t1 - t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,"""+str(Num)+"""'d5,"""+str(Num)+"""'d4,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr4 = addr2 * addr5 | t0 = a * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d2,"""+str(Num)+"""'d5,"""+str(Num)+"""'d4};
    @(posedge clk);
    //addr7 = addr7 + addr4 | z_dbl = z_dbl + t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d7,"""+str(Num)+"""'d4,"""+str(Num)+"""'d7};
    @(posedge clk);
    //addr7 = addr7 * addr5 | z_dbl = z_dbl * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d7,"""+str(Num)+"""'d5,"""+str(Num)+"""'d7};
    @(posedge clk);
    
    //Get output of addr = 6
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d6,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if (x_dbl%p != calculated%p) begin
        $display("TEST for dbl(x): FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | dbl(x) = 0x%x, calculated = 0x%x",dout_1,dout_2,x_dbl,calculated);
        $display("Failed TEST: inputs: x,z,a,c = 0x%x,0x%x,0x%x,0x%x",x,z,a,c);
        $stop();
    end
    //Get output of addr = 7
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d7,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if(z_dbl%p != calculated%p)begin
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
    """
    # write to file
    f = open(dir_name+module_name+".v",'w')
    f.write(S)
    f.close()

def print_iso_4_c_tb(W,p,Num,correction,dir_name=""):
    M = 2*W
    C = 3 + 3* Num
    INS_1 = 2**Num
    INS_2 = 2**(Num*2)
    INS_3 = 2**(Num*3)
    N = 2**(W+3)
    correction = pow(N,-1,p)
    #Generate Point
    x,z = randint(0,p),randint(0,p)
    
    a,c,k1,k2,k3 = iso_4_c(x, z, p, correction)
    module_name = "4_iso_c_{}_tb".format(W)
    S = """
module """+module_name+"""();

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
wire ["""+str(C)+"""-1:0] command_in;
reg ["""+str(W)+"""-1:0] din_1,din_2;
wire ["""+str(W)+"""-1:0] dout_1,dout_2;

reg [2:0] INS;
reg ["""+str(Num)+"""-1:0] rd_addr_1,rd_addr_2,wr_addr;

assign command_in = {INS,rd_addr_1,rd_addr_2,wr_addr};

//The calculated wire is the output of the cryptoprocessor
wire ["""+str(W)+""":0] calculated,p,calculated_modp;

assign calculated = dout_1 + dout_2;
assign calculated_modp = calculated%p;

assign p = """+str(W)+"""'d"""+str(p)+""";

/*
    x,z : represent your input point of order 4 in projective coordinate
    a,c : represent your output curve in projective coordinate
    k1,k2,k3 : 3 outputs parameters use for the point evaluation
*/

wire ["""+str(W)+"""-1:0] x,z;//inputs
wire ["""+str(W)+"""-1:0] a,c,k1,k2,k3;//expected values

assign x = """+str(W)+"""'d"""+str(x)+""";
assign z = """+str(W)+"""'d"""+str(z)+""";
assign a = """+str(W)+"""'d"""+str(a)+""";
assign c = """+str(W)+"""'d"""+str(c)+""";
assign k1 = """+str(W)+"""'d"""+str(k1)+""";
assign k2 = """+str(W)+"""'d"""+str(k2)+""";
assign k3 = """+str(W)+"""'d"""+str(k3)+""";

cryptoprocessor_wrapper_"""+str(W)+""" UUT(clk,rst,get_output,data_en,ins_in,command_in,din_1,din_2,dout_1,dout_2);

always #1 clk = ~clk;

initial begin
    clk = 0; rst = 0; data_en = 0; ins_in = 0; get_output = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    rst = 1;get_output = 0;
    @(posedge clk);
    rst = 0;
    @(posedge clk);
    //Load x in addr 0
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    din_1 = x;
    din_2 = 0;
    @(posedge clk);
    //Load z in addr 1
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1};
    din_1 = z;
    din_2 = 0;
    @(posedge clk);
    //Start the operations
    //addr5 = addr0 - addr1 | k2 = x - z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr6 = addr0 + addr1 | k3 = x + z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1,"""+str(Num)+"""'d6};
    @(posedge clk);
    //addr4 = addr1 * addr1 | k1 = z ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d1,"""+str(Num)+"""'d1,"""+str(Num)+"""'d4};
    @(posedge clk);
    //addr4 = addr4 + addr4 | k1 = k1 + k1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d4,"""+str(Num)+"""'d4,"""+str(Num)+"""'d4};
    @(posedge clk);
    //addr3 = addr4 * addr4 | c_iso = k1 ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d4,"""+str(Num)+"""'d4,"""+str(Num)+"""'d3};
    @(posedge clk);
    //addr4 = addr4 + addr4 | k1 = k1 + k1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d4,"""+str(Num)+"""'d4,"""+str(Num)+"""'d4};
    @(posedge clk);
    //addr2 = addr0 * addr0 | a_iso = x ^ 2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d2};
    @(posedge clk);
    //addr2 = addr2 + addr2 | a_iso = a_iso + a_iso
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d2,"""+str(Num)+"""'d2,"""+str(Num)+"""'d2};
    @(posedge clk);
    //addr2 = addr2 * addr1 | a_iso = a_iso * a_iso
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d2,"""+str(Num)+"""'d2,"""+str(Num)+"""'d2};
    @(posedge clk);
    
    //Get output of addr = 2
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d2,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if (a%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | a->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,a,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 3
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d3,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if (c%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | c->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,c,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 4
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d4,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if (k1%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | k1->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,k1,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 5
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d5,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if (k2%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | k2->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,k2,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 6
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d6,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
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
    """
    # write to file
    f = open(dir_name+module_name+".v",'w')
    f.write(S)
    f.close()

def print_iso_4_e_tb(W,p,Num,correction,dir_name=""):
    M = 2*W
    C = 3 + 3* Num
    INS_1 = 2**Num
    INS_2 = 2**(Num*2)
    INS_3 = 2**(Num*3)
    N = 2**(W+3)
    correction = pow(N,-1,p)
    #Generate Point
    x,z = randint(0,p),randint(0,p)
    #Generate last inputs
    k1,k2,k3 = randint(0,p),randint(0,p),randint(0,p)
    x0,z0 = iso_4_e(x, z, k1, k2, k3, p, correction)
    module_name = "4_iso_e_{}_tb".format(W)
    S = """
module """+module_name+"""();

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
wire ["""+str(C)+"""-1:0] command_in;
reg ["""+str(W)+"""-1:0] din_1,din_2;
wire ["""+str(W)+"""-1:0] dout_1,dout_2;

reg [2:0] INS;
reg ["""+str(Num)+"""-1:0] rd_addr_1,rd_addr_2,wr_addr;

assign command_in = {INS,rd_addr_1,rd_addr_2,wr_addr};

//The calculated wire is the output of the cryptoprocessor
wire ["""+str(W)+""":0] calculated,p,calculated_modp;

assign calculated = dout_1 + dout_2;
assign calculated_modp = calculated%p;

assign calculated = dout_1 + dout_2;

assign p = """+str(W)+"""'d"""+str(p)+""";

/*
    x,z : represent your input point in projective coordinate
    k1,k2,k3 : 3 inputs parameters use for the point evaluation
    xo,zo : represent your output point in projective coordinate
*/
wire ["""+str(W)+"""-1:0] x,z,k1,k2,k3;//inputs
wire ["""+str(W)+"""-1:0] xo,zo;//expected values

assign x = """+str(W)+"""'d"""+str(x)+""";
assign z = """+str(W)+"""'d"""+str(z)+""";
assign k1 = """+str(W)+"""'d"""+str(k1)+""";
assign k2 = """+str(W)+"""'d"""+str(k2)+""";
assign k3 = """+str(W)+"""'d"""+str(k3)+""";
assign xo = """+str(W)+"""'d"""+str(x0)+""";
assign zo = """+str(W)+"""'d"""+str(z0)+""";

cryptoprocessor_wrapper_"""+str(W)+""" UUT(clk,rst,get_output,data_en,ins_in,command_in,din_1,din_2,dout_1,dout_2);

always #1 clk = ~clk;

initial begin
    clk = 0; rst = 0; data_en = 0; ins_in = 0; get_output = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    rst = 1;get_output = 0;
    @(posedge clk);
    rst = 0;
    @(posedge clk);
    //Load x in addr 0
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    din_1 = x;
    din_2 = 0;
    @(posedge clk);
    //Load z in addr 1
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1};
    din_1 = z;
    din_2 = 0;
    @(posedge clk);
    //Load k1 in addr 2
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d2};
    din_1 = k1;
    din_2 = 0;
    @(posedge clk);
    //Load k2 in addr 3
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d3};
    din_1 = k2;
    din_2 = 0;
    @(posedge clk);
    //Load k3 in addr 4
    data_en = 1; ins_in = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd1,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0,"""+str(Num)+"""'d4};
    din_1 = k3;
    din_2 = 0;
    @(posedge clk);
    
    //Start the operations
    //addr5 = addr0 + addr1 | t0 = x + z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr6 = addr0 - addr1 | t1 = x - z
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,"""+str(Num)+"""'d0,"""+str(Num)+"""'d1,"""+str(Num)+"""'d6};
    @(posedge clk);
    //addr7 = addr5 * addr3 | x0 = t0 * K2
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d5,"""+str(Num)+"""'d3,"""+str(Num)+"""'d7};
    @(posedge clk);
    //addr8 = addr6 * addr4 | z0 = t1 * K3
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d6,"""+str(Num)+"""'d4,"""+str(Num)+"""'d8};
    @(posedge clk);
    //addr5 = addr5 * addr6 | t0 = t0 * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d5,"""+str(Num)+"""'d6,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr5 = addr5 * addr2 | t0 = t0 * k1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d5,"""+str(Num)+"""'d2,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr6 = addr7 + addr8 | t1 = xo + zo 
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d7,"""+str(Num)+"""'d8,"""+str(Num)+"""'d6};
    @(posedge clk);
    //addr8 = addr7 - addr8 | zo = xo - zo   
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,"""+str(Num)+"""'d7,"""+str(Num)+"""'d8,"""+str(Num)+"""'d8};
    @(posedge clk);
    //addr6 = addr6 * addr6 | t1 = t1 * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d6,"""+str(Num)+"""'d6,"""+str(Num)+"""'d6};
    @(posedge clk);
    //addr8 = addr8 * addr8 | zo = zo * zo 
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d8,"""+str(Num)+"""'d8,"""+str(Num)+"""'d8};
    @(posedge clk);
    //addr7 = addr5 + addr6 | xo = t0 + t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd3,"""+str(Num)+"""'d5,"""+str(Num)+"""'d6,"""+str(Num)+"""'d7};
    @(posedge clk);
    //addr5 = addr8 - addr5 | t0 = zo - t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd4,"""+str(Num)+"""'d8,"""+str(Num)+"""'d5,"""+str(Num)+"""'d5};
    @(posedge clk);
    //addr7 = addr7 * addr6 | xo = xo * t1
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d7,"""+str(Num)+"""'d6,"""+str(Num)+"""'d7};
    @(posedge clk);
    //addr8 = addr8 * addr5 | zo = zo * t0
    data_en = 0;ins_in = 1; din_1 = 0;din_2 = 0;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd5,"""+str(Num)+"""'d8,"""+str(Num)+"""'d5,"""+str(Num)+"""'d8};
    @(posedge clk);
    
    //Get output of addr = 7
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d7,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if (xo%p != calculated%p) begin
        $display("TEST for 4_iso_c: FAILED.");
        $display("Failed TEST: output = 0x%x,0x%x | x->4_iso_c = 0x%x, calculated = 0x%x",dout_1,dout_2,xo,calculated);
        $display("Failed TEST: inputs: x,z = 0x%x,0x%x",x,z);
        $stop();
    end
    //Get output of addr = 8
    get_output = 1;
    {INS,rd_addr_1,rd_addr_2,wr_addr} = {3'd0,"""+str(Num)+"""'d8,"""+str(Num)+"""'d0,"""+str(Num)+"""'d0};
    @(posedge clk);
    if (zo%p != calculated%p) begin
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
    """
    # write to file
    f = open(dir_name+module_name+".v",'w')
    f.write(S)
    f.close()