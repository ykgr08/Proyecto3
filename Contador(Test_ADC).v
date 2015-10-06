`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:47 09/30/2015 
// Design Name: 
// Module Name:    Contador 
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
module Contador(
input wire clk, reset,
output reg [3:0] out_counter

    );

reg [3:0] new_counter;

always @(negedge clk, posedge reset)

	if(reset==1)

		out_counter=0;

	else

		out_counter=new_counter;

always @(out_counter)

	new_counter=out_counter+4'd1;



endmodule
