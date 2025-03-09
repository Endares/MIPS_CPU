module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	wire [1023:0] w_q;	// Q output of reg_sets_of_32 
	wire [31:0] w_dec;	// enabling output of dec_5to32
	
	w_port Write_port(.w_addr(ctrl_writeReg), .w_en(ctrl_writeEnable), .w_out(w_dec));
	reg_sets_of_32 Reg_sets(.D(data_writeReg), .clk(clock), .en(w_dec), .clr(ctrl_reset), .Q(w_q));
	
	r_port Read_portA(.r_in(w_q), .r_addr(ctrl_readRegA), .r_out(data_readRegA));
	r_port Read_portB(.r_in(w_q), .r_addr(ctrl_readRegB), .r_out(data_readRegB));
	

endmodule
