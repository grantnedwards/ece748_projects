//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package contains all tests currently written for
//     the simulation project.  Once compiled, any test can be selected
//     from the vsim command line using +UVM_TESTNAME=yourTestNameHere
//
// CONTAINS:
//     -<test_top>
//     -<example_derived_test>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

package lc3_tests_pkg;

   import uvm_pkg::*;
   import uvmf_base_pkg::*;
   import lc3_parameters_pkg::*;
   import lc3_env_pkg::*;
   import lc3_sequences_pkg::*;
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


   `include "uvm_macros.svh"

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end

   `include "src/test_top.svh"
   `include "src/register_test.svh"
   `include "src/ctrl_test.svh"
   `include "src/example_derived_test.svh"
   `include "src/store_test.svh"
   `include "src/load_test.svh"
   `include "src/alu_test.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new tests to the src directory
  //    be sure to add the test file here so that it will be
  //    compiled as part of the test package.  Be sure to place
  //    the new test after any base tests of the new test.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

