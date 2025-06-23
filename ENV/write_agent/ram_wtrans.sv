////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wtrans
// Project Name: ram_verification 
// Description: Write transaction class. 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WTRANS_SV
`define RAM_WTRANS_SV

class ram_wtrans extends uvm_sequence_item;
  
  //enum for the type of operation we want to perform on the ram (IDLE, READ, WRITE, SIM_RW)
//  rand trans_type kind_e;
  
  //write signals
  rand bit wr_enb;                             //enable signal for write
  rand bit [`ADDR_WIDTH-1:0] wr_addr;     //write address signal
  rand bit [`DATA_WIDTH-1:0] wr_data;     //write data signal

  `uvm_object_utils_begin(ram_wtrans)
//    `uvm_field_enum(kind_e, trans_type, UVM_ALL_ON)
    `uvm_field_int(wr_enb, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(wr_addr, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(wr_data, UVM_ALL_ON | UVM_DEC)
  `uvm_object_utils_end
  
  function new(string name = "ram_wtrans");
    super.new(name);
  endfunction

endclass

`endif
