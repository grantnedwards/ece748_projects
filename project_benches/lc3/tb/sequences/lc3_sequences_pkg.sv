//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package includes all high level sequence classes used 
//     in the environment.  These include utility sequences and top
//     level sequences.
//
// CONTAINS:
//     -<lc3_sequence_base>
//     -<example_derived_test_sequence>
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//

package lc3_sequences_pkg;
  import uvm_pkg::*;
  import uvmf_base_pkg::*;
  import fetch_in_pkg::*;
  import fetch_in_pkg_hdl::*;
  import fetch_out_pkg::*;
  import fetch_out_pkg_hdl::*;
  import decode_in_pkg::*;
  import decode_in_pkg_hdl::*;
  import decode_out_pkg::*;
  import decode_out_pkg_hdl::*;
  import writeback_in_pkg::*;
  import writeback_in_pkg_hdl::*;
  import writeback_out_pkg::*;
  import writeback_out_pkg_hdl::*;
  import memaccess_in_pkg::*;
  import memaccess_in_pkg_hdl::*;
  import memaccess_out_pkg::*;
  import memaccess_out_pkg_hdl::*;
  import control_in_pkg::*;
  import control_in_pkg_hdl::*;
  import control_out_pkg::*;
  import control_out_pkg_hdl::*;
  import execute_in_pkg::*;
  import execute_in_pkg_hdl::*;
  import execute_out_pkg::*;
  import execute_out_pkg_hdl::*;
  import inst_mem_pkg::*;
  import inst_mem_pkg_hdl::*;
  import data_mem_pkg::*;
  import data_mem_pkg_hdl::*;
  import lc3_parameters_pkg::*;
  import lc3_env_pkg::*;
  `include "uvm_macros.svh"

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  `include "src/lc3_bench_sequence_base.svh"
  `include "src/register_test_sequence.svh"
  `include "src/example_derived_test_sequence.svh"
  `include "src/jmp_br_sequence.svh"
  `include "src/alu_sequence.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the sequence package.  Be sure to place
  //    the new sequence after any base sequences of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

