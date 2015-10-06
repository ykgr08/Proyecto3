`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:41 09/30/2015 
// Design Name: 
// Module Name:    Paralelo_Serie 
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
module Paralelo_Serie(

input clk,reset,

input [15:0]datos,

output wire salida_serie


    );

wire [3:0] cuenta;


Contador Contador_16bits (
    .clk(clk), 
    .reset(reset), 
    .out_counter(cuenta)
    );
	 
Multiplexor Multiplexor_16x1 (
    .datos(datos), 
    .seleccionador(cuenta), 
    .salida(salida_serie)
	 
    );




endmodule
