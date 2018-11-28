//
// Verilog Module cat_recognizer_lib.fsm_apb
//
// Created:
//          by - avira.UNKNOWN (DESKTOP-U84L200)
//          at - 19:38:14 11/28/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module fsm_apb (output reg enable, input pclock, psel, penable);
parameter[1:0]  IDLE = 2'b00,
                SETUP = 2'b01,
                ENABLE = 2'b10;
reg[1:0] state, next;
reg next_enable;

always @(posedge pclock) begin
if(!psel) begin
    state <= IDLE;
    enable <= 1'b0;
    end
else begin
    state <= next;
    enable <= next_enable;
    end
end

always @(penable or psel) begin
case (state)
  IDLE: begin 
        if(psel)
          next = SETUP;
        else
          next = IDLE;
        next_enable = 1'b0;
      end
  SETUP: begin
        if(penable)
          next = ENABLE;
        else
          next = SETUP;
        next_enable = 1'b0;
        end
  ENABLE: begin
        if(psel)
          next = SETUP;
        else
          next = IDLE;
        next_enable = 1'b1;
        end
  default: begin
          next = IDLE;
          next_enable = 1'b0;
        end 
endcase
end
endmodule