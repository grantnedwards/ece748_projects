 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider fetch_agent_fetch_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch/agent_fetch_in/agent_fetch_in_monitor/txn_stream
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/*
add wave -noupdate -divider fetch_agent_fetch_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch/agent_fetch_out/agent_fetch_out_monitor/txn_stream
add wave -noupdate -group fetch_agent_fetch_out_bus /hdl_top/fetch_agent_fetch_out_bus/*
add wave -noupdate -divider decode_agent_decode_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode/agent_decode_in/agent_decode_in_monitor/txn_stream
add wave -noupdate -group decode_agent_decode_in_bus /hdl_top/decode_agent_decode_in_bus/*
add wave -noupdate -divider decode_agent_decode_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode/agent_decode_out/agent_decode_out_monitor/txn_stream
add wave -noupdate -group decode_agent_decode_out_bus /hdl_top/decode_agent_decode_out_bus/*
add wave -noupdate -divider writeback_agent_writeback_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback/agent_writeback_in/agent_writeback_in_monitor/txn_stream
add wave -noupdate -group writeback_agent_writeback_in_bus /hdl_top/writeback_agent_writeback_in_bus/*
add wave -noupdate -divider writeback_agent_writeback_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback/agent_writeback_out/agent_writeback_out_monitor/txn_stream
add wave -noupdate -group writeback_agent_writeback_out_bus /hdl_top/writeback_agent_writeback_out_bus/*
add wave -noupdate -divider memaccess_agent_memaccess_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess/agent_memaccess_in/agent_memaccess_in_monitor/txn_stream
add wave -noupdate -group memaccess_agent_memaccess_in_bus /hdl_top/memaccess_agent_memaccess_in_bus/*
add wave -noupdate -divider memaccess_agent_memaccess_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess/agent_memaccess_out/agent_memaccess_out_monitor/txn_stream
add wave -noupdate -group memaccess_agent_memaccess_out_bus /hdl_top/memaccess_agent_memaccess_out_bus/*
add wave -noupdate -divider control_agent_control_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.control/agent_control_in/agent_control_in_monitor/txn_stream
add wave -noupdate -group control_agent_control_in_bus /hdl_top/control_agent_control_in_bus/*
add wave -noupdate -divider control_agent_control_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.control/agent_control_out/agent_control_out_monitor/txn_stream
add wave -noupdate -group control_agent_control_out_bus /hdl_top/control_agent_control_out_bus/*
add wave -noupdate -divider execute_agent_execute_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute/agent_execute_in/agent_execute_in_monitor/txn_stream
add wave -noupdate -group execute_agent_execute_in_bus /hdl_top/execute_agent_execute_in_bus/*
add wave -noupdate -divider execute_agent_execute_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute/agent_execute_out/agent_execute_out_monitor/txn_stream
add wave -noupdate -group execute_agent_execute_out_bus /hdl_top/execute_agent_execute_out_bus/*
add wave -noupdate -divider inst_mem 
add wave -noupdate /uvm_root/uvm_test_top/environment/inst_mem/inst_mem_monitor/txn_stream
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/*
add wave -noupdate -divider data_mem 
add wave -noupdate /uvm_root/uvm_test_top/environment/data_mem/data_mem_monitor/txn_stream
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/*

TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27 ns} {168 ns}

