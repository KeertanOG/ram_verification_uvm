////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_tb_top
// Project Name: ram_verification 
// Description: Top module of the ram verification
//
// v1.0 - File Created
///////////////////////////////////////

module ram_tb_top;
  
  import uvm_pkg :: *;
  `include "uvm_macros.svh"
  
  import ram_pkg :: *;

  bit clk;                  //clock signal declaration

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  ram_inf r_inf(clk);

  ram dut(
    .clk(clk),
    .rstn(r_inf.rst), 
    .wr_enb(r_inf.wr_enb), 
    .wr_addr(r_inf.wr_addr), 
    .wr_data(r_inf.wr_data), 
    .rd_enb(r_inf.rd_enb), 
    .rd_addr(r_inf.rd_addr), 
    .rd_data(r_inf.rd_data));

  //virtual interface set
  
  initial begin
    fork
      r_inf.reset(333);
      uvm_config_db #(virtual ram_inf)::set(null,"*","vif",r_inf);
      run_test("tb_top");
    join
  end

endmodule
