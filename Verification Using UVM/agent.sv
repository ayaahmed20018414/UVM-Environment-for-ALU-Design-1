class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent);
   alu_driver drv;
  alu_sequencer seqr;
  alu_monitor mon;
  function new(string name ="alu_agent", uvm_component parent);
    super.new(name,parent);
    `uvm_info("AGENT CLASS","inside constructor!",UVM_HIGH);
  endfunction 
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT CLASS","Build phase!",UVM_HIGH);
    drv=alu_driver::type_id::create("drv",this);
    mon=alu_monitor::type_id::create("mon",this);
    seqr=alu_sequencer::type_id::create("seqr",this);
  endfunction 
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT CLASS","connect phase!",UVM_HIGH);
    //connect driver with sequencer
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  
endclass 