module RCA_8bit(a, b, cin, s, cout, overflow);
	input [7:0] a, b;
	input cin;
	output [7:0] s;
	output cout, overflow;
	
	wire w1, w2, w3, w4, w5, w6, w7;
	
	// for overflow detection
	wire w_ovf;
	
	full_adder FA0(.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(w1));
	full_adder FA1(.a(a[1]), .b(b[1]), .cin(w1), .s(s[1]), .cout(w2));
	full_adder FA2(.a(a[2]), .b(b[2]), .cin(w2), .s(s[2]), .cout(w3));
	full_adder FA3(.a(a[3]), .b(b[3]), .cin(w3), .s(s[3]), .cout(w4));
	full_adder FA4(.a(a[4]), .b(b[4]), .cin(w4), .s(s[4]), .cout(w5));
	full_adder FA5(.a(a[5]), .b(b[5]), .cin(w5), .s(s[5]), .cout(w6));
	full_adder FA6(.a(a[6]), .b(b[6]), .cin(w6), .s(s[6]), .cout(w7));
	full_adder FA7(.a(a[7]), .b(b[7]), .cin(w7), .s(s[7]), .cout(cout));
	
	// for overflow detection
	xor (w_ovf, w7, cout);
	assign overflow = w_ovf;
	
endmodule