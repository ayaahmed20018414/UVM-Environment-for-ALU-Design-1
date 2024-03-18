class alu_scoreboard extends uvm_test;
  `uvm_component_utils(alu_scoreboard);
  uvm_analysis_imp #(alu_sequence_item,alu_scoreboard) scoreboard_port;
  alu_sequence_item transactions[$];
  function new(string name ="alu_scoreboard", uvm_component parent);
    super.new(name,parent);
   `uvm_info("scoreboard CLASS","inside constructor!",UVM_HIGH);
  endfunction 
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("scoreboard CLASS","Build phase!",UVM_HIGH);
    scoreboard_port=new("scoreboard_port",this);
  endfunction 
  
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("scoreboard CLASS","connect phase!",UVM_HIGH);
  endfunction  
  //*******************write method****************
  function void write(alu_sequence_item item);
    transactions.push_back(item); 
    
  endfunction 
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("scoreboard CLASS","run phase!",UVM_HIGH);
    forever begin
     alu_sequence_item curr_transaction;
    wait((transactions.size() !=0));
    curr_transaction=transactions.pop_front();
    compare(curr_transaction);
    end
  endtask
  task compare(alu_sequence_item  curr_transaction);
    logic [7:0] expected_val;
    logic [7:0] actual_val;
    case(curr_transaction.op_code)
      4'b0000:begin
        expected_val=curr_transaction.a + curr_transaction.b;
      end
      4'b0001:begin
        expected_val=curr_transaction.a - curr_transaction.b;
      end
    4'b0010:begin
        expected_val=curr_transaction.a * curr_transaction.b;
      end
      4'b0011:begin
        expected_val=curr_transaction.a / curr_transaction.b;
      end
    endcase
    actual_val=curr_transaction.result;
    if(actual_val != expected_val) begin
      `uvm_error("compare",$sformatf("transaction failed! as Actual value =%0d and Expected value %0d",actual_val,expected_val));
    end
    else begin
      `uvm_info("compare",$sformatf("transaction passed! as Actual value =%0d and Expected value %0d",actual_val,expected_val),UVM_LOW); 
    end
  endtask
endclass 