`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////

module Test_ADC_Recepcion;

	// Inputs
	reg clk_nexys;
	reg reset;
	reg ADCdata;
	reg rx_en;

	// Outputs
	wire rx_done_tick;
	wire [15:0] b_reg;
	wire [11:0] data_out;
	wire CS;
	wire SCLK;

	// Instantiate the Unit Under Test (UUT)
	ADC_Recepcion uut (
		.clk_nexys(clk_nexys), 
		.reset(reset), 
		.ADCdata(ADCdata), 
		.rx_en(rx_en), 
		.rx_done_tick(rx_done_tick), 
		.b_reg(b_reg), 
		.data_out(data_out),
		.CS(CS),
		.SCLK(SCLK)
		
	);
	integer i,j;
	reg [15:0] datos_txt;
	reg [15:0] Memoria [0:15];
	initial begin
		// Initialize Inputs
		clk_nexys = 0;
		reset = 1;
		ADCdata = 0;
		rx_en = 1;
		$readmemb("Datos_MarkV.txt",Memoria);
	repeat(5) @(posedge clk_nexys)
		reset=0;
	end

	initial begin
		@(negedge reset, posedge SCLK)
			for(j=0;j<16;j=j+1)
				begin
				datos_txt=Memoria[j];

			for (i=0;i==15;i=i+1)
				begin

				@(negedge CS)
				ADCdata=datos_txt[i];
				end
			ADCdata=1;

				end

		end


initial forever begin

#10 clk_nexys =~clk_nexys;

end
      
endmodule

