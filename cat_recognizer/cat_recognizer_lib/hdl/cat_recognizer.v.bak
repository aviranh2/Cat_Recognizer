//
// Verilog Module cat_recognizer_lib.cat_recognizer
//
// Created:
//          by - avira.UNKNOWN (DESKTOP-U84L200)
//          at - 19:37:22 11/28/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module cat_recognizer (PADDR,
PENABLE,
PSEL,
PWDATA,
PWRITE,
clk,
rst,
PRDATA,
CatRecOut,);
  parameter Amba_Word = 24;
  parameter Amba_Addr_Depth = 13;
  parameter Weight_precision = 5;
  
  input wire PENABLE,PSEL,PWRITE,clk,rst;
  input [Amba_Addr_Depth-1:0] PADDR;
  input [Amba_Word-1:0] PWDATA;
  //input [Weight_Percision-1:0] w_in;
  output[Amba_Word-1:0] PRDATA;
  output CatRecOut;
  
  reg  en_read,en_write;
  wire [Amba_Word-1:0]		 		pixels_bus;
  wire control_reg;
  wire [3*Weight_precision-1:0] 		weights_bus;
  
  reg [Amba_Addr_Depth-1:0] read_address;
  reg [Amba_Addr_Depth-1:0] mem_address;
  reg signed [63:0] last_result;
  reg last_out;
  wire signed [63:0] acc_val;

  integer calculator_delay_counter = 0;
  integer clock_counter = 0;
  reg finish_calc;
  
  assign PRDATA = 24'h000000;
  wire apb_write_enable;
 // assign enable_write = en_write;
  //`include "../bias5.v"
  
  fsm_apb apb_interface(
	.pclock 	( clk ),
	.psel		( PSEL ),
	.penable	( PENABLE ),
	.pwrite 	( PWRITE ),
	.rst		( rst ),
	.enable		( apb_write_enable )
  );
 //   assign PWRITE = PSEL | PENABLE;
  RegisterFile #(
	.DATA_WIDTH(Amba_Word), 
	.Addr_Depth(Amba_Addr_Depth))
  pixel_mem(
	.clock		(clk),
	.rst		(rst),
	.en_write	(apb_write_enable),
	.en_read	(en_read),
	.address	(mem_address),
	.data_in	(PWDATA),
	.data_out	(pixels_bus),
	.control_reg (control_reg)
  );
  
  weights_memory #(
    .DATA_WIDTH(Weight_precision),
	.Addr_Depth(Amba_Addr_Depth))
  weight_mem(
	.clock		(clk),
	.reset		(rst),
	.address	(mem_address-1),
	.en_read	(en_read),
	.data_out	(weights_bus)
  );
  
  NeuronCalculator #(
	.DATA_WIDTH(Amba_Word),
	.Addr_Depth(Amba_Addr_Depth),
	.Weight_Percision(Weight_precision))
  calculator(
	.clock		(clk),
	.reset		(rst),
	.enable		(en_read),
	.get_result	(finish_calc),
	.x			(pixels_bus),
	.w			(weights_bus),
	.neuron_calculator_out		(CatRecOut),
	.acc_val					(acc_val)
	);

	always @(posedge clk)
	begin: MAIN_BLOCK
	clock_counter = clock_counter+1;
	if(control_reg) // start calc is on
	begin
		if(read_address[Amba_Addr_Depth-1])//finish calc
		begin
			if(calculator_delay_counter == 3)
			begin
				finish_calc   <=1'b1;
				last_result	  <= acc_val;
				calculator_delay_counter = calculator_delay_counter + 1;	
			end
			else if(calculator_delay_counter == 4)
			begin
				calculator_delay_counter = calculator_delay_counter + 1;				
			end
			else if(calculator_delay_counter == 5)
			begin
			last_out<=CatRecOut;
				calculator_delay_counter = calculator_delay_counter + 1;
			end
			else if(calculator_delay_counter == 6)
			begin
				en_read 						 <= 1'b0;
				en_write 						 <= 1'b0;
				read_address[Amba_Addr_Depth:1]	 <= {Amba_Addr_Depth{1'b0}}; //reset read address
				read_address[0]					 <= 1'b1;
				
				calculator_delay_counter = 0;
			end
			else
				begin
				calculator_delay_counter = calculator_delay_counter + 1;
				en_read 		<= 1'b1;
				en_write    <= 1'b0;
				read_address 	<= read_address + 1;
				mem_address 	<= read_address[Amba_Addr_Depth-1:0]; // read mode
				finish_calc   <=1'b0;
				end
		end
		else // didnt finish calc yet
		begin
			en_read 		<= 1'b1;
			en_write    <= 1'b0;
			read_address 	<= read_address + 1;
			mem_address 	<= read_address[Amba_Addr_Depth-1:0]; // read mode
			finish_calc   <=1'b0;
		end
		end
	else // in write mode
	begin
		read_address[Amba_Addr_Depth:1]	 	 <= {Amba_Addr_Depth{1'b0}}; //reset read address
		read_address[0]						 <= 1'b1;
		mem_address 						 <= PADDR; //write mode
		en_read 							 <= 1'b0;
		en_write 							 <= apb_write_enable;
		finish_calc   <=1'b0;
		end
	end
	
endmodule