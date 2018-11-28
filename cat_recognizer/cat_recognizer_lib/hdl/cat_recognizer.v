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
  wire en_write;
  wire en_read;
  wire temp;
  wire [DATA_WIDTH-1:0] pixels_out;//goes into the calculator
  wire [Weight_Percision-1:0] weights_out;
  
  reg [Amba_Word-1:0] b;
  
  RegisterFile #(
  .DATA_WIDTH(Amba_Word), 
  .Addr_Depth(Amba_Addr_Depth))
  pixel_mem(
  .clock(clk),
  .en_write(en_write),
  .en_read(en_read),
  .address(PADDR),
  .data_in(PWDATA),
  .data_out(pixels_out)
  );
  
  weights_memory #(
    DATA_WIDTH(Weightrecision),
	Addr_Depth(Amba_Addr_Depth))
  weight_mem(
  clock(clk),
  reset(rst),
  address(PADDR),
  en_read(en_read),
  data_out(weights_out)
  );
  
  NeuronCalculator #(
  .DATA_WIDTH(Amba_Word),
  .Addr_Depth(Amba_Addr_Depth),
  .Weight_Percision(Weightrecision))
  calculator(
	.clock(clk),
	.reset(rst),
	.enable(en_read),
	.get_result(temp),
	.x(pixels_out),
	.b(b),
	.w(weights_out),
	.out(CatRecOut)
  );
  
  assign en_write = PSEL&((clk & PWRITE)|(PENABLE & PWRITE));
  assign en_read = PSEL&(clk|PENABLE);
  assign temp = !PENABLE;
endmodule