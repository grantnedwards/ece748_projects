//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    interface package that will run on the host simulator.
//
// CONTAINS:
//    - <inst_mem_typedefs_hdl>
//    - <inst_mem_typedefs.svh>
//    - <inst_mem_transaction.svh>

//    - <inst_mem_configuration.svh>
//    - <inst_mem_driver.svh>
//    - <inst_mem_monitor.svh>

//    - <inst_mem_transaction_coverage.svh>
//    - <inst_mem_sequence_base.svh>
//    - <inst_mem_random_sequence.svh>

//    - <inst_mem_responder_sequence.svh>
//    - <inst_mem2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package inst_mem_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import inst_mem_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/inst_mem_macros.svh"

   export inst_mem_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/inst_mem_typedefs.svh"
   `include "src/inst_mem_transaction.svh"

   `include "src/inst_mem_load_txrs.svh"
   `include "src/inst_mem_store_txrs.svh"

   `include "src/inst_mem_configuration.svh"
   `include "src/inst_mem_driver.svh"
   `include "src/inst_mem_monitor.svh"

   `include "src/inst_mem_transaction_coverage.svh"
   `include "src/inst_mem_sequence_base.svh"
   `include "src/inst_mem_random_sequence.svh"
   

   `include "src/inst_mem_responder_sequence.svh"
   `include "src/inst_mem2reg_adapter.svh"

   `include "src/inst_mem_agent.svh"
   `include "src/sequences/inst_mem_directed_ctrl_resp_seq.svh"
   `include "src/sequences/inst_mem_directed_load_seq.svh"
   `include "src/sequences/inst_mem_directed_alu_seq.svh"
   `include "src/sequences/inst_mem_directed_store_seq.svh"
   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

