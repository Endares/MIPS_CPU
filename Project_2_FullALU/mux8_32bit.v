module mux8_32bit(select, in7, in6, in5, in4, in3, in2, in1, in0, data_out);

	input [31:0] in7, in6, in5, in4, in3, in2, in1, in0;
	input [2:0] select;
	output [31:0] data_out;
	
	
	assign data_out = select[2] ? (
								select[1] ? (
									select[0] ? in7 : in6
								) : (
									select[0] ? in5 : in4
								)
							) : (
								select[1] ? (
									select[0] ? in3 : in2
								) :(
									select[0] ? in1 : in0
								)
							);
//	assign data_out = select[2] ? 
//                    (select[1] ? (select[0] ? in7 : in6) : (select[0] ? in5 : in4)) :
//                    (select[1] ? (select[0] ? in3 : in2) : (select[0] ? in1 : in0));

	
endmodule