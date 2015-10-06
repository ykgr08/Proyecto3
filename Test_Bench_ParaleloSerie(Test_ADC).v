`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:37:05 09/30/2015
// Design Name:   Paralelo_Serie
// Module Name:   C:/Users/WIN8/Desktop/Pruebas del ADC/Pruebas_ADC/Test_ParaleloSerie.v
// Project Name:  Pruebas_ADC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Paralelo_Serie
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ParaleloSerie;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] datos;

	// Outputs
	wire salida_serie;

	// Instantiate the Unit Under Test (UUT)
	Paralelo_Serie uut (
		.clk(clk), 
		.reset(reset), 
		.datos(datos), 
		.salida_serie(salida_serie)
	);

	integer j;


	reg[15:0] Mem [0:15];


	initial begin

		datos = 0;

		clk=0;
		
		j=0;

		reset=1;

		$readmemb("DatosParalelo.txt",Mem);

		repeat(5) @(posedge clk)

		reset=0;

	end 

	initial begin

	@(negedge reset)

		for(j=0;j<16;j=j+1)

			begin

				datos=Mem[j];

		repeat(16) @(posedge clk);

			end

	$stop;

	end


initial forever begin

	#5 clk=~clk;

	end

      
endmodule

