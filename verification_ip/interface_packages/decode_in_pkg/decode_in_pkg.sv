package decode_in_pkg;
    import uvm_pkg::*;
    import data_types_pkg::*;
    `include "uvm_macros.svh"
    `include "src/decode_in_transaction.sv"
    `include "src/decode_in_sequence.sv"
    `include "src/decode_in_config.sv"
    `include "src/decode_in_coverage.sv"
    `include "src/decode_in_driver.sv"
    `include "src/decode_in_monitor.sv"
    `include "src/decode_in_sequencer.sv"
    `include "src/decode_in_agent.sv"
    // NOTE: BFMs and Interface of Decode In are in the Makefile
    // DO NOT PUT THEM HERE
endpackage