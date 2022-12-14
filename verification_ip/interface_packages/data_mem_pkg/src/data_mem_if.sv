//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the data_mem interface signals.
//      It is instantiated once per data_mem bus.  Bus Functional Models, 
//      BFM's named data_mem_driver_bfm, are used to drive signals on the bus.
//      BFM's named data_mem_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(data_mem_bus.complete_data), // Agent input 
// .dut_signal_port(data_mem_bus.Data_dout), // Agent input 
// .dut_signal_port(data_mem_bus.Data_din), // Agent output 
// .dut_signal_port(data_mem_bus.Data_rd), // Agent output 
// .dut_signal_port(data_mem_bus.Data_addr), // Agent output 

import uvmf_base_pkg_hdl::*;
import data_mem_pkg_hdl::*;

interface  data_mem_if 

  (
  input tri clock, 
  input tri reset,
  inout tri  complete_data,
  inout tri [15:0] Data_dout,
  inout tri [15:0] Data_din,
  inout tri  Data_rd,
  inout tri [15:0] Data_addr
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input complete_data,
  input Data_dout,
  input Data_din,
  input Data_rd,
  input Data_addr
  );

modport initiator_port 
  (
  input clock,
  input reset,
  input complete_data,
  input Data_dout,
  output Data_din,
  output Data_rd,
  output Data_addr
  );

modport responder_port 
  (
  input clock,
  input reset,  
  output complete_data,
  output Data_dout,
  input Data_din,
  input Data_rd,
  input Data_addr
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

