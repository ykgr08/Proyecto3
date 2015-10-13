`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:49 08/09/2015 
// Design Name: 
// Module Name:    Divisor_de_frecuencia 
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
module Divisores_Frecuencia(
	input wire clk,       
	input wire reset,
	output reg s_clk,
	output reg CS
    );
	 
reg [4:0] cuenta2; // s_clk
reg [10:0] cuenta3; // CS 

///////////////////////s_clk = 64 * 48,8kHz/////////////////////////
always @(posedge clk, negedge clk , posedge reset) 
	begin
		if (reset) 
			begin
				s_clk <= 5'd0;
				cuenta2 <= 5'd0;
			end 
		else 
			begin		
				if (cuenta2 == 5'd31)					 
					begin                    
						cuenta2 <= 5'd0;   
						s_clk <= ~s_clk;  
					end 
				else 
					cuenta2 <= cuenta2 + 1'b1; 
			end
	end
 
///////////////////////CS = 48,8kHz/////////////////////////
always @(posedge clk, negedge clk , posedge reset) 
	begin
		if (reset) 
			begin
				CS <= 11'd0;
				cuenta3 <= 11'd0;
			end 
		else 
			begin		
				if (cuenta3 == 11'd2047)					 
					begin                    
						cuenta3 <= 11'd0;   
						CS <= ~CS;  
					end 
				else 
					cuenta3 <= cuenta3 + 1'b1; 
			end
	end
 
endmodule 