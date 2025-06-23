////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rtrans
// Project Name: ram_verification 
// Description: Read transaction class. 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RTRANS_SV
`define RAM_RTRANS_SV

class ram_rtrans extends uvm_sequence_item;
  
  //enum for the type of operation we want to perform on the ram (IDLE, READ,
  //WRITE, SIM_RW)
  //rand trans_type kind_e;

  //read signals
  rand bit rd_enb;                             //enable signal for read
  rand bit [`ADDR_WIDTH-1:0] rd_addr;     //read address signal
  rand bit [`DATA_WIDTH-1:0] rd_data;     //read data signal

 
  `uvm_object_utils_begin(ram_rtrans)
//    `uvm_field_enum(kind_e, trans_type, UVM_ALL_ON)
    `uvm_field_int(rd_enb, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rd_addr, UVM_ALL_ON | UVM_DEC)
    `uvm_field_int(rd_data, UVM_ALL_ON | UVM_DEC)
  `uvm_object_utils_end

  function new(string name = "ram_rtrans");
    super.new(name);
  endfunction

endclass

`endif
