interface alu_interface(input bit clk);
  logic reset;
  logic [7:0] a,b;
  logic [3:0] op_code;
  logic [7:0] result;
  bit carry;
  clocking cb @(posedge clk);
    default input #0 output #1;
    input result,carry;
    output a,b,op_code; 
  endclocking 
  modport dut(input a,b,op_code,reset,clk,output result,carry);
  modport tb(clocking cb, input reset);
endinterface 