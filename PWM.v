`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:06 10/04/2015 
// Design Name: 
// Module Name:    PWM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Modulo_PWM(
	input clk_in,							//clock for counter
	input [10:0] Dato, 					//control value that
												//defines pulse width
	output reg PWM_out = 1'b1);		//PWM signal out

	reg [10:0] counter = 11'd0;
	
	always@ (posedge clk_in )
		begin
			if ( counter < Dato )
				PWM_out <= 1'b1;
			else
				PWM_out <= 1'b0;
				counter <= counter + 11'd1;
		end
endmodule
