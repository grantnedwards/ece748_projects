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
//    - <data_mem_typedefs_hdl>
//    - <data_mem_typedefs.svh>
//    - <data_mem_transaction.svh>

//    - <data_mem_configuration.svh>
//    - <data_mem_driver.svh>
//    - <data_mem_monitor.svh>

//    - <data_mem_transaction_coverage.svh>
//    - <data_mem_sequence_base.svh>
//    - <data_mem_random_sequence.svh>

//    - <data_mem_responder_sequence.svh>
//    - <data_mem2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package data_mem_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import data_mem_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/data_mem_macros.svh"

   export data_mem_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/data_mem_typedefs.svh"
   `include "src/data_mem_transaction.svh"

   `include "src/data_mem_configuration.svh"
   `include "src/data_mem_driver.svh"
   `include "src/data_mem_monitor.svh"

   `include "src/data_mem_transaction_coverage.svh"
   `include "src/data_mem_sequence_base.svh"
   `include "src/data_mem_random_sequence.svh"

   `include "src/data_mem_responder_sequence.svh"
   `include "src/data_mem2reg_adapter.svh"

   `include "src/data_mem_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

