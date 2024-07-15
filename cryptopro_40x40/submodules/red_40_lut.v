
module red_40_lut(
    input [2:0] M,
    output reg [40:0] corr_add
);

always @(*) begin: LUT_4_red
 	case(M)
 	3'd0   : corr_add = 0;
 	3'd1   : corr_add = 41'h8000000000; //2**(DATA_SIZE-1)%p;
 	3'd2   : corr_add = 41'h7a4039a011; //2**(DATA_SIZE)%p;
 	3'd3   : corr_add = 41'h7480734022; //(2**(DATA_SIZE)+2**(DATA_SIZE-1))%p;
 	3'd4   : corr_add = 41'h6ec0ace033; //(2**(DATA_SIZE+1))%p;
 	3'd5   : corr_add = 41'h6900e68044; //(2**(DATA_SIZE+1)+2**(DATA_SIZE-1))%p;
 	3'd6   : corr_add = 41'h6341202055; //(2**(DATA_SIZE+1)+2**(DATA_SIZE))%p;
 	3'd7   : corr_add = 41'h5d8159c066; //(2**(SIZE+1)+2**(SIZE)+2**(SIZE-1))%p;
 	default: corr_add = 0;
 	endcase
end

endmodule
    