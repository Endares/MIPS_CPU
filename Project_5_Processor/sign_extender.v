module sign_extender(immed, extend_immed);
	input [16:0] immed;
	output [31:0] extend_immed;
	
	assign extend_immed[16:0] = immed[16:0];
	assign extend_immed[31:17] = (immed[16]) ? 15'h7fff : 15'h0000;
	
endmodule