`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:26 10/13/2015 
// Design Name: 
// Module Name:    Truncador_Suma 
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
//// 1 signo, 10 entera,18 fraccion
//////////////////////////////////////////////////////////////////////////////////
module Truncador_Suma(
	input [28:0] Dato_Filtro,
	output [10:0] resultado);

wire signo = {12{Dato_Filtro[28]}} ;

assign resultado = ( Dato_Filtro[28] == 1 && signo != Dato_Filtro [28:17])? {11'b00000000000}:
						 ( Dato_Filtro[28] == 0 && signo != Dato_Filtro [28:17])? {11'b11111111111}:
						  {~{Dato_Filtro[17]},Dato_Filtro[16:7]};


endmodule
