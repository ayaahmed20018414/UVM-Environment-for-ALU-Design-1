class alu_base_sequence extends uvm_sequence;
  `uvm_object_utils(alu_base_sequence);
  alu_sequence_item reset_pkt;
  function new(string name="alu_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQ","inside constructor!",UVM_HIGH);
  endfunction 
  
  task body();
    `uvm_info("BASE_SEQ","inside body task!",UVM_HIGH);
    reset_pkt=alu_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    reset_pkt.randomize() with {(reset==1);};
    finish_item(reset_pkt);
  endtask
  
endclass
class alu_test_sequence extends alu_base_sequence;
  `uvm_object_utils(alu_test_sequence);
   alu_sequence_item item;
  function new(string name="alu_test_sequence");
    super.new(name);
    `uvm_info("TEST_SEQ","inside constructor!",UVM_HIGH);
  endfunction 
  
  task body();
    `uvm_info("TEST_SEQ","inside body task!",UVM_HIGH);
    item=alu_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize() with {(reset==0);};
    finish_item(item);
  endtask
  
endclass
