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
  `include "ram_epkg.sv"
  `include "ram_env.sv"
  `include "ram_base_test.sv"
endpackage

`endif
