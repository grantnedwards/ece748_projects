//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the control_in signal monitoring.
//      It is accessed by the uvm control_in monitor through a virtual
//      interface handle in the control_in configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type control_in_if.
//
//     Input signals from the control_in_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//      Interface functions and tasks used by UVM components:
//             monitor(inout TRANS_T txn);
//                   This task receives the transaction, txn, from the
//                   UVM monitor and then populates variables in txn
//                   from values observed on bus activity.  This task
//                   blocks until an operation on the control_in bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import control_in_pkg_hdl::*;
`include "src/control_in_macros.svh"


interface control_in_monitor_bfm 
  ( control_in_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute control_in_monitor_bfm partition_interface_xif                                  

`ifndef XRTL
// This code is to aid in debugging parameter mismatches between the BFM and its corresponding agent.
// Enable this debug by setting UVM_VERBOSITY to UVM_DEBUG
// Setting UVM_VERBOSITY to UVM_DEBUG causes all BFM's and all agents to display their parameter settings.
// All of the messages from this feature have a UVM messaging id value of "CFG"
// The transcript or run.log can be parsed to ensure BFM parameter settings match its corresponding agents parameter settings.
import uvm_pkg::*;
`include "uvm_macros.svh"
initial begin : bfm_vs_agent_parameter_debug
  `uvm_info("CFG", 
      $psprintf("The BFM at '%m' has the following parameters: ", ),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`control_in_MONITOR_STRUCT
  control_in_monitor_s control_in_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `control_in_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  complete_data_i;
  tri  complete_instr_i;
  tri [15:0] IR_i;
  tri [2:0] psr_i;
  tri [15:0] IR_Exec_i;
  tri [15:0] IMem_dout_i;
  tri [2:0] NZP_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign complete_data_i = bus.complete_data;
  assign complete_instr_i = bus.complete_instr;
  assign IR_i = bus.IR;
  assign psr_i = bus.psr;
  assign IR_Exec_i = bus.IR_Exec;
  assign IMem_dout_i = bus.IMem_dout;
  assign NZP_i = bus.NZP;

  // Proxy handle to UVM monitor
  control_in_pkg::control_in_monitor  proxy;
  // pragma tbx oneway proxy.notify_transaction                 

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset();// pragma tbx xtf  
    @(posedge clock_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( reset_i === 0 ) ;                                                              
    @(posedge clock_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); // pragma tbx xtf 
    @(posedge clock_i);  
                                                                   
    repeat (count-1) @(posedge clock_i);                                                    
  endtask      

  //******************************************************************                         
  event go;                                                                                 
  function void start_monitoring();// pragma tbx xtf    
    -> go;
  endfunction                                                                               
  
  // ****************************************************************************              
  initial begin                                                                             
    @go;
    @(negedge reset_i);
    @(posedge clock_i);
    @(posedge clock_i);
    @(posedge clock_i);
    @(posedge clock_i);
    @(posedge clock_i);                                                                                 
    forever begin                                                                        
      @(posedge clock_i);
      do_monitor( control_in_monitor_struct );
      proxy.notify_transaction( control_in_monitor_struct );
 
    end                                                                                    
  end                                                                                       

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the monitor BFM.  It is called by the monitor within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the monitor BFM needs to be aware of the new configuration 
  // variables.
  //
    function void configure(control_in_configuration_s control_in_configuration_arg); // pragma tbx xtf  
    initiator_responder = control_in_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output control_in_monitor_s control_in_monitor_struct);
    //
    // Available struct members:
    //     //    control_in_monitor_struct.complete_data
    //     //    control_in_monitor_struct.complete_instr
    //     //    control_in_monitor_struct.IR
    //     //    control_in_monitor_struct.psr
    //     //    control_in_monitor_struct.IR_Exec
    //     //    control_in_monitor_struct.IMem_dout
    //     //    control_in_monitor_struct.NZP
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      control_in_monitor_struct.xyz = complete_data_i;  //     
    //      control_in_monitor_struct.xyz = complete_instr_i;  //     
    //      control_in_monitor_struct.xyz = IR_i;  //    [15:0] 
    //      control_in_monitor_struct.xyz = psr_i;  //    [2:0] 
    //      control_in_monitor_struct.xyz = IR_Exec_i;  //    [15:0] 
    //      control_in_monitor_struct.xyz = IMem_dout_i;  //    [15:0] 
    //      control_in_monitor_struct.xyz = NZP_i;  //    [2:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    control_in_monitor_struct.complete_data = complete_data_i;
    control_in_monitor_struct.complete_instr = complete_instr_i;
    control_in_monitor_struct.IR = IR_i;
    control_in_monitor_struct.psr = psr_i;
    control_in_monitor_struct.IR_Exec = IR_Exec_i;
    control_in_monitor_struct.IMem_dout = IMem_dout_i;
    control_in_monitor_struct.NZP = NZP_i; 
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

