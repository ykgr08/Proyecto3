`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Iron Pirate
// Engineer: Edgar Campos Duarte
// 
// Create Date:    21:19:30 09/18/2015 
// Design Name: 
// Module Name:    ADC_3 
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
module ADC_3(
input wire SCLK,reset, ///Clock de la con la 40 la frecuencia de muestreo y reset


input wire ADCdata,rx_en,/// Datos que provienen del ADC, Clock del Adc y habilitador de recibimiento de datos

input wire temp_finish,

output reg En_temp,

output reg rx_done_tick, ///Bandera que indica que ya todos los datos fueren recibidos

output reg [15:0] b_reg, ///Variable donde se almacenan los 16 datos provenientes del ADC

output wire [11:0] data_out,///Datos que realmente necesito del ADC

output wire CS

    );


//Symbolic state declaration

localparam [1:0]
	idle = 2'b00,
	dps= 2'b01,   ///Estado de la maquina
	load= 2'b10,
	temp=2'b11;

///Declaracion de las señales

reg [1:0] state_reg,state_next; ///Variables para cambiar de  estado


reg [3:0] n_reg,n_next;  /// Leavan la cuenta de cuatos datos se han lamacenado, deben se nueve 12 datos,
//por lo que en cada ciclo n se le ira disminuyendo un 1

reg [15:0] b_next; ///Variable donde se almacenan los datos provenientes del ADC

reg CS_reg,CS_next;


///Máquina de estados que se encarga de recibir los datos

always @(posedge reset , posedge SCLK)    /////Aqui se inicializan los estados y se actualizan las variables
	if (reset)
		begin
		state_reg <= idle;
		n_reg <= 4'b00000;
		b_reg <= 5'b00000;
		CS_reg<=1;
		end
	else
		begin
			state_reg <= state_next;
			n_reg <= n_next;
			b_reg <= b_next;
			CS_reg<=CS_next;

		end

///Parte combinacional

always @*
begin
	state_next = state_reg; //Se actualiza la variable de estado
	rx_done_tick=1'b0;  //Se incializa la bandera
	n_next=n_reg; //Se actualiza la variable que lleva la cuenta de las variables que son empaquetadas
	b_next=b_reg; /// Aqui se almacenan los datos que son enviados del ADC
	CS_next =CS_reg;
	En_temp=1'b1;
	case(state_reg)

		idle:
			if(rx_en & CS_next)

				begin

				//Shift in star bit

				b_next = {b_reg[14:0],ADCdata};//Se mete el primer cero en el paquete de datos

				n_next=4'd14; //Se pone el valor 13 en la variable para luego ser decrementado, de forma que se tenga un control de los datos que son
				//empaquetados

				state_next =dps;  //Se pasa al estado dps
			
				CS_next =0;

				end

		dps: //3 ceros + 12 data 

			

				begin
					b_next= {b_reg[14:0],ADCdata}; //Se empaquetan los 3 ceros y los 12 datos que se desean toamr del ADC

					if(n_reg==4'd0)

						state_next =load;

					else
						n_next = n_reg-4'b0001;

				end

		load: // extra clock to complete the last shift

			begin
				state_next =temp;
				rx_done_tick='b1;
				CS_next =1'b1;
				En_temp=1'b0;
			end
			
		temp:

			if(temp_finish)
			begin
				state_next=idle;
				En_temp=1'b1;
				CS_next=1'b1;
			end
			else
			begin
				state_next=temp;
				En_temp=1'b0;
				CS_next=1'b1;
			end
		default 
		
			state_next =idle;
			
			

		endcase

	end

	assign data_out = b_reg[11:0]; //Aqui se asigan los 12 datos que se necesitan del ADC

	assign CS=CS_reg;

endmodule
