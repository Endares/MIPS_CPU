module dffe_with_clr(d, clk, en, clr, q);
   
   //Inputs
   input d, clk, en, clr;
   
   //Output
   output reg q;

   //Intialize q to 0
   initial
   begin
       q = 1'b0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(posedge clk or posedge clr) begin
       //If clear is high, set q to 0
       if (clr)
           q <= 1'b0;
       //If enable is high, set q to the value of d
       else if (en)
           q <= d;
   end
endmodule
