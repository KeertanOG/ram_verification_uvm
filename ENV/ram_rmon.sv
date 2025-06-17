////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rmon
// Project Name: ram_verification 
// Description: Read monitor file 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RMON_SV
`define RAM_RMON_SV

class ram_rmon extends uvm_monitor;

  `uvm_component_utils(ram_rmon)

  uvm_analysis_port #(ram_rtrans) rmon_analysis_port;

  virtual ram_inf vif;

  function new(string name="ram_rmon", uvm_component parent);
    super.new(name,parent);
    rmon_analysis_port = new("rmon_analysis_port",this);
  endfunction

  task run_phase(uvm_phase phase);
    monitor();
  endtask

  task monitor();
  endtask

endclass

`endif
