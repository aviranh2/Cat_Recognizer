//
// Test Bench Module cat_recognizer_lib.fsm_apb_tb.fsm_apb_tester
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 14:20:20 08/12/2018
//
// Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
//
`resetall
`timescale 1ns/10ps

module fsm_apb_tb;

// Local declarations
parameter IDLE = 2'b00;
parameter SETUP = 2'b01;
parameter ENABLE = 2'b10;

// Internal signal declarations
wire enable;
wire pclock;
wire psel;
wire penable;
wire pwrite;


fsm_apb #(IDLE,SETUP,ENABLE) U_0(
   .enable  (enable),
   .pclock  (pclock),
   .psel    (psel),
   .penable (penable),
   .pwrite  (pwrite)
);

fsm_apb_tester #(IDLE,SETUP,ENABLE) U_1(
   .enable  (enable),
   .pclock  (pclock),
   .psel    (psel),
   .penable (penable),
   .pwrite  (pwrite)
);

endmodule // fsm_apb_tb


