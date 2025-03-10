module sign_extender_27to32(immed, extend_immed);
	input [26:0] immed;
	output [31:0] extend_immed;
	
	assign extend_immed[26:0] = immed[26:0];
	assign extend_immed[31:27] = (immed[26]) ? 5'b11111 : 5'b00000;
	
endmodule