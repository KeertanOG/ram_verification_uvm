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

  //read transaction class handle
  ram_rtrans rtrans_h;

  virtual ram_inf vif;

  function new(string name="ram_rmon", uvm_component parent);
    super.new(name,parent);
    rmon_analysis_port = new("rmon_analysis_port",this);
  endfunction

  task run_phase(uvm_phase phase);
    //waiting for initial reset
    wait(vif.rst);
    wait(!vif.rst);           //waiting for reset release
    forever begin
      fork
        begin
          wait(vif.rst);      //waiting for in-between release
        end
        forever begin
          @(vif.mon_cb);
          monitor();
//          rtrans_h.print();
          rmon_analysis_port.write(rtrans_h);
        end
      join_any
      disable fork;
      wait(!vif.rst);
    end
  endtask

  task monitor();
    rtrans_h = ram_rtrans::type_id::create("rtrans_h");
    rtrans_h.rd_enb = vif.mon_cb.rd_enb;
    rtrans_h.rd_addr = vif.mon_cb.rd_addr;
    rtrans_h.rd_data = vif.mon_cb.rd_data;
  endtask

endclass

`endif
