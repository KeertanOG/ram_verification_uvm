////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_rseqs
// Project Name: ram_verification 
// Description: read sequence file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_RSEQ_SV
`define RAM_RSEQ_SV

class ram_rseqs extends uvm_sequence #(ram_rtrans);

  `uvm_object_utils(ram_rseqs)
  rand int no_of_trans;         //variable for no of transaction
  ram_rtrans rtrans_h;

  function new(string name="ram_rseqs");
    super.new(name);
  endfunction

//  task body();
//    repeat(no_of_trans) begin
//      rtrans_h = ram_rtrans::type_id::create("rtrans_h");
//      start_item(rtrans_h);
//      assert(rtrans_h.randomize());
//      finish_item(rtrans_h);
//    end
//  endtask

endclass

`endif
