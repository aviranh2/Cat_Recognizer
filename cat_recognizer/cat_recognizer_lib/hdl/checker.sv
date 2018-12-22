//
// Verilog Module cat_recognizer_lib.checker
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 13:33:56 15/12/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module Checker#(
  parameter Amba_Word = 24,
  parameter Amba_Addr_Depth = 13,
  parameter Weight_precision = 5
)
(
  cat_recognizer_interface.checkr_coveragr checker_Interface,
  input  [Amba_Word-1:0] registers[(2**Amba_Addr_Depth)-1:0],
  input reg signed  [3*Weight_precision-1:0] M[(2**Amba_Addr_Depth)-1:0],
  input  [Amba_Addr_Depth-1:0] read_address,
  input  [63:0] acc_val,
  input reg signed [63:0] last_result,
  input last_out


);

reg[Amba_Word-1:0]last_value;
reg [Amba_Addr_Depth-1:0]last_Address;
reg first_time;
integer  clocks_counter=0;
reg signed[63:0] calculated_acc_val;
reg signed [15:0] pixel1,pixel2,pixel3;
reg signed[Weight_precision-1:0]w1,w2,w3;
reg signed[15:0] w_ext1,w_ext2,w_ext3;
reg signed [31:0] pixelw1,pixelw2,pixelw3;
reg  [3*Weight_precision-1:0] w;
reg finish = 1'b0;


integer calc_counter=0;
  property reset_active;
            @( checker_Interface.rst) (checker_Interface.rst==1) |-> (checker_Interface.CatRecOut!=1);
  endproperty
  
  property valid_reg_value_write;
			@(posedge checker_Interface.clk) checker_Interface.PSEL && !checker_Interface.PENABLE && checker_Interface.PWRITE && !first_time |-> (registers[last_Address]==last_value);
  endproperty
  
  property valid_output;
		@(posedge checker_Interface.clk) checker_Interface.CatRecOut == 1 |-> (last_result>0);
  endproperty
  
  property valid_acc_val;
		@(posedge checker_Interface.clk) calc_counter>=1 && calc_counter <=4096 |-> calculated_acc_val == acc_val;
  endproperty

  assert property(reset_active)
  else $error("problem with reset");
  cover property (reset_active);
  
  assert property(valid_reg_value_write)
  else $error("problem with registers write");
  cover property (valid_reg_value_write);
  
  assert property(valid_acc_val)
  else $error("problem with acc val");
  cover property (valid_acc_val);
  
  assert property(valid_output)
  else $error("problem with output value");
  cover property (valid_output);
  
  
  
  
  
  always @(posedge checker_Interface.clk)
  begin
	calculate_acc_val;
	if(checker_Interface.rst)
	begin
	finish = 1'b0;
	end
  end
  
  initial begin
	first_time<=1'b1;
  end
  
  always @(posedge checker_Interface.clk)
  begin
	clocks_counter = clocks_counter + 1;
  end
  
  always @(posedge checker_Interface.clk)
  begin
	if(checker_Interface.PWRITE)
	begin
		if(first_time)
		begin
			first_time<=1'b0;
			last_value<=checker_Interface.PWDATA;
			last_Address<=checker_Interface.PADDR;
		end
		else
		begin
			last_value<=checker_Interface.PWDATA;
			last_Address<=checker_Interface.PADDR;
		end
	
	end
	else
	begin
		if(!first_time)
		begin
			first_time<=1'b1;
		end
	end
	
  end
  
  

  
  
  
task calculate_acc_val;
begin

if(read_address ==3&&!finish)
	begin
		calc_counter =1;
	end
if(calc_counter >0)
begin
		if(calc_counter == 4096)
		begin
			$display("acc = %d,cat_out = %d",last_result,last_out);
		
		
			calc_counter = 0;
			calculated_acc_val = 0;
			finish = 1'b1;
			
			/*
			for(int i = 1 ; i <=calc_counter ; i ++)
			begin
				pixel1 = registers[i][7:0];
				pixel2 = registers[i][15:8];
				pixel3 = registers[i][23:16];
				w1 = M[i-1][Weight_precision-1:0];
				w2 = M[i-1][2*Weight_precision-1:Weight_precision];
				w3 = M[i-1][3*Weight_precision-1:2*Weight_precision];
				calculated_acc_val =calculated_acc_val + pixel1*w1 + pixel2*w2 + pixel3*w3;				
			
			end
			*/
		end
		else
		begin
	
		calculated_acc_val = 0;
			//calculate the value of the acc at the moment
			
			for(int i = 1 ; i <=calc_counter ; i ++)
			begin
				pixel1 = {8'h00,registers[i][7:0]};
				pixel2 = {8'h00,registers[i][15:8]};
				pixel3 = {8'h00,registers[i][23:16]};
				w = M[i-1];
				w_ext1[15:0] = { {(16-Weight_precision){w[Weight_precision-1]}},   w[Weight_precision-1:0] };
				w_ext2[15:0] = { {(16-Weight_precision){w[2*Weight_precision-1]}}, w[2*Weight_precision-1:Weight_precision] };
				w_ext3[15:0] = { {(16-Weight_precision){w[3*Weight_precision-1]}}, w[3*Weight_precision-1:2*Weight_precision] };
				pixelw1 = pixel1*w_ext1;
				pixelw2 = pixel2*w_ext2;
				pixelw3 = pixel3*w_ext3;
				calculated_acc_val =calculated_acc_val + pixelw1 + pixelw2 + pixelw3;				
			
			end
			
		calc_counter = calc_counter +1;
		end
		
			
end
end
endtask
	
	
endmodule
