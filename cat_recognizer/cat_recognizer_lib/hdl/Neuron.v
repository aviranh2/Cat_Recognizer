//
// Verilog Module cat_recognizer_lib.Neuron
//
// Created:
//          by - avira.UNKNOWN (DESKTOP-U84L200)
//          at - 19:41:26 11/28/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module Neuron(x,w,out1) ;
	input [7:0] x;
	input [15:0] w;
	output [31:0] out1;
	
//	reg signed [15:0] x_signed; 
//	reg signed [15:0] w_signed;
	reg signed [31:0] c;
	
	always @(*) begin : MAIN_BLOCK
//	 x_signed = {8'h00, x};
//	 w_signed = w;
	 c = w*{8'h00, x};
	end
	
	assign out1 = c;
	
// ### Please start your Verilog code here ### 

endmodule
