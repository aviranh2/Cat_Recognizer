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
module NeuronCalculator(x,w,clock,reset,enable,get_result,neuron_calculator_out,acc_val);
    parameter DATA_WIDTH = 24;
	parameter Addr_Depth = 12;
	parameter Weight_Percision = 5;
	
	input clock,reset,enable,get_result;
	input [DATA_WIDTH-1:0] x;
	input [3*Weight_Percision-1:0] w;
	output neuron_calculator_out;
	output signed [63:0] acc_val;
	
	reg output_result,start_to_work;
	wire signed [31:0] pixelw1,pixelw2,pixelw3;
	reg signed [63:0] acc,last_acc;
	reg [15:0] w_ext1,w_ext2,w_ext3;
	reg [7:0]	x1,x2,x3;
	
	`include "../hdl/bias5.v"
	always @(posedge clock)
	begin: accomulator_block
	  b <= b_in;
	if(reset)
		begin
		start_to_work <= 1'b0;
		acc <= 64'h0000000000000000;
		output_result <= 1'b0;
		end
	else if (get_result)
		begin
		start_to_work <= 1'b0;
		output_result <= (last_acc + b > 0);
		end
	else if(start_to_work)
		begin
		acc <= acc + pixelw3 +  pixelw2 + pixelw1;
		output_result <= 1'b0;
		end
	start_to_work <= enable;
	end
	
	always @(negedge clock)
	begin
	if(!get_result)
		begin
		last_acc <= acc;
		end
	end
	
	always @(*)
	begin:signed_extansion_to_weights
	w_ext1[15:0] = { {(16-Weight_Percision){w[Weight_Percision-1]}}, w[Weight_Percision-1:0] };
	w_ext2[15:0] = { {(16-Weight_Percision){w[2*Weight_Percision-1]}}, w[2*Weight_Percision-1:Weight_Percision] };
	w_ext3[15:0] = { {(16-Weight_Percision){w[3*Weight_Percision-1]}}, w[3*Weight_Percision-1:2*Weight_Percision] };
	x1 = x[7:0];
	x2 = x[15:8];
	x3 = x[23:16];
	
	end
	
	Neuron neuron1( 
	.x    ( x[7:0] ), // input
	.w    ( w_ext1 ), // input
	.neuron_out ( pixelw1 )
	);
	
	Neuron neuron2( 
	.x    ( x[15:8] ), // input
	.w    ( w_ext2 ), // input
	.neuron_out ( pixelw2 )
	);
	
	Neuron neuron3( 
	.x    ( x[23:16]       ), // input
	.w    ( w_ext3 ), // input
	.neuron_out ( pixelw3 )
	);
	
	assign neuron_calculator_out = output_result;
	assign acc_val = acc;
endmodule