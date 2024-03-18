class alu_env extends uvm_env;
  `uvm_component_utils(alu_env);
  alu_agent agnt;
  alu_scoreboard scb;
  function new(string name ="alu_env", uvm_component parent);
    super.new(name,parent);
    `uvm_info("ENV CLASS","inside constructor!",UVM_HIGH);
  endfunction 
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV CLASS","Build phase!",UVM_HIGH);
    
    scb=alu_scoreboard::type_id::create("scb",this);
    agnt=alu_agent::type_id::create("agnt",this);
  endfunction 
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV CLASS","connect phase!",UVM_HIGH);
    agnt.mon.monitor_port.connect(scb.scoreboard_port);
  endfunction  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  
endclass 