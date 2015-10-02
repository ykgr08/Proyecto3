`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module Modulo_PWM(
	input clk_in,						//clock for counter
	input [11:0] Dato, 				//control value that
										//defines pulse width
	output reg PWM_out = 1);		//PWM signal out

	reg [11:0] counter = 0;
	
	always@ (posedge clk_in )
		begin
			if ( counter < Dato )
				PWM_out <= 1;
			else
				PWM_out <= 0;
				counter <= counter+1;
		end
endmodule
