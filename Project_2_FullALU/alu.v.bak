module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] wb_not, wb_res;
	wire w_cout;
	
	// Perform bitwise NOT operation on each bit of data_operandB
   not G1(wb_not[0], data_operandB[0]);
   not G2(wb_not[1], data_operandB[1]);
   not G3(wb_not[2], data_operandB[2]);
   not G4(wb_not[3], data_operandB[3]);
   not G5(wb_not[4], data_operandB[4]);
   not G6(wb_not[5], data_operandB[5]);
   not G7(wb_not[6], data_operandB[6]);
   not G8(wb_not[7], data_operandB[7]);
   not G9(wb_not[8], data_operandB[8]);
   not G10(wb_not[9], data_operandB[9]);
   not G11(wb_not[10], data_operandB[10]);
   not G12(wb_not[11], data_operandB[11]);
   not G13(wb_not[12], data_operandB[12]);
   not G14(wb_not[13], data_operandB[13]);
   not G15(wb_not[14], data_operandB[14]);
   not G16(wb_not[15], data_operandB[15]);
   not G17(wb_not[16], data_operandB[16]);
   not G18(wb_not[17], data_operandB[17]);
   not G19(wb_not[18], data_operandB[18]);
   not G20(wb_not[19], data_operandB[19]);
   not G21(wb_not[20], data_operandB[20]);
   not G22(wb_not[21], data_operandB[21]);
   not G23(wb_not[22], data_operandB[22]);
   not G24(wb_not[23], data_operandB[23]);
   not G25(wb_not[24], data_operandB[24]);
   not G26(wb_not[25], data_operandB[25]);
   not G27(wb_not[26], data_operandB[26]);
   not G28(wb_not[27], data_operandB[27]);
   not G29(wb_not[28], data_operandB[28]);
   not G30(wb_not[29], data_operandB[29]);
   not G31(wb_not[30], data_operandB[30]);
   not G32(wb_not[31], data_operandB[31]);
	
	assign wb_res = ctrl_ALUopcode[0] ? wb_not : data_operandB;
	
	CSA_32bit adder_32(.a(data_operandA), .b(wb_res), .cin(ctrl_ALUopcode[0]), .s(data_result), .cout(w_cout), .overflow(overflow));
	

endmodule
