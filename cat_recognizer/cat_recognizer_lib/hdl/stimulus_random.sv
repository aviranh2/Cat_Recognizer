//
// Verilog Module cat_recognizer_lib.stimulus_random
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 13:25:25 15/12/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps

import classes::*;


module stimulus_random#(  
  parameter Amba_Word = 24,
  parameter Amba_Addr_Depth = 13,
  parameter Weight_precision = 5,
  parameter file_length = 4096
  )
  (
  cat_recognizer_interface.stimuls stimulus_Interface
  );
  
 RandomGenerator#(Amba_Word) RadomGeneratorVar=new();

 reg[Amba_Word-1:0] data_to_write;
 reg[Amba_Addr_Depth-1:0] inc_addr,write_address;
integer index;
// clock part
always 
begin
 #5 stimulus_Interface.clk = ~stimulus_Interface.clk;


end

initial 
begin 


stimulus_Interface.clk=1;
stimulus_Interface.rst = 1;
#10
stimulus_Interface.rst = 0;

//begin test

//see how system reacts to long reset
#50
stimulus_Interface.rst = 1;
#10
stimulus_Interface.rst = 0;
#10
stimulus_Interface.rst = 1;
#10
stimulus_Interface.rst = 0;
stimulus_Interface.PSEL <= 1'b0;
stimulus_Interface.PWRITE <= 1'b0;
stimulus_Interface.PENABLE <= 1'b0;

//get random values
assert(RadomGeneratorVar.randomize());  //check if the function returned 1 
RadomGeneratorVar.print();
data_to_write <= RadomGeneratorVar.value;
#10
assert(RadomGeneratorVar.randomize());  //check if the function returned 1 
RadomGeneratorVar.print();
data_to_write <= RadomGeneratorVar.value;

//now we will write random values into the registers

#10
write_address[Amba_Addr_Depth-1:1] = {Amba_Addr_Depth{1'b0}}; //reset read address
write_address[0] = 1'b1;
write({Amba_Addr_Depth{1'b0}},24'h000000);
for(index = 1; index<=file_length;index = index + 1)
	begin
		    assert(RadomGeneratorVar.randomize());  //check if the function returned 1 
			data_to_write <= RadomGeneratorVar.value;
			write(write_address, data_to_write);
			write_address = write_address + 1;
	end
write_address[Amba_Addr_Depth-1:1] = {Amba_Addr_Depth{1'b0}}; //reset read address
write_address[0] = 1'b1;
write({Amba_Addr_Depth{1'b0}},{{(Amba_Word-1){1'b0}},1'b1});
stimulus_Interface.PSEL <= 1'b0;
stimulus_Interface.PWRITE <= 1'b0;
stimulus_Interface.PENABLE <= 1'b0;




end




task write;
	input [Amba_Addr_Depth-1:0]	Adress;
	input [3*Amba_Word-1:0]		data;
	begin
		@(posedge stimulus_Interface.clk)
		begin
		#1;
		stimulus_Interface.PSEL = 1'b1;
		stimulus_Interface.PENABLE = 1'b0;
		stimulus_Interface.PWRITE = 1'b1;
		stimulus_Interface.PADDR = Adress;
		stimulus_Interface.PWDATA = data;
		end
		@(posedge stimulus_Interface.clk)
		begin
		#1;
		stimulus_Interface.PENABLE = 1'b1;
		end
	end
endtask


endmodule
