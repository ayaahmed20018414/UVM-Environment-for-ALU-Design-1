class alu_test extends uvm_test;
  `uvm_component_utils(alu_test);
  alu_env env;
  alu_base_sequence reset_seq;
  alu_test_sequence test_seq;
  function new(string name ="alu_test", uvm_component parent);
    super.new(name,parent);
    `uvm_info("TEST CLASS","inside constructor!",UVM_HIGH);
  endfunction 
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST CLASS","Build phase!",UVM_HIGH);
    
    env=alu_env::type_id::create("env",this);
  endfunction 
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST CLASS","connect phase!",UVM_HIGH);
  endfunction  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST CLASS","run phase!",UVM_HIGH);
    phase.raise_objection(this);
    reset_seq=alu_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    repeat(100)begin
    test_seq=alu_test_sequence::type_id::create("test_seq");
    test_seq.start(env.agnt.seqr);
    end
    phase.drop_objection(this);
  endtask
  
endclass 
