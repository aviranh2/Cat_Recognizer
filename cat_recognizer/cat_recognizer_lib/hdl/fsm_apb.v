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
module fsm_apb (
output reg enable, 
input pclock, 
psel, 
penable);
parameter[1:0]  IDLE = 2'b00,
                SETUP = 2'b01,
                ENABLE = 2'b10;
reg[1:0] current_state, next_state;
reg next_enable;

always @(posedge pclock) begin : FIRST_BLOCK
if(!psel)
 begin
    current_state <= IDLE;
    enable <= 1'b0;
    end
else 
begin
    current_state <= next_state;
    enable <= next_enable;
    end
end

always @(penable or psel or current_state) begin : SECOND_BLOCK
case (current_state)
  IDLE: begin 
        if(psel)
          next_state = SETUP;
        else
          next_state = IDLE;
        next_enable = 1'b0;
      end
  SETUP: begin
        if(penable)
          next_state = ENABLE;
        else
          next_state = SETUP;
        next_enable = 1'b0;
        end
  ENABLE: begin
        if(psel)
          begin
          next_state = SETUP;
        end
        else
          begin
          next_state = IDLE;
        next_enable = 1'b1;
      end
        end
  default: begin
      //next_state = IDLE;
       next_enable = 1'b0;
 end 

endcase
end
endmodule