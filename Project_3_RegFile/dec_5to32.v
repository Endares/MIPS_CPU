module dec_5to32(in, en, out);
	input [4:0] in;
	input en;
	output [31:0] out;
	
	wire [4:0] not_in;

	not(not_in[0], in[0]);
	not(not_in[1], in[1]);
	not(not_in[2], in[2]);
	not(not_in[3], in[3]);
	not(not_in[4], in[4]);

	and(out[0], not_in[4], not_in[3], not_in[2], not_in[1], not_in[0], en);
	and(out[1], not_in[4], not_in[3], not_in[2], not_in[1], in[0], en);
	and(out[2], not_in[4], not_in[3], not_in[2], in[1], not_in[0], en);
	and(out[3], not_in[4], not_in[3], not_in[2], in[1], in[0], en);
	and(out[4], not_in[4], not_in[3], in[2], not_in[1], not_in[0], en);
	and(out[5], not_in[4], not_in[3], in[2], not_in[1], in[0], en);
	and(out[6], not_in[4], not_in[3], in[2], in[1], not_in[0], en);
	and(out[7], not_in[4], not_in[3], in[2], in[1], in[0], en);
	and(out[8], not_in[4], in[3], not_in[2], not_in[1], not_in[0], en);
	and(out[9], not_in[4], in[3], not_in[2], not_in[1], in[0], en);
	and(out[10], not_in[4], in[3], not_in[2], in[1], not_in[0], en);
	and(out[11], not_in[4], in[3], not_in[2], in[1], in[0], en);
	and(out[12], not_in[4], in[3], in[2], not_in[1], not_in[0], en);
	and(out[13], not_in[4], in[3], in[2], not_in[1], in[0], en);
	and(out[14], not_in[4], in[3], in[2], in[1], not_in[0], en);
	and(out[15], not_in[4], in[3], in[2], in[1], in[0], en);
	and(out[16], in[4], not_in[3], not_in[2], not_in[1], not_in[0], en);
	and(out[17], in[4], not_in[3], not_in[2], not_in[1], in[0], en);
	and(out[18], in[4], not_in[3], not_in[2], in[1], not_in[0], en);
	and(out[19], in[4], not_in[3], not_in[2], in[1], in[0], en);
	and(out[20], in[4], not_in[3], in[2], not_in[1], not_in[0], en);
	and(out[21], in[4], not_in[3], in[2], not_in[1], in[0], en);
	and(out[22], in[4], not_in[3], in[2], in[1], not_in[0], en);
	and(out[23], in[4], not_in[3], in[2], in[1], in[0], en);
	and(out[24], in[4], in[3], not_in[2], not_in[1], not_in[0], en);
	and(out[25], in[4], in[3], not_in[2], not_in[1], in[0], en);
	and(out[26], in[4], in[3], not_in[2], in[1], not_in[0], en);
	and(out[27], in[4], in[3], not_in[2], in[1], in[0], en);
	and(out[28], in[4], in[3], in[2], not_in[1], not_in[0], en);
	and(out[29], in[4], in[3], in[2], not_in[1], in[0], en);
	and(out[30], in[4], in[3], in[2], in[1], not_in[0], en);
	and(out[31], in[4], in[3], in[2], in[1], in[0], en);
	
endmodule