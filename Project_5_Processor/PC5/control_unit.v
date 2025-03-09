module control_unit (opcode, ALUop, Rwe, Rtarget, ALUinB, DMwe, Rwd, is_R_type, is_ovf_type, ovf_sig,
							setx, bne, blt, j1, j2, jal, bex);
	input [4:0] opcode, ALUop;
	output Rwe, Rtarget, ALUinB, DMwe, Rwd, is_R_type, is_ovf_type;
	output [31:0] ovf_sig;	// add-1, addi-2, sub-3
	// PC5 extension
	output setx, bne, blt, j1, j2, jal, bex;
	
	assign is_R_type = opcode[4:0] ? 1'b0 : 1'b1;
	
	// DMwe-DataMem write enable
	// sw 	(1)
	// else 	(0)
	assign DMwe = (~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0]) ? 1'b1 : 1'b0;
	
	// Rwd-Register write data
	// lw(01000): q_dmem			(1)
	// else: ALU's data_out		(0)
	assign Rwd = (~opcode[4] & opcode[3] & ~opcode[2] & ~opcode[1] & ~opcode[0]) ? 1'b1 : 1'b0;
	
	// overflow:
	// add(00000 00000): ovf_sig = 32'd1
	// addi(00101): ovf_sig = 32'd2
	// sub(00000 00001): ovf_sig = 32'd3
	assign is_ovf_type = ((is_R_type & ~ALUop[4] & ~ALUop[3] & ~ALUop[2] & ~ALUop[1]) 
								| (~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0])) ? 1'b1 : 1'b0;
								
	assign ovf_sig = (is_R_type & ~ALUop[4] & ~ALUop[3] & ~ALUop[2] & ~ALUop[1] & ~ALUop[0]) ? 32'd1 :
						  ((is_R_type & ~ALUop[4] & ~ALUop[3] & ~ALUop[2] & ~ALUop[1] & ALUop[0]) ? 32'd3 :
						  ((~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0]) ? 32'd2 : 32'd0));
	
	// PC5 extension
	// setx 10101
	assign setx = (opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & opcode[0]) ? 1'b1 : 1'b0;
	
	// bne(00010)
	assign bne = (~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & ~opcode[0]) ? 1'b1 : 1'b0;
	
	// blt(00110)
	assign blt = (~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & ~opcode[0]) ? 1'b1 : 1'b0;
	
	// j1: j(00001), jal(00011) : 000x1
	assign j1 = (~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[0]) ? 1'b1 : 1'b0;
	
	// j2: jr(0010)
	assign j2 = (~opcode[4] & ~opcode[3] & opcode[2] & ~opcode[1] & ~opcode[0]) ? 1'b1 : 1'b0;
	
	// jal: 00011
	assign jal = (~opcode[4] & ~opcode[3] & ~opcode[2] & opcode[1] & opcode[0]) ? 1'b1 : 1'b0;
	
	// bex: 10110
	assign bex = (opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & ~opcode[0]) ? 1'b1 : 1'b0;
	
	// Rwe-Register write enable: 
	// sw(00111) - 0; other I/R-type - 1
	// PC5 extension: 
	// j(00001), bne, blt, jr(j2), bex(10110): 0
	assign Rwe = ((~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0]) | 
					 (~opcode[4] & ~opcode[3] & ~opcode[2] & ~opcode[1] & opcode[0]) | bne | blt | bex) ? 1'b0 : 1'b1;
	
	// Rtarget-Register target: 
	// sw, bne, blt, j2(jr): rt <= $rd 	(1)
	//	other I/R-type: rt <= $rt  		(0)
	assign Rtarget = ((~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0]) | bne | blt | j2) ? 1'b1 : 1'b0;
	
	// ALUinB-ALU Operand B:
	// R-type, bne, blt,: regfile_dataB 	(0)
	// bex: regfile_data							(0)
	// other I-type: extended imm 			(1)
	// other J-type: don't care				(1)
	assign ALUinB = (is_R_type | blt | bne | bex) ? 1'b0 : 1'b1;
	
	
endmodule