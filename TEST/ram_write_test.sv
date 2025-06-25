////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_write_test
// Project Name: ram_verification 
// Description: write testcase file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WRITE_TEST_SV
`define RAM_WRITE_TEST_SV

class ram_write_test extends ram_base_test;

  `uvm_component_utils(ram_write_test)
  ram_wr_seqs wr_seqs_h;
  
  function new(string name = "ram_write_test",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
 super.build_phase(phase);
    wr_seqs_h = ram_wr_seqs::type_id::create("wr_seqs_h",this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    void'(wr_seqs_h.randomize() with {no_of_trans == 15;});
    wr_seqs_h.start(env_h.wagt_h.wseqr_h);
    phase.drop_objection(this);
  endtask

endclass

`endif
