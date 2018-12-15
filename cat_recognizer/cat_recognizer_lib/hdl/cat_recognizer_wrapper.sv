//
// Verilog Module cat_recognizer_lib.cat_recognizer_wrapper
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 14:22:56 15/12/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module cat_recognizer_wrapper#(  parameter Amba_Word = 24,
  parameter Amba_Addr_Depth = 13,
  parameter Weight_precision = 5
  )
  (
  cat_recognizer_interface.cat inter
  );
  
  
  cat_recognizer#( Amba_Word,Amba_Addr_Depth,Weight_precision) 
  behavioral_cat_recognizer( 
.PADDR(inter.PADDR),
.PENABLE(inter.PENABLE),
.PSEL(inter.PSEL),
.PWDATA(inter.PWDATA),
.PWRITE(inter.PWRITE),
.clk(inter.clk),
.rst(inter.rst),
.PRDATA(inter.PRDATA),
.CatRecOut(inter.CatRecOut)
); 


// ### Please start your Verilog code here ### 

endmodule
