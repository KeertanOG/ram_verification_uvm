////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wdriver
// Project Name: ram_verification 
// Description: Write driver file. 
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WDRIVER_SV
`define RAM_WDRIVER_SV

class ram_wdriver extends uvm_driver #(ram_wtrans);

  `uvm_component_utils(ram_wdriver)

  virtual ram_inf vif;

  function new(string name="ram_wdriver", uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    seq_item_port.get_next_item(req);
    send_to_dut();
    seq_item_port.item_done;
  endtask

  task send_to_dut();
  endtask

endclass

`endif
