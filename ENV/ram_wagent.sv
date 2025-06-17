////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wagent
// Project Name: ram_verification 
// Description: write agent files
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WAGENT_SV
`define RAM_WAGENT_SV

class ram_wagent extends uvm_agent;

  `uvm_component_utils(ram_wagent)

  uvm_analysis_export #(ram_wtrans) wagent_analysis_export;

  ram_wdriver wdrv_h;
  ram_wmon wmon_h;
  ram_wseqr wseqr_h;

  function new(string name="ram_wagent", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual ram_inf vif;

  function void build_phase(uvm_phase phase);
    if(!uvm_config_db #(virtual ram_inf)::get(this,"vif",vif))
      `uvm_fatal("ram_wagent","config_db error")
    wdrv_h = ram_wdriver::type_id::create("wdrv_h",this);
    wmon_h = ram_wmon::type_id::create("wmon_h",this);
    wseqr_h = ram_wseqr::type_id::create("wseqr_h",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    wdrv_h.seq_item_port.connect(wseqr_h.seq_item_export);
    wagent_analysis_export.connect(wmon_h.wmon_analysis_port);
    wdrv_h.vif = vif;
    wmon_h.vif = vif;
  endfunction
  
endclass

`endif
