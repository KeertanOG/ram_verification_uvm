////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wmon
// Project Name: ram_verification 
// Description: Write monitor file 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WMON_SV
`define RAM_WMON_SV

class ram_wmon extends uvm_monitor;

  `uvm_component_utils(ram_wmon)

  uvm_analysis_port #(ram_wtrans) wmon_analysis_port;

  function new(string name="ram_wmon", uvm_component parent);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase);
    monitor();
  endtask

endclass

`endif
