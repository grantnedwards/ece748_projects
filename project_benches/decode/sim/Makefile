# Makefile for use with ECE748 Project 1A
#

comp_decode_in_pkg:
	vlog -sv +incdir+../../../verification_ip/interface_packages/decode_in_pkg \
../../../verification_ip/interface_packages/decode_in_pkg/decode_in_pkg.sv \
../../../verification_ip/interface_packages/decode_in_pkg/src/decode_in_if.sv \
../../../verification_ip/interface_packages/decode_in_pkg/src/decode_in_driver_bfm.sv \
../../../verification_ip/interface_packages/decode_in_pkg/src/decode_in_monitor_bfm.sv

comp_decode_test_pkg:
	vlog -sv +incdir+../tb/tests ../tb/tests/decode_test_pkg.sv

comp_data_types_pkg:
	vlog -sv +incdir+../../../verification_ip/data_types_pkg ../../../verification_ip/data_types_pkg/data_types_pkg.sv

comp_test_bench:
	vlog -sv ../tb/testbench/hdl_top.sv ../tb/testbench/hvl_top.sv

p1_debug: comp_data_types_pkg comp_decode_in_pkg comp_decode_test_pkg comp_test_bench
	vsim -sv_seed 1 +UVM_TESTNAME=test_top +UVM_VERBOSITY=UVM_HIGH +notimingchecks -suppress 8887 -classdebug -uvmcontrol=all -do " coverage save -onexit test_top.ucdb; set IterationLimit 140000; set NoQuitOnFinish 1; onbreak {resume}; " hdl_top hvl_top

clean:
	rm -rf work
	rm transcript
