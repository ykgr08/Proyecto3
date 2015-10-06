`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////


module Test_ADC_Recepcion;

	// Inputs
	reg SCLK;
	reg reset;
	reg ADCdata;
	reg rx_en;
	reg temp_finish;


	// Outputs
	wire En_temp;
	wire rx_done_tick;
	wire [15:0] b_reg;
	wire [11:0] data_out;
	wire CS;

	// Instantiate the Unit Under Test (UUT)
	ADC_Recepcion uut (
		.SCLK(SCLK), 
		.reset(reset), 
		.ADCdata(ADCdata), 
		.rx_en(rx_en), 
		.temp_finish(temp_finish), 
		.En_temp(En_temp), 
		.rx_done_tick(rx_done_tick), 
		.b_reg(b_reg), 
		.data_out(data_out), 
		.CS(CS)
	);

		integer i,j;
	reg [15:0] datos_txt;
	reg [15:0] Memoria [0:15];
	reg enable_timer;
	initial begin
		// Initialize Inputs
		SCLK= 0;
		reset = 1;
		temp_finish=0;
		ADCdata = 0;
		rx_en = 1;
		enable_timer=0;
		$readmemb("Datos_MarkV.txt",Memoria);
	repeat(5) @(posedge SCLK)
		reset=0;
	end

	initial begin
		@(negedge reset, posedge SCLK)
			for(j=0;j<16;j=j+1)
				begin
				datos_txt=Memoria[j];

				repeat(32)@(posedge SCLK)
				enable_timer=1;
			for (i=0;i==15;i=i+1)
				begin

				@(posedge SCLK)
				ADCdata=datos_txt[i];
				end
			ADCdata=1;
			enable_timer=0;

				end

		end

initial begin
	@(posedge enable_timer)
	while(enable_timer)
	#22700 temp_finish=~temp_finish;
	end

initial forever begin

#709 SCLK =~SCLK;

end
      
endmodule
      


