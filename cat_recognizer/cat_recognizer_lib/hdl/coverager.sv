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

endgroup


cg cov = new();
endmodule
