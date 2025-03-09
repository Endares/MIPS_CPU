module adder_plus1(in, out);	// plus 1 word, which is the addressable unit
	input [11:0] in;
	output [11:0] out;
	
	wire cout; // useless
	RCA_12bit RCA12_inst(.a(in), .b(12'h001), .cin(0), .s(out), .cout(cout));
	
endmodule
	
	