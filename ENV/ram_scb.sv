////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_scb
// Project Name: ram_verification 
// Description: Scoreboard file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_SCB_SV
`define RAM_SCB_SV

class ram_scb extends uvm_scoreboard;

  `uvm_component_utils(ram_scb)
  
  uvm_analysis_imp #(ram_wtrans) wscb_analysis_imp;
  uvm_analysis_imp #(ram_rtrans) rscb_analysis_imp;  

  int ram_assoc[int];

  function new(string name="ram_scb",uvm_component parent);
    super.new(name, parent);
    wscb_analysis_imp = new("wscb_analysis_imp",this);
    rscb_analysis_imp = new("rscb_analysis_imp",this);
    ram_assoc = new[`DEPTH];
  endfunction

  //function for write operation
  function void write_operation(ram_wtrans trans_wr);
    trans_h.print();
    
    if(trans_wr.wr_enb)
      ram_assoc[trans_wr.wr_addr] = trans_wr.wr_data;
  endfunction

	// write method for read operation 
	function void read_operation(ram_rtrans trans_rd);
    trans_rd.print();

		if(trans_rd.rd_enb)begin 
		  if(ram_assoc[trans_rd.rd_addr] == trans_rd.rd_data ) begin
				`uvm_info("info","pass",UVM_LOW);
		  end
		  else
			  `uvm_error("error",$sformatf("fail exp_data = %p",ram_dyn[trans_rd.rd_addr] ));
		end
	endfunction

endclass

`endif
