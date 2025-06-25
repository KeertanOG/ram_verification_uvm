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

  virtual ram_inf vif;            //virtual interface handle

  function new(string name="ram_wdriver", uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    //waiting for initial reset
    wait(vif.rst);
    wait(!vif.rst);         //waiting for reset release
    forever begin
      fork
        begin
          wait(vif.rst);    //waiting for in-between reset
        end
        forever begin
          @(vif.drv_cb);
          seq_item_port.get_next_item(req);
          send_to_dut(req);
          seq_item_port.item_done();
        end
      join_any
      disable fork;
      wait(!vif.rst);
    end
  endtask

  task send_to_dut(ram_wtrans req);
    vif.drv_cb.wr_enb <= req.wr_enb;
    vif.drv_cb.wr_addr <= req.wr_addr;
    vif.drv_cb.wr_data <= req.wr_data;
  endtask

endclass

`endif
