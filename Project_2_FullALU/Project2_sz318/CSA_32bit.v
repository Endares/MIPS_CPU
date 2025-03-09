module CSA_32bit(a, b, cin, s, cout, overflow);
	input [31:0] a, b;
	input cin;
	output [31:0] s;
	output cout, overflow;
	
	wire w1, w2, w3;
	
	// for overflow detection
	wire w_unused;	// unused wire can be connected together
	wire w_ovf;
	
	RCA_8bit adder0(.a(a[7:0]), .b(b[7:0]), .cin(cin), .s(s[7:0]), .cout(w1), .overflow(w_unused));
	RCA_8bit_pro adder1(.a(a[15:8]), .b(b[15:8]), .cin(w1), .s(s[15:8]), .cout(w2), .overflow(w_unused));
	RCA_8bit_pro adder2(.a(a[23:16]), .b(b[23:16]), .cin(w2), .s(s[23:16]), .cout(w3), .overflow(w_unused));
	RCA_8bit_pro adder3(.a(a[31:24]), .b(b[31:24]), .cin(w3), .s(s[31:24]), .cout(cout), .overflow(w_ovf));
	
	// for overflow detection
	assign overflow = w_ovf;
	
endmodule