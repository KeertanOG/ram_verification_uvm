////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_pkg
// Project Name: ram_verification 
// Description: Package file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_PKG_SV
`define RAM_PKG_SV


`include "ram_defines.sv"
`include "ram_inf.sv"

package ram_pkg;
  import uvm_pkg :: *;
  `include "uvm_macros.svh"

  `include "ram_rtrans.sv"
  `include "ram_wtrans.sv"
  `include "ram_rseqs.sv"
  `include "ram_wseqs.sv"
  `include "ram_rd_seqs.sv"
  `include "ram_wr_seqs.sv"
  `include "ram_rseqr.sv"
  `include "ram_wseqr.sv"
  `include "ram_wdriver.sv"
  `include "ram_rdriver.sv"
  `include "ram_rmon.sv"
  `include "ram_wmon.sv"
  `include "ram_wagent.sv"
  `include "ram_ragent.sv"
  `include "ram_scb.sv"
  `include "ram_env.sv"
  `include "ram_base_test.sv"
  `include "ram_simultaneous_test.sv"
  `include "ram_write_test.sv"
  `include "ram_read_test.sv"
endpackage

`endif
