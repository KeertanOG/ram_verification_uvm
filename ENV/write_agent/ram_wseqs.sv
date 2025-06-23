////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_wseqs
// Project Name: ram_verification 
// Description: write sequence file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_WSEQ_SV
`define RAM_WSEQ_SV

class ram_wseqs extends uvm_sequence #(ram_wtrans);

  `uvm_object_utils(ram_wseqs)
  rand int no_of_trans;           //variable for no of transaction
  ram_wtrans wtrans_h;

  function new(string name="ram_wseqs");
    super.new(name);
  endfunction

  task body();
    repeat(no_of_trans) begin
      wtrans_h = ram_wtrans::type_id::create("wtrans_h");
      start_item(wtrans_h);
      assert(wtrans_h.randomize());
      finish_item(wtrans_h);
    end
  endtask

endclass

`endif
