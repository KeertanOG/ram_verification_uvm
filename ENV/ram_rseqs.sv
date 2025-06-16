////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rseqs
// Project Name: ram_verification 
// Description: read sequence file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RSEQ_SV
`define RAM_RSEQ_SV

class ram_rseqs extends uvm_sequence;

  `uvm_component_utils(ram_rseqs)

  ram_rtrans rtrans_h;

  function new(string name="ram_rseqs",uvm_component parent);
    super.new(name, parent);
  endfunction

  task body();
    start_item(rtrans_h);
    #10;                  //temporary. Delete it after writing logic
    finish_item(rtrans_h);
  endtask

endclass

`endif
