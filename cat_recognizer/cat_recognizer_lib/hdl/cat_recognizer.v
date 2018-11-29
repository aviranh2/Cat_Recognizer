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
  parameter Amba_Addr_Depth = 12;
  parameter Weightrecision = 5;
  
  input wire PENABLE,PSEL,PWRITE,clk,rst;
  input [Amba_Addr_Depth-1:0] PADDR;
  input [Amba_Word-1:0] PWDATA;
  //input [Weight_Percision-1:0] w_in;
  output[Amba_Word-1:0] PRDATA;
  output CatRecOut;
  
  reg[0:0]  en_read;
  wire [Amba_Word-1:0]		 		pixels_bus;
  wire control_reg;
  wire [3*Weightrecision-1:0] 		weights_bus;
  
  reg [Amba_Addr_Depth:0] read_address;
  reg [Amba_Addr_Depth-1:0] mem_address;
  
  assign PRDATA = 1'h000000;
  //wire enable_write;
 // assign enable_write = en_write;
  //`include "../bias5.v"
  
  fsm_apb apb_interface(
	.pclock 	( clk ),
	.psel		( PSEL ),
	.penable	( PENABLE ),
	.enable 	( PWRITE )
  );
 //   assign PWRITE = PSEL | PENABLE;
  RegisterFile #(
	.DATA_WIDTH(Amba_Word), 
	.Addr_Depth(Amba_Addr_Depth))
  pixel_mem(
	.clock		(clk),
	.en_write	(PWRITE),
	.en_read	(en_read),
	.address	(mem_address),
	.data_in	(PWDATA),
	.data_out	(pixels_bus),
	.control_reg (control_reg)
  );
  
  weights_memory #(
    .DATA_WIDTH(Weightrecision),
	.Addr_Depth(Amba_Addr_Depth))
  weight_mem(
	.clock		(clk),
	.reset		(rst),
	.address	(mem_address),
	.en_read	(en_read),
	.data_out	(weights_bus)
  );
  
  NeuronCalculator #(
	.DATA_WIDTH(Amba_Word),
	.Addr_Depth(Amba_Addr_Depth),
	.Weight_Percision(Weightrecision))
  calculator(
	.clock		(clk),
	.reset		(rst),
	.enable		(en_read),
	.get_result	(read_address[Amba_Addr_Depth]),
	.x			(pixels_bus),
	.w			(weights_bus),
	.out1		(CatRecOut)
	);
	

  

	always @(posedge clk)
	begin: MAIN_BLOCK
	if(control_reg) // start calc is on
	begin
	//  en_write 	 <= 1'b0;//am i right?(amit)
		if(read_address[Amba_Addr_Depth])//finish calc
		begin
			en_read 							 <= 1'b0;
			read_address[Amba_Addr_Depth:1]	 	 <= {Amba_Addr_Depth{1'b0}}; //reset read address
			read_address[0]						 <= 1'b1;
			end
		else // didnt finish calc yet
		begin
			en_read 		<= 1'b1;
			read_address 	<= read_address + 1;
		mem_address 		<= read_address[Amba_Addr_Depth-1:0]; // read mode
		end
		end
	else // in write mode
	begin
		read_address[Amba_Addr_Depth:1]	 	 <= {Amba_Addr_Depth{1'b0}}; //reset read address
		read_address[0]						 <= 1'b1;
	//	en_write 	 <= 1'b0;  //***am i right?(amit)
		mem_address  <= PADDR; //write mode
		end
	end
	
endmodule