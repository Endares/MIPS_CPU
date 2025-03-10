module PS2_Interface(inclock, resetn, ps2_clock, ps2_data, ps2_key_data, ps2_received_data, last_data_received, ps2_key_pressed);

	input 			inclock, resetn;
	inout 			ps2_clock, ps2_data;
	output 			ps2_received_data;
	output 	[7:0] 	ps2_key_data;
	output 	[7:0] 	last_data_received;
	output		 	ps2_key_pressed;

	// Internal Registers
	reg			[7:0]	last_data_received;	
	
	always @(posedge inclock)
	begin
		if (resetn == 1'b0)
			last_data_received <= 8'h00;
		else if (ps2_received_data == 1'b1)
			last_data_received <= ps2_key_data;
	end
	
	PS2_Controller PS2 (.CLOCK_50 			(inclock),
						.reset 				(~resetn),
						.PS2_CLK			(ps2_clock),
						.PS2_DAT			(ps2_data),		
						.received_data		(ps2_key_data),
						.received_data_en	(ps2_received_data),
						.key_pressed		(ps2_key_pressed)
						);

endmodule
