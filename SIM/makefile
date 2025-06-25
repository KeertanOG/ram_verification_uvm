compile:
	vlog -coveropt 3 +cover +acc +incdir+../ENV +incdir+../TEST +incdir+../ENV/read_agent +incdir+../ENV/write_agent ../TEST/ram_pkg.sv ../TOP/ram_tb_top.sv ../RTL/ram_rtl.sv
 
sim:
	@echo "Running with test"
	vsim -voptargs=+acc ram_tb_top +UVM_TESTNAME=$(TEST)
 
sim_cmd:
	@echo "Running in command-line mode with test"
	vsim -voptargs=+acc -coverage ram_tb_top -c -do "run -all; exit;" +UVM_TESTNAME=$(TEST)

run_regression:
	@echo "Running in command-line mode with test $(TEST)"
	vsim -voptargs=+acc -coverage AHB_tb_top  -c -do "coverage save -onexit -directive -cvg -codeall write_cover.ucdb;run -all; exit;" +WRITE_READ
	vsim -voptargs=+acc -coverage AHB_tb_top  -c -do "coverage save -onexit -directive -cvg -codeall write_cover.ucdb;run -all; exit;" +BACK2BACK
	vsim -voptargs=+acc -coverage AHB_tb_top  -c -do "coverage save -onexit -directive -cvg -codeall write_cover.ucdb;run -all; exit;" +IDLE_TEST

merge_cover:
	vcover merge final_cover.ucdb write_cover.ucdb read_cover.ucdb sim_rw_cover.ucdb b2b_cover.ucdb random_cover.ucdb

vcover:
	vcover report -details -html -htmldir coverage final_cover.ucdb
