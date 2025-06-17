////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_scb
// Project Name: ram_verification 
// Description: Scoreboard file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_SCB_SV
`define RAM_SCB_SV

class ram_scb extends uvm_scoreboard;

  `uvm_component_utils(ram_scb)
  
  uvm_analysis_imp #(ram_wtrans) wscb_analysis_imp;
  uvm_analysis_imp #(ram_rtrans) rscb_analysis_imp;  

  function new(string name="ram_scb",uvm_component parent);
    super.new(name, parent);
  endfunction

endclass

`endif
