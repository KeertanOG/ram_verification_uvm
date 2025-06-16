////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rseqr
// Project Name: ram_verification 
// Description: Read sequencer file. 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RSEQR_SV
`define RAM_RSEQR_SV

class ram_rseqr extends uvm_sequencer #(ram_rtrans);

  `uvm_component_utils(ram_rseqr)

  function new(string name="ram_rseqr", umv_component parent = null);
    super.new(name,parent);
  endfunction

endclass

`endif
