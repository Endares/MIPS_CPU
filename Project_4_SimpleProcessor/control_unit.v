module control_unit (opcode, ALUop, Rwe, Rtarget, ALUinB, DMwe, Rwd, is_R_type, is_ovf_type, ovf_sig);
	input [4:0] opcode, ALUop;
	output Rwe, Rtarget, ALUinB, DMwe, Rwd, is_R_type, is_ovf_type;
	output [31:0] ovf_sig;	// add-1, addi-2, sub-3
	
	// Rwe-Register write enable: sw(00111) - 0; other I/R-type - 1
	assign Rwe = (~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0]) ? 1'b0 : 1'b1;
	
	// Rtarget-Register target: 
	// sw: rt <= $rd, 					(1)
	//	other I/R-type: rt <= $rt, 	(0)
	assign Rtarget = (~opcode[4] & ~opcode[3] & opcode[2] & opcode[1] & opcode[0]) ? 1'b1 : 1'b0;
	
	
	assign is_R_type = opcode[4:0] ? 1'b0 : 1'b1;
	
	// ALUinB-ALU Operand B:
	// R-type: regfile_dataB 	(0)
	// I-type: extended imm	 	(1)
	assign ALUinB = is_R_type ? 1'b0 : 1'b1;
	
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
	
	
endmodule