//
// Verilog Module cat_recognizer_lib.NeuronCalculator
//
// Created:
//          by - avira.UNKNOWN (DESKTOP-U84L200)
//          at - 19:42:39 11/28/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module NeuronCalculator(x,b,w,clock,reset,enable,get_result,out);
    parameter DATA_WIDTH = 24;
	parameter Addr_Depth = 12;
	parameter Weight_Percision = 5;
	input clock,reset,enable,get_result;
	input [DATA_WIDTH-1:0] x,b;
	input [Weight_Percision*3-1:0] w;
	output out;
	
	reg signed [31:0] pixelw1,pixelw2,pixelw3;
	reg signed [64:0] acc;
	reg [15:0] w_ext1,w_ext2,w_ext3;
	
	always @(posedge clock)
	begin
	if(reset)
		acc <= 64'h0000000000000000;
		out <= 1'b0;
	else if (get_result)
		out <= (acc - b > 0);
		acc <= 64'h0000000000000000;
	else if(enable)
		acc <= acc + pixelw3 + pixelw2 + pixelw1;
		out <= 1'b0;
	end
	
	always @(x,w)
	begin
	w_ext1[15:0] = { {(16-Weight_Percision){w[Weight_Percision-1]}}, w[Weight_Percision-1:0] };
	w_ext2[15:0] = { {(16-Weight_Percision){w[2*Weight_Percision-1]}}, w[2*Weight_Percision-1:Weight_Percision] };
	w_ext3[15:0] = { {(16-Weight_Percision){w[3*Weight_Percision-1]}}, w[3*Weight_Percision-1:2*Weight_Percision] };
	end
	
	Neuron neuron1( 
	.x    ( x[7:0] ), // input
	.w    ( w_ext1 ), // input
	.out ( pixelw1 )
	);
	
	Neuron neuron2( 
	.x    ( x[15:8] ), // input
	.w    ( w_ext2 ), // input
	.out ( pixelw2 )
	);
	
	Neuron neuron3( 
	.x    ( x[23:16]       ), // input
	.w    ( w_ext3 ), // input
	.out ( pixelw3 )
	);

endmodule