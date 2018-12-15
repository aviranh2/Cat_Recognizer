//
// Verilog Module cat_recognizer_lib.tb_cat_recognizer_random
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 15:20:34 15/12/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//

`resetall
`timescale 1ns/10ps
module tb_cat_recognizer_random#(
  parameter Amba_Word = 24,
  parameter Amba_Addr_Depth = 13,
  parameter Weight_precision = 5
) ;



cat_recognizer_interface TbInterface();

cat_recognizer_wrapper#(Amba_Word,Amba_Addr_Depth,Weight_precision) behavioral_cat_recognizer_o(
.inter(TbInterface)
);

stimulus_random #(Amba_Word,Amba_Addr_Depth,Weight_precision) stimulus1(
.stimulus_Interface(TbInterface)
);

Checker #(Amba_Word,Amba_Addr_Depth,Weight_precision) checker1(
.checker_Interface(TbInterface)
);

coverager #(Amba_Word,Amba_Addr_Depth,Weight_precision) coverager1(
.coverager_Interface(TbInterface)
);



  




endmodule
