`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:13 09/25/2015 
// Design Name: 
// Module Name:    PWM1 
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
module SimplePWM(
	input clk_in,						//clock for counter
	input [7:0] x_in, 				//control value that
										//defines pulse width
	output reg PWM_out = 1);		//PWM signal out

	reg [7:0] counter = 0;
	
	always@ (posedge clk_in )
		begin
			if ( counter < x_in )
				PWM_out <= 1;
			else
				PWM_out <= 0;
				counter <= counter+1;
		end
endmodule
