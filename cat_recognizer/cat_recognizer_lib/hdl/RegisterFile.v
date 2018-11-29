//
// Verilog Module cat_recognizer_lib.RegisterFile
//
// Created:
//          by - avira.UNKNOWN (DESKTOP-U84L200)
//          at - 19:44:02 11/28/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module RegisterFile(clock, address,en_write,en_read,data_in,data_out,control_reg);
  parameter DATA_WIDTH = 24;
  parameter Addr_Depth = 12;
  
  input wire clock,en_write,en_read;
  input [Addr_Depth-1:0] address;
  input [DATA_WIDTH-1:0] data_in;
  output [DATA_WIDTH-1:0] data_out;
  output  control_reg;
  
reg [DATA_WIDTH-1:0] registers[(2**Addr_Depth)-1:0];
reg [DATA_WIDTH-1:0] out_val;


always @(posedge clock)
begin: MAIN_BLOCK

	if(en_read)
		out_val <= registers[address];//read from register
	
	else if(en_write)
		registers[address] <= data_in;//write to register
		
	else 
         out_val <= {DATA_WIDTH{1'bz}};//give nothing in output if not requested
		

end


assign data_out = out_val;//give the output
assign control_reg = registers[0][0];


endmodule
