////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_write_trans
// Project Name: ram_verification 
// Description: Write transaction class. 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WRITE_TRANS_SV
`define RAM_WRITE_TRANS_SV

class ram_wtrans extends uvm_sequence_item;
  
  //enum for the type of operation we want to perform on the ram (IDLE, READ, WRITE, SIM_RW)
  rand trans_type kind_e;
  
  //write signals
  rand bit wr_enb;                        //enable signal for write
  rand bit [`ADDR_WIDTH-1:0] wr_addr;     //write address signal
  rand bit [`DATA_WIDTH-1:0] wr_data;     //write data signal

  //read signals
  rand bit rd_enb;                        //enable signal for read
  rand bit [`ADDR_WIDTH-1:0] rd_addr;     //read address signal
  rand bit [`DATA_WIDTH-1:0] rd_data;     //read data signal

  `uvm_object_utils_begin(ram_trans)
    `uvm_field_enum(kind_e, trans_kind, UVM_ALL_ON)
    `uvm_field_int()
  
endclass
