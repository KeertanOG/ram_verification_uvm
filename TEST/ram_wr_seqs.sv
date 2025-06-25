////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wr_seqs
// Project Name: ram_verification 
// Description: only write testcase sequence file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WR_SEQS_SV
`define RAM_WR_SEQS_SV

class ram_wr_seqs extends ram_wseqs;

  `uvm_object_utils(ram_wr_seqs)
  rand int no_of_trans;             //variable to randomize the no of transactions

  ram_wtrans wtrans_h;

  constraint trans_no{soft no_of_trans == 1;}

  function new(string name = "ram_wr_seqs");
    super.new(name);
  endfunction

  task body();
    repeat(no_of_trans) begin
      wtrans_h = ram_wtrans::type_id::create("wtrans_h");
      start_item(wtrans_h);
      assert(wtrans_h.randomize() with {wr_enb == 1;})
      finish_item(wtrans_h);
    end
  endtask

endclass

`endif  
