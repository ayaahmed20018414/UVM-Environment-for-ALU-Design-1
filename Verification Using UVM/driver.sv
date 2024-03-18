class alu_driver extends uvm_driver#(alu_sequence_item);
  `uvm_component_utils(alu_driver);
  alu_sequence_item item;
  virtual alu_interface vif;
  function new(string name ="alu_driver", uvm_component parent);
    super.new(name,parent);
    `uvm_info("DRIVER CLASS","inside constructor!",UVM_HIGH);
  endfunction 
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER CLASS","Build phase!",UVM_HIGH);
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this,"*","vif",vif)))begin
      `uvm_error("DRIVER CLASS","failed to get vif from config DB!");
    end
    
  endfunction 
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER CLASS","connect phase!",UVM_HIGH);
  endfunction  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER CLASS","inside run phase!",UVM_HIGH);
     forever begin
       item=alu_sequence_item::type_id::create("item");
       seq_item_port.get_next_item(item);
       drive(item);
       seq_item_port.item_done();
     end
  endtask
  task drive(alu_sequence_item item);
    @(posedge vif.clk);
    vif.reset<=item.reset;
    vif.a<=item.a;
    vif.b<=item.b;
    vif.op_code<=item.op_code;
    
  endtask
endclass 