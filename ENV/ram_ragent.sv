////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_ragent
// Project Name: ram_verification 
// Description: read agent files
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RAGENT_SV
`define RAM_RAGENT_SV

class ram_ragent extends uvm_agent;

  `uvm_component_utils(ram_ragent)

  uvm_analysis_export #(ram_rtrans) ragent_analysis_export;

  ram_rdriver rdrv_h;
  ram_rmon rmon_h;
  ram_rseqr rseqr_h;

  function new(string name="ram_ragent", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual ram_inf vif;

  function void build_phase(uvm_phase phase);
    if(!uvm_config_db #(virtual ram_inf)::get(this,"vif",vif))
      `uvm_fatal("ram_ragent","config_db error")
    rdrv_h = ram_rdriver::type_id::create("rdrv_h",this);
    rmon_h = ram_rmon::type_id::create("rmon_h",this);
    rseqr_h = ram_rseqr::type_id::create("rseqr_h",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    rdrv_h.seq_item_port.connect(rseqr_h.seq_item_export);
    ragent_analysis_export.connect(rmon_h.rmon_analysis_port);
    rdrv_h.vif = vif;
    rmon_h.vif = vif;
  endfunction
  
endclass

`endif
