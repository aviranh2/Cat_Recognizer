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
module cat_recognizer (PADDR,PENABLE,PSEL,PWDATA,PWRITE,clk,rst,PRDATA,CatRecOut,w_in);
  parameter Amba_Word = 24;
  parameter Amba_Addr_Depth = 12;
  parameter Weightrecision = 5;
  
  input wire PENABLE,PSEL,PWRITE,clk,rst;
  input [Amba_Addr_Depth-1:0] PADDR;
  input [Amba_Word-1:0] PWDATA;
  input [Weight_Percision-1:0] w_in;
  output[Amba_Word-1:0] PRDATA;
  output CatRecOut;
  
  wire en_write, en_read;
  wire [DATA_WIDTH-1:0]		 		pixels_bus, control_reg, b;
  wire [Weight_Percision-1:0] 		weights_bus;
  
  reg [Amba_Word-1:0] b;
  reg [Amba_Addr_Depth:0] read_address;
  reg [Amba_Addr_Depth-1:0] mem_address;
  
  fsm_apb apb_interface(
	.pclock 	( clk ),
	.psel		( PSEL ),
	.penable	( PENABLE ),
	.enable 	( en_write )
  );
  
  RegisterFile #(
	.DATA_WIDTH(Amba_Word), 
	.Addr_Depth(Amba_Addr_Depth))
  pixel_mem(
	.clock		(clk),
	.en_write	(en_write),
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
	.get_result	(address[Amba_Addr_Depth),
	.x			(pixels_bus),
	.b			(),  // need to connect b
	.w			(weights_bus),
	.out		(CatRecOut)
	);

	always @(posedge clock)
	begin
	if(control_reg[0]) // start calc is on
		if(address[Amba_Addr_Depth])//finish calc
			en_read 							 <= 1'b0;
			read_address[Amba_Addr_Depth:1]	 	 <= {Amba_Addr_Depth{1'b0}}; //reset read address
			read_address[0]						 <= 1'b1;
		else // didnt finish calc yet
			en_read 		<= 1'b1;
			read_address 	<= address + 1;
		mem_address 		<= read_address[Amba_Addr_Depth-1:0] // read mode
	else // in write mode
		read_address[Amba_Addr_Depth:1]	 	 <= {Amba_Addr_Depth{1'b0}}; //reset read address
		read_address[0]						 <= 1'b1;
		en_read 	 <= 1'b0;  
		mem_address  <= PADDR; //write mode
	end
	
endmodule