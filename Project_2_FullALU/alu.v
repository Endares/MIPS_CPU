module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
	wire ovf_add, ovf_sub, cout_add, cout_sub;
	wire [31:0] res_add, res_sub, res_and, res_or, res_sll, res_sra;
	
	ADD _add(.a(data_operandA), .b(data_operandB), .cin(ctrl_ALUopcode[0]), .s(res_add), .cout(cout_add), .overflow(ovf_add));	//00000
	SUB _sub(.a(data_operandA), .b(data_operandB), .cin(ctrl_ALUopcode[0]), .s(res_sub), .cout(cout_sub), .overflow(ovf_sub), .isNotEqual(isNotEqual), .isLessThan(isLessThan)); //00001
	alu_AND _and(.a(data_operandA), .b(data_operandB), .res(res_and));	//00010
	alu_OR _or(.a(data_operandA), .b(data_operandB), .res(res_or));	//00011
	SLL _sll(.a(data_operandA), .ctrl_shiftamt(ctrl_shiftamt), .res(res_sll)); //00100
	SRA _sra(.a(data_operandA), .ctrl_shiftamt(ctrl_shiftamt), .res(res_sra));	//00101
	
	mux8_32bit _res(.select(ctrl_ALUopcode[2:0]), .in7(32'h00000000), .in6(32'h00000000), .in5(res_sra), .in4(res_sll), .in3(res_or), .in2(res_and), .in1(res_sub), .in0(res_add), .data_out(data_result));
	
	assign overflow = (ctrl_ALUopcode[0]) ? ovf_sub : ovf_add;
	

endmodule
