////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_defines
// Project Name: ram_verification 
// Description: Defines file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_DEFINES_SV
`define RAM_DEFINES_SV

  `define ADDR_WIDTH 6
  `define DATA_WIDTH 8
  `define DEPTH 64

typedef enum bit [1:0] {IDLE, READ, WRITE, SIM_RW} trans_type;

`endif
