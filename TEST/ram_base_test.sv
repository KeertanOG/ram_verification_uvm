////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_base_test
// Project Name: ram_verification 
// Description: base test file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_BASE_TEST_SV
`define RAM_BASE_TEST_SV

class ram_base_test extends uvm_test;

  `uvm_component_utils(ram_base_test)
  ram_env env_h;
  ram_wseqs wseqs_h;
  ram_wseqr wseqr_h;
  ram_rseqs rseqs_h;
  ram_rseqr rseqr_h;

  function new(string name="ram_base_test",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    env_h = ram_env::type_id::create("env_h",this);
    wseqs_h = ram_wseqs::type_id::create("wseqs_h",this);
    rseqs_h = ram_rseqs::type_id::create("rseqs_h",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    wseqs_h.start(wseqr_h);
    rseqs_h.start(rseqr_h);
    #50;
    phase.drop_objection(this);
  endtask

endclass

`endif
