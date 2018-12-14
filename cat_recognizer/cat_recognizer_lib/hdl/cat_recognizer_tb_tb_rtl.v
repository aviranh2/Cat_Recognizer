//
// Test Bench Module cat_recognizer_lib.cat_recognizer_tb.cat_recognizer_tester
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 10:14:43 29/11/2018
//
// Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
//
`resetall
`timescale 1ns/10ps

module cat_recognizer_tb;

// Local declarations
parameter Amba_Word = 24;
parameter Amba_Addr_Depth = 13;
parameter Weightrecision = 5;

// Internal signal declarations
wire [Amba_Addr_Depth - 1:0] PADDR;
wire                         PENABLE;
wire                         PSEL;
wire [Amba_Word - 1:0]       PWDATA;
wire                         PWRITE;
wire                         clk;
wire                         rst;
wire [Amba_Word - 1:0]       PRDATA;
wire                         CatRecOut;


cat_recognizer #(Amba_Word,Amba_Addr_Depth,Weightrecision) U_0(
   .PADDR     (PADDR),
   .PENABLE   (PENABLE),
   .PSEL      (PSEL),
   .PWDATA    (PWDATA),
   .PWRITE    (PWRITE),
   .clk       (clk),
   .rst       (rst),
   .PRDATA    (PRDATA),
   .CatRecOut (CatRecOut)
);

cat_recognizer_tester #(Amba_Word,Amba_Addr_Depth,Weightrecision) U_1(
   .PADDR     (PADDR),
   .PENABLE   (PENABLE),
   .PSEL      (PSEL),
   .PWDATA    (PWDATA),
   .PWRITE    (PWRITE),
   .clk       (clk),
   .rst       (rst),
   .PRDATA    (PRDATA),
   .CatRecOut (CatRecOut)
);

endmodule // cat_recognizer_tb


