module alu_AND(a, b, res);
	input [31:0] a,b;
	output [31:0] res;
	
	genvar i;
	generate
	  for (i = 0; i < 32; i = i + 1) begin : and_by_bit
			and G(res[i], a[i], b[i]);  // res[i] = a[i] & b[i]
	  end
	endgenerate
	
endmodule