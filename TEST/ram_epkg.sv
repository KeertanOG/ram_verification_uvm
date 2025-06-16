////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_epkg
// Project Name: ram_verification 
// Description: environment package file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_EPKG_SV
`define RAM_EPKG_SV

package ram_epkg;
  `include "ram_rpkg.sv"
  `include "ram_wpkg.sv"
  `include "ram_scb.sv"
  
endpackage

`endif
