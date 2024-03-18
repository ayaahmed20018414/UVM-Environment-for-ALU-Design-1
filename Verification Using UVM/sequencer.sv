class alu_sequencer extends uvm_sequencer#(alu_sequence_item);
  `uvm_component_utils(alu_sequencer);
  function new(string name ="alu_sequencer", uvm_component parent);
    super.new(name,parent);
    `uvm_info("SEQUENCER CLASS","inside constructor!",UVM_HIGH);
  endfunction 
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER CLASS","Build phase!",UVM_HIGH);
  endfunction 
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQUENCER CLASS","connect phase!",UVM_HIGH);
  endfunction  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  
endclass 