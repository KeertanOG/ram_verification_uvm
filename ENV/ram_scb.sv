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

//decl macro
`uvm_analysis_imp_decl(_wr_mon)
`uvm_analysis_imp_decl(_rd_mon)

class ram_scb extends uvm_scoreboard;

  `uvm_component_utils(ram_scb)
  
  uvm_analysis_imp_wr_mon #(ram_wtrans, ram_scb) wscb_analysis_imp_wr_mon;
  uvm_analysis_imp_rd_mon #(ram_rtrans, ram_scb) rscb_analysis_imp_rd_mon;  

  int ram_assoc[int];

  function new(string name="ram_scb",uvm_component parent);
    super.new(name, parent);
    wscb_analysis_imp_wr_mon = new("wscb_analysis_imp_wr_mon",this);
    rscb_analysis_imp_rd_mon = new("rscb_analysis_imp_rd_mon",this);
  endfunction

  //function for write operation
  function void write_wr_mon(ram_wtrans trans_wr);
    trans_wr.print();
    
    if(trans_wr.wr_enb)
      ram_assoc[trans_wr.wr_addr] = trans_wr.wr_data;
  endfunction

	// write method for read operation 
	function void write_rd_mon(ram_rtrans trans_rd);
    trans_rd.print();

		if(trans_rd.rd_enb)begin 
		  if(ram_assoc[trans_rd.rd_addr] == trans_rd.rd_data ) begin
				`uvm_info("info","pass",UVM_LOW);
		  end
		  else
			  `uvm_error("error",$sformatf("fail exp_data = %p",ram_assoc[trans_rd.rd_addr]));
		end
	endfunction

endclass

`endif
