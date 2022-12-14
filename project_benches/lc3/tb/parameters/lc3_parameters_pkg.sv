//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package contains test level parameters
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


package lc3_parameters_pkg;

  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end


  // These parameters are used to uniquely identify each interface.  The monitor_bfm and
  // driver_bfm are placed into and retrieved from the uvm_config_db using these string 
  // names as the field_name. The parameter is also used to enable transaction viewing 
  // from the command line for selected interfaces using the UVM command line processing.
  parameter string fetch_agent_fetch_in_BFM  = "fetch_agent_fetch_in_BFM"; /* [0] */
  parameter string fetch_agent_fetch_out_BFM  = "fetch_agent_fetch_out_BFM"; /* [1] */
  parameter string decode_agent_decode_in_BFM  = "decode_agent_decode_in_BFM"; /* [2] */
  parameter string decode_agent_decode_out_BFM  = "decode_agent_decode_out_BFM"; /* [3] */
  parameter string writeback_agent_writeback_in_BFM  = "writeback_agent_writeback_in_BFM"; /* [4] */
  parameter string writeback_agent_writeback_out_BFM  = "writeback_agent_writeback_out_BFM"; /* [5] */
  parameter string memaccess_agent_memaccess_in_BFM  = "memaccess_agent_memaccess_in_BFM"; /* [6] */
  parameter string memaccess_agent_memaccess_out_BFM  = "memaccess_agent_memaccess_out_BFM"; /* [7] */
  parameter string control_agent_control_in_BFM  = "control_agent_control_in_BFM"; /* [8] */
  parameter string control_agent_control_out_BFM  = "control_agent_control_out_BFM"; /* [9] */
  parameter string execute_agent_execute_in_BFM  = "execute_agent_execute_in_BFM"; /* [10] */
  parameter string execute_agent_execute_out_BFM  = "execute_agent_execute_out_BFM"; /* [11] */
  parameter string inst_mem_BFM  = "inst_mem_BFM"; /* [12] */
  parameter string data_mem_BFM  = "data_mem_BFM"; /* [13] */

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

