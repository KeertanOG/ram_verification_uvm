////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wseqr
// Project Name: ram_verification 
// Description: Write sequencer file. 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WSEQR_SV
`define RAM_WSEQR_SV

class ram_wseqr extends uvm_sequencer #(ram_wtrans);
  `uvm_component_utils(ram_wseqr)

  function new(string name="ram_wseqr", umv_component parent = null);
    super.new(name,parent);
  endfunction

endclass

`endif
