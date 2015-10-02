`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:52 09/25/2015 
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
module PWM(
    input clk,
    input [3:0] PWM_in,
    output PWM_out
);

reg [3:0] cnt;
always @(posedge clk) cnt <= cnt + 1'b1;  // free-running counter

assign ;  // comparator
endmodulePWM_out = (PWM_in > cnt)
