////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rdriver
// Project Name: ram_verification 
// Description: Read driver file. 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RDRIVER_SV
`define RAM_RDRIVER_SV

class ram_rdriver extends uvm_driver #(ram_wtrans);

  `uvm_component_utils(ram_rdriver)

  virtual ram_inf vif;

  function new(string name="ram_rdriver", uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    seq_item_port.get_next_item(req);
    send_to_dut();
    seq_item_port.item_done;
  endtask

endclass

`endif
