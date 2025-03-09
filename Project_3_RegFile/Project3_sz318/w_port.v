module w_port(w_addr, w_en, w_out);
	input [4:0] w_addr;
	input w_en;
	output [31:0] w_out;
	
	dec_5to32 w_dec(.in(w_addr), .en(w_en), .out(w_out));
	
	
endmodule