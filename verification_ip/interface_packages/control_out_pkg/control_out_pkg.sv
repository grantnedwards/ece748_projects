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
//    - <control_out_typedefs_hdl>
//    - <control_out_typedefs.svh>
//    - <control_out_transaction.svh>

//    - <control_out_configuration.svh>
//    - <control_out_driver.svh>
//    - <control_out_monitor.svh>

//    - <control_out_transaction_coverage.svh>
//    - <control_out_sequence_base.svh>
//    - <control_out_random_sequence.svh>

//    - <control_out_responder_sequence.svh>
//    - <control_out2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package control_out_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import control_out_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/control_out_macros.svh"

   export control_out_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/control_out_typedefs.svh"
   `include "src/control_out_transaction.svh"

   `include "src/control_out_configuration.svh"
   `include "src/control_out_driver.svh"
   `include "src/control_out_monitor.svh"

   `include "src/control_out_transaction_coverage.svh"
   `include "src/control_out_sequence_base.svh"
   `include "src/control_out_random_sequence.svh"

   `include "src/control_out_responder_sequence.svh"
   `include "src/control_out2reg_adapter.svh"

   `include "src/control_out_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

