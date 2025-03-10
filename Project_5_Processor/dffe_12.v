module dffe_12(d, q, clk, en, clr);
	//Inputs
   input clk, en, clr;
	input[11:0] d;

   //Output
   output[11:0] q;
	
	genvar i;
	generate
		for(i = 0; i < 12; i = i + 1) begin : dffe_func
			dffe_ref dffe_i(.d(d[i]), .q(q[i]), .clk(clk), .en(en), .clr(clr));
		end
	endgenerate	
	
endmodule