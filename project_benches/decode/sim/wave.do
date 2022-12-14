onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hdl_top/decode_in_bus/clock
add wave -noupdate /hdl_top/decode_in_bus/reset
add wave -noupdate /hdl_top/decode_in_bus/npc_in
add wave -noupdate /hdl_top/decode_in_bus/dout
add wave -noupdate /hdl_top/decode_in_bus/enable_decode
add wave -noupdate /hdl_top/decode_out_bus/clock
add wave -noupdate /hdl_top/decode_out_bus/reset
add wave -noupdate /hdl_top/decode_out_bus/W_control
add wave -noupdate /hdl_top/decode_out_bus/Mem_control
add wave -noupdate /hdl_top/decode_out_bus/E_control
add wave -noupdate /hdl_top/decode_out_bus/IR
add wave -noupdate /hdl_top/decode_out_bus/npc_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {263 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 316
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
WaveRestoreZoom {0 ns} {373 ns}
