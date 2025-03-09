module r_port(r_in, r_addr, r_out);
	//input [31:0] r_in [0:31];	// 32bit  32 wires, verilog doesn't support
	input [1023:0] r_in;
	input [4:0] r_addr;
	output [31:0] r_out;
	
	wire [31:0] tristate_en;
   
	// 5-to-32 decoder to generate enable signals
	dec_5to32 w_dec(.in(r_addr), .en(1'b1), .out(tristate_en));
	
	// Generate 32 tristate buffers in parallel
	genvar i;
	generate 
		for(i = 0; i < 32; i = i + 1) begin: _32_tristate_parallel
			tristate_buffer_32 trib32_inst (
				.in(r_in[i*32 +: 32]),	// start from i*32 th bit, expand 32bits
				.en(tristate_en[i]),
				.out(r_out)
			);
		end
	endgenerate

endmodule