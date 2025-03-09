module reg_sets_of_32(D, clk, en, clr, Q);
	input [31:0] D, en;
	input clk, clr;
	output [1023:0] Q;
	
	
	// Register 0 must always read as 0 (no matter what is written to it, it will output 0)
	reg_32bits reg32_inst0 (
				.d(32'b0),
				.clk(clk),
				.en(en[0]),
				.clr(clr),
				.q(Q[31:0])
				);
				
	genvar i;
	generate 
		for (i = 1; i < 32; i = i + 1) begin : reg_sets
			reg_32bits reg32_inst (
				.d(D),
				.clk(clk),
				.en(en[i]),
				.clr(clr),
				.q(Q[i*32 +: 32])
			);
		end
	endgenerate
	
	
	

endmodule