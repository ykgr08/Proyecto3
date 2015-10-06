`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

module Test_ADC_Recepcion;

	// Inputs
	reg SCLK;
	reg reset;
	reg ADCdata;
	reg rx_en;

	// Outputs
	wire rx_done_tick;
	wire [15:0] b_reg;
	wire [11:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	ADC_Recepcion uut (
		.SCLK(SCLK), 
		.reset(reset), 
		.ADCdata(ADCdata), 
		.rx_en(rx_en), 
		.rx_done_tick(rx_done_tick), 
		.b_reg(b_reg), 
		.data_out(data_out)
	);
	integer i,j;
	reg[15:0] datos_txt;
	reg [15:0] Memoria [0:15]; ///Datos que se encuentran en el txt

	initial begin
		// Initialize Inputs
		SCLK = 0;
		reset = 1;
		ADCdata = 0;
		rx_en = 1;
		$readmemb("Datos_MarkV.txt",Memoria);
	repeat(5) @( negedge SCLK)

		reset=0;
	
	end

	initial begin

		@(negedge reset)
			for(j=0;j<16;j=j+1)
				begin
				datos_txt=Memoria[j];
				for(i=0;i==15;i=i+1)
					begin

						@(negedge SCLK)
						ADCdata=datos_txt[i];

					end

			ADCdata=1;
				end
	end
	

initial forever begin
	#5 SCLK=~SCLK;

	end
      
endmodule

