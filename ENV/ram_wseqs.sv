////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wseqs
// Project Name: ram_verification 
// Description: write sequence file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WSEQ_SV
`define RAM_WSEQ_SV

class ram_wseqs extends uvm_sequence;

  `uvm_component_utils(ram_wseqs)

  ram_wtrans wtrans_h;

  function new(string name="ram_wseqs",uvm_component parent);
    super.new(name, parent);
  endfunction

  task body();
    start_item(wtrans_h);
    #10;                  //temporary. Delete it after writing logic
    finish_item(wtrans_h);
  endtask

endclass

`endif
