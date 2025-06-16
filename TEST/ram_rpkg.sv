////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rpkg
// Project Name: ram_verification 
// Description: read package file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RPKG_SV
`define RAM_RPKG_SV

package ram_rpkg;
  `include "ram_rtrans.sv"
  `include "ram_rseqr.sv"
  `include "ram_rseqs.sv"
  `include "ram_rdriver.sv"
  `include "ram_rmon.sv"
  `include "ram_ragent.sv"

endpackage

`endif
