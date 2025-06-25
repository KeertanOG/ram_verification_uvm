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

  virtual ram_inf vif;                  //virtual interface handle
  //write transaction class handle
  ram_wtrans wtrans_h;

  function new(string name="ram_wmon", uvm_component parent);
    super.new(name,parent);
    wmon_analysis_port = new("wmon_analysis_port",this);
  endfunction

  task run_phase(uvm_phase phase);
    //waiting for initial reset
    wait(vif.rst);
    wait(!vif.rst);           //waiting for reset release
    forever begin
      fork 
        begin
          wait(vif.rst);
        end
        forever begin
          @(vif.mon_cb);
          monitor();
          wtrans_h.print();
          wmon_analysis_port.write(wtrans_h);
        end
      join_any
      disable fork;
      wait(!vif.rst);
    end
  endtask

  task monitor();
    wtrans_h = ram_wtrans::type_id::create("wtrans_h");
    wtrans_h.wr_enb = vif.mon_cb.wr_enb;
    wtrans_h.wr_addr = vif.mon_cb.wr_addr;
    wtrans_h.wr_data = vif.mon_cb.wr_data;
  endtask

endclass

`endif
