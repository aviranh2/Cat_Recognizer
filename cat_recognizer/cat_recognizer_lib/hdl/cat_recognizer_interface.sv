//
// Verilog interface cat_recognizer_lib.cat_recognizer_interface
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 14:21:31 15/12/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
interface cat_recognizer_interface #( parameter Amba_Word = 24,
  parameter Amba_Addr_Depth = 13,
  parameter Weight_precision = 5
  )();
  
  logic PENABLE;
  logic PSEL;
  logic PWRITE;
  logic clk;
  logic rst;
  logic [Amba_Addr_Depth-1:0] PADDR;
  logic [Amba_Word-1:0] PWDATA;
  logic[Amba_Word-1:0] PRDATA;
  logic CatRecOut;
  
  //modports declaration
modport stimuls (input PENABLE,PSEL,PWRITE,clk,rst,PADDR,PWDATA);
modport cat (input PENABLE,PSEL,PWRITE,clk,rst,PADDR,PWDATA,
                  output PRDATA,CatRecOut);
modport checkr_coveragr (input PENABLE,PSEL,PWRITE,clk,rst,PADDR,PWDATA,PRDATA,CatRecOut);



// ### Please start your Verilog code here ### 
endinterface
