////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rd_seqs
// Project Name: ram_verification 
// Description: only read testcase sequence file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RD_SEQS_SV
`define RAM_RD_SEQS_SV

class ram_rd_seqs extends ram_rseqs;

  `uvm_object_utils(ram_rd_seqs)
  rand int no_of_trans;             //variable to randomize the no of transactions

  ram_rtrans rtrans_h;

  constraint trans_no{soft no_of_trans == 1;}

  function new(string name = "ram_rd_seqs");
    super.new(name);
  endfunction

  task body();
    repeat(no_of_trans) begin
      rtrans_h = ram_rtrans::type_id::create("rtrans_h");
      start_item(rtrans_h);
      assert(rtrans_h.randomize() with {rd_enb == 1;})
      finish_item(rtrans_h);
    end
  endtask

endclass

`endif  
