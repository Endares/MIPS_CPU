module RCA_8bit_pro(a, b, cin, s, cout, overflow);
	input [7:0] a, b;
	input cin;
	output [7:0] s;
	output cout, overflow;
	
	wire CO_1, CO_0;
	wire [7:0] s_1, s_0;
	
	// for overflow detection
	wire w_ovf1, w_ovf0;
	
	RCA_8bit RCA_1(.a(a), .b(b), .cin(1), .s(s_1), .cout(CO_1), .overflow(w_ovf1));
	RCA_8bit RCA_0(.a(a), .b(b), .cin(0), .s(s_0), .cout(CO_0), .overflow(w_ovf0));
	
	assign s = cin ? s_1 : s_0;
	assign cout = cin ? CO_1 : CO_0;
	
	// for overflow detection
	assign overflow = cin ? w_ovf1 : w_ovf0;

endmodule