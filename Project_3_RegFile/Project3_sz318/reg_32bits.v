module reg_32bits(d, clk, en, clr, q);
	input [31:0] d;
	input clk, en, clr;
	output [31:0] q;
	
	genvar i;
	generate 
		for (i = 0; i < 32; i = i + 1) begin : reg_32_parallel
			dffe_with_clr dffe_inst (
				.d(d[i]),
				.clk(clk),
				.en(en),
				.clr(clr),
				.q(q[i])
			);
		end
	endgenerate
endmodule