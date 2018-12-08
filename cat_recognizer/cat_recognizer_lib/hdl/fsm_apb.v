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
output enable, 
input pclock, 
psel, 
penable,
pwrite,
rst
);
parameter[1:0]  IDLE = 2'b00,
                SETUP = 2'b01,
                ENABLE = 2'b10;
reg[1:0] current_state, next_state;
reg next_enable;

always @(posedge pclock or negedge rst) begin : SYNCHRONOUS_BLOCK
	if(!psel | rst)
		begin
		current_state <= IDLE;
		end
	else 
		begin
		current_state <= next_state;
		end
end

always @(penable or psel or pwrite) begin : COMBINATORIAL_BLOCK
case (current_state)
  IDLE: begin 
        if(psel & pwrite)
			begin 
				next_state = SETUP;
			end
        else
			begin
				next_state = IDLE;
			end
		next_enable = 1'b0;
		end
  SETUP: begin
			next_state = ENABLE;
			next_enable = 1'b1;
         end
  ENABLE: 	begin
				next_state = psel ? SETUP : IDLE;
				next_enable = 1'b0;
			end
  default: 	begin
				next_state = IDLE;
				next_enable = 1'b0;
			end
endcase
end

assign enable = next_enable;
endmodule