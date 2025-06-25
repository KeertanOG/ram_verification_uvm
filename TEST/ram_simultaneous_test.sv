////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_simulataneous_test
// Project Name: ram_verification 
// Description: Simultanoues write and read testcase file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_SIMULTANEOUS_TEST_SV
`define RAM_SIMULTANEOUS_TEST_SV

class ram_simultaneous_test extends ram_base_test;

  `uvm_component_utils(ram_simultaneous_test)

  ram_wr_seqs wr_seqs_h;
  ram_rd_seqs rd_seqs_h;

  function new(string name = "ram_simultaneous_test", uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    repeat(10) begin
      fork
        begin
          wr_seqs_h = ram_wr_seqs::type_id::create("wr_seqs_h",this);
          void'(wr_seqs_h.randomize());
          wr_seqs_h.start(env_h.wagt_h.wseqr_h);
        end
        begin
          rd_seqs_h = ram_rd_seqs::type_id::create("rd_seqs_h",this);
          void'(rd_seqs_h.randomize());
          rd_seqs_h.start(env_h.ragt_h.rseqr_h);
        end
      join
    end
    phase.drop_objection(this);
  endtask

endclass

`endif
