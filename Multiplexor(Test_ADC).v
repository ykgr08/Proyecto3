`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:50 09/30/2015 
// Design Name: 
// Module Name:    Multiplexor 
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
module Multiplexor(
	input wire [15:0] datos,
	input wire [3:0]seleccionador,
	output reg salida 
    );
always @(seleccionador or datos)

	begin
		case(seleccionador)

		4'd0 : salida = datos[15];
		4'd1 : salida = datos[14];
		4'd2 : salida = datos[13];
		4'd3 : salida = datos[12];
		4'd4 : salida = datos[11];
		4'd5 : salida = datos[10];
		4'd6 : salida = datos[9];
		4'd7 : salida = datos[8];
		4'd8 : salida = datos[7];
		4'd9 : salida = datos[6];
		4'd10 : salida = datos[5];
		4'd11 : salida = datos[4];
		4'd12 : salida = datos[3];
		4'd13 : salida = datos[2];
		4'd14 : salida = datos[1];
		4'd15 : salida = datos[0];

		endcase

	end 

endmodule




