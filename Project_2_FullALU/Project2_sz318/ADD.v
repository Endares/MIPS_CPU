module ADD(a, b, cin, s, cout, overflow);
	input [31:0] a,b;
	input cin;
	output [31:0] s;
	output cout, overflow;
	
	CSA_32bit add_32(.a(a), .b(b), .cin(cin), .s(s), .cout(cout), .overflow(overflow));

endmodule