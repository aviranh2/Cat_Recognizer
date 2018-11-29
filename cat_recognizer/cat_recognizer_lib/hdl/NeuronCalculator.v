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
module NeuronCalculator(x,w,clock,reset,enable,get_result,out1);
    parameter DATA_WIDTH = 24;
	parameter Addr_Depth = 12;
	parameter Weight_Percision = 5;
	input clock,reset,enable,get_result;
	input [DATA_WIDTH-1:0] x;
	input [3*Weight_Percision-1:0] w;
	output out1;
	reg out_r;
	assign out1 = out_r;
	wire signed [31:0] pixelw1,pixelw2,pixelw3;
	reg signed [63:0] acc;
	reg [15:0] w_ext1,w_ext2,w_ext3;
	//reg[63:0] temp;
	
	`include "../hdl/bias5.v"
	always @(posedge clock)
	begin: FIRST_BLOCK
	  b <= b_in;
	if(reset)
	  begin
		acc <= 64'h0000000000000000;
		out_r <= 1'b0;
		end
	else if (get_result)
	  begin
		out_r <= (acc + b > 0);
		acc <= 64'h0000000000000000;
		end
	else if(enable)
	  begin
	    //temp <= {{32{pixelw3[31]}}, pixelw3};
		acc <= acc[62:0]  + pixelw3 +  pixelw2 + pixelw1;
		out_r <= 1'b0;
		end
	end
	
	always @(*)
	begin:SECOND_BLOCK
	w_ext1[15:0] = { {(16-Weight_Percision){w[Weight_Percision-1]}}, w[Weight_Percision-1:0] };
	w_ext2[15:0] = { {(16-Weight_Percision){w[2*Weight_Percision-1]}}, w[2*Weight_Percision-1:Weight_Percision] };
	w_ext3[15:0] = { {(16-Weight_Percision){w[3*Weight_Percision-1]}}, w[3*Weight_Percision-1:2*Weight_Percision] };
	end
	
	Neuron neuron1( 
	.x    ( x[7:0] ), // input
	.w    ( w_ext1 ), // input
	.out1 ( pixelw1 )
	);
	
	Neuron neuron2( 
	.x    ( x[15:8] ), // input
	.w    ( w_ext2 ), // input
	.out1 ( pixelw2 )
	);
	
	Neuron neuron3( 
	.x    ( x[23:16]       ), // input
	.w    ( w_ext3 ), // input
	.out1 ( pixelw3 )
	);

endmodule