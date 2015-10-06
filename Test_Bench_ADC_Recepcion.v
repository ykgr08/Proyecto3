`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:54:43 09/30/2015
// Design Name:   Recepcion
// Module Name:   C:/Users/WIN8/Desktop/Pruebas del ADC/Pruebas_ADC/Test_Bench_Recepcion_YOLO.v
// Project Name:  Pruebas_ADC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Recepcion
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Bench_Recepcion_YOLO;

	// Inputs
	reg SCLK;
	reg CS;
	reg reset;
	reg [15:0] datos;

	// Outputs
	wire rx_done_tick;
	wire [15:0] b_reg;
	wire [11:0] data_Out;

	// Instantiate the Unit Under Test (UUT)
	Recepcion uut (
		.SCLK(SCLK), 
		.CS(CS), 
		.reset(reset), 
		.datos(datos), 
		.rx_done_tick(rx_done_tick), 
		.b_reg(b_reg), 
		.data_Out(data_Out)
	);
	
	integer j;

	reg [15:0] Mem [0:15];

	initial begin
		// Initialize Inputs
		SCLK = 1;
		CS = 1;
		reset = 1;
		datos = 0;

		$readmemb("DatosParalelo.txt",Mem);

		repeat(5) @(posedge SCLK)

		reset=0;

	end

		initial begin

	@(negedge reset)

		for(j=0;j<16;j=j+1)

			begin

				datos=Mem[j];

		repeat(16) @(posedge SCLK);

			end

	$stop;

	end


initial forever begin

	#515 SCLK=~SCLK;

	end


initial forever begin

	#22700 CS=~CS;

	end


	
endmodule

