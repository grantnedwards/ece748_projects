//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    environment package that will run on the host simulator.
//
// CONTAINS:
//     - <lc3_configuration.svh>
//     - <lc3_environment.svh>
//     - <lc3_env_sequence_base.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package lc3_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import fetch_env_pkg::*;
  import decode_env_pkg::*;
  import writeback_env_pkg::*;
  import memaccess_env_pkg::*;
  import control_env_pkg::*;
  import execute_env_pkg::*;
  import inst_mem_pkg::*;
  import inst_mem_pkg_hdl::*;
  import data_mem_pkg::*;
  import data_mem_pkg_hdl::*;
  import fetch_env_pkg::*;
  import decode_env_pkg::*;
  import writeback_env_pkg::*;
  import memaccess_env_pkg::*;
  import control_env_pkg::*;
  import execute_env_pkg::*;
 

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/lc3_env_typedefs.svh"
  `include "src/lc3_env_configuration.svh"
  `include "src/lc3_environment.svh"
  `include "src/lc3_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

