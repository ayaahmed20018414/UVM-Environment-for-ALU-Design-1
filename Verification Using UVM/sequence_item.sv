class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item);
  function new(string name= "alu_sequence_item");
    super.new(name);
  endfunction 
  rand logic reset;
  rand logic [7:0] a,b;
  rand logic [3:0] op_code;
  logic [7:0] result;
  bit carry;
  
  //constraint blocks
  constraint input1_a {a inside {[10:20]};}
  constraint input2_b {b inside {[1:10]};}
  constraint op_code_val {op_code inside {[0:3]};}
endclass