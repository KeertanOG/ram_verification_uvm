////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_inf
// Project Name: ram_verification
// Description: Interface file
//
// V1.0 - File Created
///////////////////////////////////////



// guard statement to avoid multiple compilation of a file
`ifndef RAM_INF_SV
`define RAM_INF_SV

  interface ram_inf (input clk);

    logic rst;

    // write
    logic wr_enb;
    logic [(`ADDR_WIDTH-1):0] wr_addr;
    logic [(`DATA_WIDTH-1):0]wr_data;

    // read
    logic rd_enb;
    logic [(`ADDR_WIDTH-1):0] rd_addr;
    logic [(`DATA_WIDTH-1):0] rd_data;

    // clocking block for driver
    clocking drv_cb @(posedge clk);
      default input #1 output #1;
      // dut ka input clocking block ka output 
      // input rd_data;
      // output rst, wr_enb, wr_addr, wr_data, rd_enb, rd_addr;
      input rst;
      output wr_enb, wr_addr, wr_data, rd_enb, rd_addr;

    endclocking
    
    // clocking block for monitor
    clocking mon_cb @(posedge clk);
      default input #1 output #1;
      
      input rst, wr_enb, wr_addr, wr_data, rd_enb, rd_addr, rd_data;
    endclocking

      modport DRV_MP (clocking drv_cb,input clk);

      modport MON_MP (clocking mon_cb, input clk);

    endinterface


`endif
