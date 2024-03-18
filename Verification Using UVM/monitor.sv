class alu_monitor extends uvm_monitor;
  `uvm_component_utils(alu_monitor);
  virtual alu_interface vif;
  alu_sequence_item item;
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  function new(string name ="alu_monitor", uvm_component parent);
    super.new(name,parent);
    `uvm_info("MONITOR CLASS","inside constructor!",UVM_HIGH);
  endfunction 
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR CLASS","Build phase!",UVM_HIGH);
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif)))begin
       `uvm_error("MONITOR CLASS","failed to get vif from config DB!");
    end
    monitor_port=new("monitor_port",this);
  endfunction 
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR CLASS","connect phase!",UVM_HIGH);
  endfunction  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR CLASS","run phase!",UVM_HIGH);
    forever begin
      item=alu_sequence_item::type_id::create("item");
      wait(!vif.reset);
      @(posedge vif.clk);
      item.a=vif.a;
      item.b=vif.b;
      item.op_code=vif.op_code;
      @(posedge vif.clk);
      item.result=vif.result;
      item.carry=vif.carry;
      monitor_port.write(item);
    end
  endtask
  
endclass 