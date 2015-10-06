`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

module Test_ADC_Recepcion;

	// Inputs
	reg SDATA;
	reg reset;
	reg CS;
	reg SCLK;

	// Outputs
	wire rx_done_tick;
	wire [15:0] b_reg;
	wire [11:0] data_Out;

	// Instantiate the Unit Under Test (UUT)
	ADC_Recepcion uut (
		.SDATA(SDATA), 
		.reset(reset), 
		.CS(CS), 
		.SCLK(SCLK), 
		.rx_done_tick(rx_done_tick), 
		.b_reg(b_reg), 
		.data_Out(data_Out)
	);

integer i,j;
	reg [15:0] data_txt;
	reg [15:0] Memoria [0:15];
	reg enable_CS;

	initial begin
		// Initialize Inputs
		reset = 1;
		SDATA = 0;
	
		SCLK = 0;
		CS = 1;
		enable_CS = 0;
		$readmemb("Datos.txt",Memoria);
	repeat(5) @(negedge SCLK)
		reset=0;
	end
      
     initial begin
     	@(negedge reset, negedge CS)
     		for(j=0;j<16;j=j+1)
     			begin
     			data_txt=Memoria[j];
			repeat(2)@(negedge SCLK)
				enable_CS = 1;
			
     		for (i=0;i==15;i=i+1)
     			begin

     			@(negedge SCLK)
     			SDATA=data_txt[i];
     			end
     		SDATA=1;
			enable_CS = 0;

     			end
     	end

 initial begin
 @(negedge enable_CS)
	while (enable_CS)
		#1000 CS = ~ CS;
 end

 initial forever begin
  #25 SCLK = ~ SCLK;
 end

endmodule