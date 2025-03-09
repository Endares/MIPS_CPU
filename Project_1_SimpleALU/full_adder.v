module full_adder(a, b, cin, s, cout);
	input a, b, cin;
	output s, cout;
	wire w1, w2, w3;
	
	xor G1(w1, a, b);
	xor G2(s, w1, cin);
	and G3(w2, w1, cin);
	and G4(w3, a, b);
	or G5(cout, w2, w3);
	
endmodule