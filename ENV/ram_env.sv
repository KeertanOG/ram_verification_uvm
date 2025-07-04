////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_env
// Project Name: ram_verification 
// Description: Environment file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_ENV_SV
`define RAM_ENV_SV

class ram_env extends uvm_env;
  `uvm_component_utils(ram_env)

  ram_wagent wagt_h;
  ram_ragent ragt_h;
  ram_scb scb_h;

  uvm_analysis_export #(ram_wtrans) wenv_analysis_export;
  uvm_analysis_export #(ram_rtrans) renv_analysis_export;

  function new(string name="ram_env",uvm_component parent);
    super.new(name, parent);
//    wenv_analysis_export = new("wenv_analysis_export",this);
//    renv_analysis_export = new("renv_analsysi_export",this);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wagt_h = ram_wagent::type_id::create("wagt_h",this);
    ragt_h = ram_ragent::type_id::create("ragt_h",this);
    scb_h = ram_scb::type_id::create("scb_h",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    ragt_h.ragent_analysis_export.connect(scb_h.rscb_analysis_imp_rd_mon);
    wagt_h.wagent_analysis_export.connect(scb_h.wscb_analysis_imp_wr_mon);
  endfunction
 
endclass

`endif
