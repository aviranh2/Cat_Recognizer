//
// Verilog class cat_recognizer_lib.RandomGenerator
//
// Created:
//          by - amitb.UNKNOWN (DESKTOP-GIFQ7HQ)
//          at - 15:06:22 15/12/2018
//
// using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
//
/*
package classes;
class RandomGenerator#(int size = 24);

rand  reg[size-1:0] write_value;

// ### Please start your Verilog code here ### 

endclass


endpackage 
*/
package classes;

  //**********************Begin Class*************************************
  // This is the class that we will randomize.
class RandomGenerator#( parameter size = 24);
   //parameter size = 24;

  rand  reg[size-1:0] value;          //regular random variable
//  rand inst_e inst;

  // Randomization constraints.
  /*
  constraint UpperLimit {
    dinClass<(1<<(range+1)-1);
    up_dnClass<2;
  }
  */
 
  // Print out the items.
  function void print();
    $display("value = %0h", value);
  endfunction
  
endclass
  //**********************End Class*************************************

endpackage 