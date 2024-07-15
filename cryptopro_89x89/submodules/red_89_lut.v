
module red_89_lut(
    input [2:0] M,
    output reg [89:0] corr_add
);

always @(*) begin: LUT_4_red
 	case(M)
 	3'd0   : corr_add = 0;
 	3'd1   : corr_add = 90'h10000000000000000000000; //2**(DATA_SIZE-1)%p;
 	3'd2   : corr_add = 90'h60c6c30000000000000001; //2**(DATA_SIZE)%p;
 	3'd3   : corr_add = 90'h160c6c30000000000000001; //(2**(DATA_SIZE)+2**(DATA_SIZE-1))%p;
 	3'd4   : corr_add = 90'hc18d860000000000000002; //(2**(DATA_SIZE+1))%p;
 	3'd5   : corr_add = 90'h2254490000000000000003; //(2**(DATA_SIZE+1)+2**(DATA_SIZE-1))%p;
 	3'd6   : corr_add = 90'h12254490000000000000003; //(2**(DATA_SIZE+1)+2**(DATA_SIZE))%p;
 	3'd7   : corr_add = 90'h831b0c0000000000000004; //(2**(SIZE+1)+2**(SIZE)+2**(SIZE-1))%p;
 	default: corr_add = 0;
 	endcase
end

endmodule
    