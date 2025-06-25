////////////////////////////////////////
// Company: 
// Engineer: Keertan Patel
// 
// Create Date: 12.6.2025 10:41:16
// Module Name: ram_base_test
// Project Name: ram_verification 
// Description: base test file
//
// v1.0 - File Created
///////////////////////////////////////

// Guard statement to avoid multiple compilation of a file
`ifndef RAM_BASE_TEST_SV
`define RAM_BASE_TEST_SV

class ram_base_test extends uvm_test;

  `uvm_component_utils(ram_base_test)
  ram_env env_h;
  ram_wseqs wseqs_h;
  ram_rseqs rseqs_h;

  function new(string name="ram_base_test",uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_h = ram_env::type_id::create("env_h",this);
    wseqs_h = ram_wseqs::type_id::create("wseqs_h",this);
    rseqs_h = ram_rseqs::type_id::create("rseqs_h",this);
//
  endfunction
 
  //implementing multiple testcase so does not need run_phase here
//  task run_phase(uvm_phase phase);
//    phase.raise_objection(this);
//    fork
//      begin
//        //written to randomize the no of transactions
//        void'(wseqs_h.randomize() with {no_of_trans == 10;});
//        wseqs_h.start(env_h.wagt_h.wseqr_h);
//      end
//      begin
//        //written to randomize the no of transactions
//        void'(rseqs_h.randomize() with {no_of_trans == 10;});
//        rseqs_h.start(env_h.ragt_h.rseqr_h);
//      end
//    join
//    phase.drop_objection(this);
//  endtask

  function void report_phase(uvm_phase phase);
    uvm_report_server server_h;
    int err_count, fatal_count;

    server_h = uvm_report_server::get_server();

    err_count = server_h.get_severity_count(UVM_ERROR);
    fatal_count = server_h.get_severity_count(UVM_FATAL);

    $display("error count is: %0d",err_count);
    $display("fatal count is: %0d",fatal_count);
    if(err_count==0 && fatal_count==0) begin
      $display("========= ========= ========= =========");
      $display("=       = =       = =         =        ");
      $display("=       = =       = =         =        ");
      $display("=       = =       = =         =        ");
      $display("========= ========= ========= =========");
      $display("=         =       =         =         =");
      $display("=         =       =         =         =");
      $display("=         =       =         =         =");
      $display("=         =       =         =         =");
      $display("=         =       = ========= =========");
    end
    else begin
      $display("========= ========= ========= =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("========= =========     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       =     =     =      ");
      $display("=         =       = ========= =======");
    end
  endfunction
endclass

`endif
