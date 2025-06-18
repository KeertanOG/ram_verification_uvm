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

  //write transaction class handle
  ram_wtrans trans_h = new();

  virtual ram_inf vif;

  function new(string name="ram_wmon", uvm_component parent);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);
    monitor();
  endtask

  task monitor();
    trans_h.wr_enb = vif.mon_cb.wr_enb;
    trans_h.wr_data = vif.mon_cb.wr_data;
    trans_h.wr_addr = vif.mon_cb.wr_addr;
  endtask

endclass

`endif
