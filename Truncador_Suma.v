`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:26 10/05/2015 
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
// Se utiiza 1 bit de signo , 10 parte entera y 18 fracción
//////////////////////////////////////////////////////////////////////////////////
// RESOLUCION 18  //// Ancho de palabra 29 /// 10 entera
module Truncador_Suma(
    input [28:0] Dato_Filtro,
	 input listo,
	 output [11:0] Dato_Truncado,
	 output [28:0] QuitarW);
	
reg [17:0] dato_temp ;	
	 
always @(posedge listo)

begin
 if ( Dato_Filtro [17:0] == 18'b100000000000000000)   
														 
			 dato_temp = 18'b111111111111111111;  
  
  else
		
			 dato_temp = {~{Dato_Filtro[17]},Dato_Filtro[16:0]}; 
		
end
	
assign Dato_Truncado = dato_temp [17:6]; 
assign QuitarW = Dato_Filtro;


endmodule 