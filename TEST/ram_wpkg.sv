////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wpkg
// Project Name: ram_verification 
// Description: write package file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WPKG_SV
`define RAM_WPKG_SV

package ram_wpkg;
  `include "ram_wtrans.sv"
  `include "ram_wseqr.sv"
  `include "ram_wseqs.sv"
  `include "ram_wdriver.sv"
  `include "ram_wmon.sv"
  `include "ram_wagent.sv"

endpackage


`endif
