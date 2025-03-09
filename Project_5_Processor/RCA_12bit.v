module RCA_12bit(a, b, cin, s, cout);
	input [11:0] a, b;
	input cin;
	output [11:0] s;
	output cout;

	wire [10:0] w;

	full_adder fa_inst0 (
		.a(a[0]),
		.b(b[0]),
		.cin(cin),
		.s(s[0]),
		.cout(w[0])
	);
		

	genvar i;
	generate 
		for (i = 1; i < 11; i = i + 1) begin : RCA
			full_adder fa_inst (
				.a(a[i]),
				.b(b[i]),
				.cin(w[i - 1]),
				.s(s[i]),
				.cout(w[i])
			);
		end
	endgenerate

	full_adder fa_inst11 (
		.a(a[11]),
		.b(b[11]),
		.cin(w[10]),
		.s(s[11]),
		.cout(cout)
	);
 
endmodule