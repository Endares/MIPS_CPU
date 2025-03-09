module SUB(a, b, cin, s, cout, overflow, isNotEqual, isLessThan);
	input [31:0] a,b;
	input cin;
	output [31:0] s;
	output cout, overflow, isNotEqual, isLessThan;
	
	
	CSA_32bit sub_32(.a(a), .b(~b), .cin(cin), .s(s), .cout(cout), .overflow(overflow));
	
	// deal with isLessThan with overflow
	wire ds;
	xor G_DS(ds, a[31], b[31]);
	wire w1, w2;
	assign w1 = a[31] ? 1'b1 : 1'b0;
	assign w2 = s[31] ? 1'b1 : 1'b0;
	assign isLessThan = ds ? w1 : w2;
	// sign bit is s[31], not cout!
	
	wire [31:0] temp_or;
	
	or G0(temp_or[0], 1'b0, s[0]);	// temp_or[0] = s[0]
	genvar i;
	generate
	  for (i = 1; i < 32; i = i + 1) begin : or_chain
			or G(temp_or[i], temp_or[i-1], s[i]);  // temp_or[i] = temp_or[i-1] | s[i]
	  end
	endgenerate
	
	// temp_or[31] == 1 : true, not equal; temp_or[31] == 0: false, equal.
	assign isNotEqual = (temp_or[31]) ? 1'b1 : 1'b0;	

endmodule