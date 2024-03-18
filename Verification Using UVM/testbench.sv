// Code your testbench here
// or browse Examples
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "alu_interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top();
   bit clk;
  alu_interface intf(clk);
  alu dut(intf.dut);
  always #5 clk=~clk;
  
  initial begin
    run_test("alu_test");
  end
  initial begin
    $dumpfile("alu.vcd");
    $dumpvars();
    
  end
  initial begin
    uvm_config_db #(virtual alu_interface)::set(null,"*","vif",intf);
    
  end
  initial begin
    repeat(500) @(posedge clk);
    $display("sorry! run out of clock cycles");
    
  end
  
endmodule
