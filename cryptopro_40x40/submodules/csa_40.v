
module csa_40 (
    input [39:0] x,y,z,
    output[39:0] c,s 
);

wire dummy;

assign c[0] = 1'b0;
    
assign {c[1],s[0]} = (x[0]+y[0]+z[0]);
assign {c[2],s[1]} = (x[1]+y[1]+z[1]);
assign {c[3],s[2]} = (x[2]+y[2]+z[2]);
assign {c[4],s[3]} = (x[3]+y[3]+z[3]);
assign {c[5],s[4]} = (x[4]+y[4]+z[4]);
assign {c[6],s[5]} = (x[5]+y[5]+z[5]);
assign {c[7],s[6]} = (x[6]+y[6]+z[6]);
assign {c[8],s[7]} = (x[7]+y[7]+z[7]);
assign {c[9],s[8]} = (x[8]+y[8]+z[8]);
assign {c[10],s[9]} = (x[9]+y[9]+z[9]);
assign {c[11],s[10]} = (x[10]+y[10]+z[10]);
assign {c[12],s[11]} = (x[11]+y[11]+z[11]);
assign {c[13],s[12]} = (x[12]+y[12]+z[12]);
assign {c[14],s[13]} = (x[13]+y[13]+z[13]);
assign {c[15],s[14]} = (x[14]+y[14]+z[14]);
assign {c[16],s[15]} = (x[15]+y[15]+z[15]);
assign {c[17],s[16]} = (x[16]+y[16]+z[16]);
assign {c[18],s[17]} = (x[17]+y[17]+z[17]);
assign {c[19],s[18]} = (x[18]+y[18]+z[18]);
assign {c[20],s[19]} = (x[19]+y[19]+z[19]);
assign {c[21],s[20]} = (x[20]+y[20]+z[20]);
assign {c[22],s[21]} = (x[21]+y[21]+z[21]);
assign {c[23],s[22]} = (x[22]+y[22]+z[22]);
assign {c[24],s[23]} = (x[23]+y[23]+z[23]);
assign {c[25],s[24]} = (x[24]+y[24]+z[24]);
assign {c[26],s[25]} = (x[25]+y[25]+z[25]);
assign {c[27],s[26]} = (x[26]+y[26]+z[26]);
assign {c[28],s[27]} = (x[27]+y[27]+z[27]);
assign {c[29],s[28]} = (x[28]+y[28]+z[28]);
assign {c[30],s[29]} = (x[29]+y[29]+z[29]);
assign {c[31],s[30]} = (x[30]+y[30]+z[30]);
assign {c[32],s[31]} = (x[31]+y[31]+z[31]);
assign {c[33],s[32]} = (x[32]+y[32]+z[32]);
assign {c[34],s[33]} = (x[33]+y[33]+z[33]);
assign {c[35],s[34]} = (x[34]+y[34]+z[34]);
assign {c[36],s[35]} = (x[35]+y[35]+z[35]);
assign {c[37],s[36]} = (x[36]+y[36]+z[36]);
assign {c[38],s[37]} = (x[37]+y[37]+z[37]);
assign {c[39],s[38]} = (x[38]+y[38]+z[38]);
assign {dummy,s[39]} = (x[39]+y[39]+z[39]);

endmodule
    