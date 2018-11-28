//
// Verilog Module cat_recognizer_lib.weights_memory
//
// Created:
//          by - avira.UNKNOWN (DESKTOP-U84L200)
//          at - 19:44:52 11/28/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module weights_memory(clock,reset,address,en_read,data_out);
  parameter DATA_WIDTH = 5;
  parameter Addr_Depth = 12;
  
  input wire clock,reset,en_read;
  input [Addr_Depth-1:0] address;
  output [DATA_WIDTH-1:0] data_out;

  
reg signed [3*DATA_WIDTH-1:0] M[(2**Addr_Depth)-1:0];
reg [DATA_WIDTH-1:0] out_val;


always @(posedge clock,posedge reset)
begin
	if(reset)
	begin
	//`include "C:/Users/amitb/Desktop/UNIV/year4/logi/ass/ass1/cat_recognizer/CatRecognizer/CatRecognizer_lib/hdl/weights5.v"
	  `include "../hdl/weights5.v"
	end
	else if(en_read)
		out_val <= M[address];//read from register
		
	else 
         out_val <= {DATA_WIDTH{1'bz}};//give nothing in output if not requested
		

end

assign data_out = out_val;//give the output

endmodule
