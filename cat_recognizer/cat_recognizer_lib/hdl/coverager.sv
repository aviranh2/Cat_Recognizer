//
// Verilog Module cat_recognizer_lib.coverager
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 13:33:06 15/12/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module coverager#(
  parameter Amba_Word = 24,
  parameter Amba_Addr_Depth = 13,
  parameter Weight_precision = 5
)
(
  cat_recognizer_interface.checkr_coveragr coverager_Interface
);

covergroup cg @(posedge coverager_Interface.clk);
  rst_counter      : coverpoint coverager_Interface.rst
{
	bins high = {1};
	bins low = {0};
}

  PSEL_counter      : coverpoint coverager_Interface.PSEL
{
	bins high = {1};
	bins low = {0};
}

  PENABLE_counter      : coverpoint coverager_Interface.PENABLE
{
	bins high = {1};
	bins low = {0};
}

  PWRITE_counter      : coverpoint coverager_Interface.PWRITE
{
	bins high = {1};
	bins low = {0};
}

 address : coverpoint coverager_Interface.PADDR 
 {
	bins low = {[1500:0]};	   
	bins med = {[3000:1501]};	   
	bins high = {[4096:3001]};	   

 }

endgroup


cg cov = new();
endmodule
