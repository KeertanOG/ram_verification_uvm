////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_read_test
// Project Name: ram_verification 
// Description: read testcase file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_READ_TEST_SV
`define RAM_READ_TEST_SV

class ram_read_test extends ram_base_test;

  `uvm_component_utils(ram_read_test)
  ram_rd_seqs rd_seqs_h;
  
  function new(string name = "ram_read_test",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
 super.build_phase(phase);
    rd_seqs_h = ram_rd_seqs::type_id::create("rd_seqs_h",this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    void'(rd_seqs_h.randomize() with {no_of_trans == 15;});
    rd_seqs_h.start(env_h.ragt_h.rseqr_h);
    phase.drop_objection(this);
  endtask

endclass

`endif
