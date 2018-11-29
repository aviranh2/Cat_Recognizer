//
// Test Bench Module cat_recognizer_lib.cat_recognizer_tester.cat_recognizer_tester
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 10:14:43 29/11/2018
//
// Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
//
`resetall
`timescale 1ns/10ps
module cat_recognizer_tester (PADDR,
                              PENABLE,
                              PSEL,
                              PWDATA,
                              PWRITE,
                              clk,
                              rst,
                              PRDATA,
                              CatRecOut
                             );

// Local declarations

parameter Amba_Word = 24;
parameter Amba_Addr_Depth = 12;
parameter Weightrecision = 5;


output PADDR;
output PENABLE;
output PSEL;
output PWDATA;
output PWRITE;
output clk;
output rst;
input  PRDATA;
input  CatRecOut;

wire [Amba_Addr_Depth - 1:0] PADDR;
reg                         PENABLE;
reg                         PSEL;
wire [Amba_Word - 1:0]       PWDATA;
wire                         PWRITE;
reg                         clk;
reg                         rst;
wire [Amba_Word - 1:0]       PRDATA;
wire                         CatRecOut;

initial begin
    clk <= 1'b0;
    rst <= 1'b1;
    #10 rst <= 0'b0;
end

initial begin forever
    #5 clk = ~clk;
end

initial begin
   PENABLE <= 1'b0;
   PSEL    <= 1'b0;
   #5;
   PENABLE <= 1'b0;
   PSEL    <= 1'b0;
   #10;
   PENABLE <= 1'b0;
   PSEL    <= 1'b1;
   #10;
   PENABLE <= 1'b1;
   PSEL    <= 1'b1;
   #10;
   PENABLE <= 1'b0;
   PSEL    <= 1'b1;
   #10;
   PENABLE <= 1'b1;
   PSEL    <= 1'b1;
   #10;
   PENABLE <= 1'b0;
   PSEL    <= 1'b1;
   #10;
   PENABLE <= 1'b1;
   PSEL    <= 1'b1;
   #10;
   PENABLE <= 1'b0;
   PSEL    <= 1'b1;
   #10;
   PENABLE <= 1'b1;
   PSEL    <= 1'b1;
   #10;
   
end


endmodule // cat_recognizer_tester

