//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the inst_mem signal driving.  It is
//     accessed by the uvm inst_mem driver through a virtual interface
//     handle in the inst_mem configuration.  It drives the singals passed
//     in through the port connection named bus of type inst_mem_if.
//
//     Input signals from the inst_mem_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within inst_mem_if based on INITIATOR/RESPONDER and/or
//     ARBITRATION/GRANT status.  
//
//     The output signal connections are as follows:
//        signal_o -> bus.signal
//
//                                                                                           
//      Interface functions and tasks used by UVM components:
//
//             configure:
//                   This function gets configuration attributes from the
//                   UVM driver to set any required BFM configuration
//                   variables such as 'initiator_responder'.                                       
//                                                                                           
//             initiate_and_get_response:
//                   This task is used to perform signaling activity for initiating
//                   a protocol transfer.  The task initiates the transfer, using
//                   input data from the initiator struct.  Then the task captures
//                   response data, placing the data into the response struct.
//                   The response struct is returned to the driver class.
//
//             respond_and_wait_for_next_transfer:
//                   This task is used to complete a current transfer as a responder
//                   and then wait for the initiator to start the next transfer.
//                   The task uses data in the responder struct to drive protocol
//                   signals to complete the transfer.  The task then waits for 
//                   the next transfer.  Once the next transfer begins, data from
//                   the initiator is placed into the initiator struct and sent
//                   to the responder sequence for processing to determine 
//                   what data to respond with.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import inst_mem_pkg_hdl::*;
`include "src/inst_mem_macros.svh"

interface inst_mem_driver_bfm 
  (inst_mem_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute inst_mem_driver_bfm partition_interface_xif

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

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri [15:0] instr_dout_i;
  reg [15:0] instr_dout_o = 'bz;
  tri  complete_instr_i;
  reg  complete_instr_o = 'bz;

  // INITIATOR mode output signals
  tri [15:0] PC_i;
  reg [15:0] PC_o = 'bz;
  tri  instrmem_rd_i;
  reg  instrmem_rd_o = 'bz;

  // Bi-directional signals
  

  assign clock_i = bus.clock;
  assign reset_i = bus.reset;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign instr_dout_i = bus.instr_dout;
  assign bus.instr_dout = (initiator_responder == RESPONDER) ? instr_dout_o : 'bz;
  assign complete_instr_i = bus.complete_instr;
  assign bus.complete_instr = (initiator_responder == RESPONDER) ? complete_instr_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.PC = (initiator_responder == INITIATOR) ? PC_o : 'bz;
  assign PC_i = bus.PC;
  assign bus.instrmem_rd = (initiator_responder == INITIATOR) ? instrmem_rd_o : 'bz;
  assign instrmem_rd_i = bus.instrmem_rd;

  // Proxy handle to UVM driver
  inst_mem_pkg::inst_mem_driver   proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in inst_mem_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from inst_mem_driver to this BFM
  // ****************************************************************************
  `inst_mem_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by inst_mem_driver and inst_mem_driver_bfm
  // to communicate initiator driven data to inst_mem_driver_bfm.           
  `inst_mem_INITIATOR_STRUCT
    inst_mem_initiator_s initiator_struct;
  // Responder macro used by inst_mem_driver and inst_mem_driver_bfm
  // to communicate Responder driven data to inst_mem_driver_bfm.
  `inst_mem_RESPONDER_STRUCT
    inst_mem_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( posedge reset_i )
     begin
       // RESPONDER mode output signals
       instr_dout_o <= 'bz;
       complete_instr_o <= 'bz;
       // INITIATOR mode output signals
       PC_o <= 'bz;
       instrmem_rd_o <= 'bz;
       // Bi-directional signals
 
     end    
// pragma uvmf custom reset_condition_and_response end

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the driver BFM.  It is called by the driver within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the driver BFM needs to be aware of the new configuration 
  // variables.
  //

  function void configure(inst_mem_configuration_s inst_mem_configuration_arg); // pragma tbx xtf  
    initiator_responder = inst_mem_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction                                                                             

// pragma uvmf custom initiate_and_get_response begin
// ****************************************************************************
// UVMF_CHANGE_ME
// This task is used by an initator.  The task first initiates a transfer then
// waits for the responder to complete the transfer.
    task initiate_and_get_response( 
       // This argument passes transaction variables used by an initiator
       // to perform the initial part of a protocol transfer.  The values
       // come from a sequence item created in a sequence.
       input inst_mem_initiator_s inst_mem_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output inst_mem_responder_s inst_mem_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the inst_mem_initiator_struct:
       //   op_t opcode ;
       //   bit [2:0] sr1 ;
       //   bit [2:0] sr2 ;
       //   bit [2:0] dr ;
       //   bit mode ;
       //   bit [2:0] baser ;
       //   bit [8:0] pcoffset9 ;
       //   bit [5:0] pcoffset6 ;
       //   bit [4:0] imm5 ;
       //   bit [2:0] nzp ;
       //   word PC ;
       //   bit instrmem_rd ;
       //   word instr_dout ;
       //   bit complete_instr ;
       // Members within the inst_mem_responder_struct:
       //   op_t opcode ;
       //   bit [2:0] sr1 ;
       //   bit [2:0] sr2 ;
       //   bit [2:0] dr ;
       //   bit mode ;
       //   bit [2:0] baser ;
       //   bit [8:0] pcoffset9 ;
       //   bit [5:0] pcoffset6 ;
       //   bit [4:0] imm5 ;
       //   bit [2:0] nzp ;
       //   word PC ;
       //   bit instrmem_rd ;
       //   word instr_dout ;
       //   bit complete_instr ;
       initiator_struct = inst_mem_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      inst_mem_responder_struct.xyz = instr_dout_i;  //    [15:0] 
       //      inst_mem_responder_struct.xyz = complete_instr_i;  //     
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      PC_o <= inst_mem_initiator_struct.xyz;  //    [15:0] 
       //      instrmem_rd_o <= inst_mem_initiator_struct.xyz;  //     
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge clock_i);
    @(posedge clock_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // inst_mem_responder_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    responder_struct = inst_mem_responder_struct;
  endtask        
// pragma uvmf custom initiate_and_get_response end

// pragma uvmf custom respond_and_wait_for_next_transfer begin
// ****************************************************************************
// The first_transfer variable is used to prevent completing a transfer in the 
// first call to this task.  For the first call to this task, there is not
// current transfer to complete.
bit first_transfer=1;

// UVMF_CHANGE_ME
// This task is used by a responder.  The task first completes the current 
// transfer in progress then waits for the initiator to start the next transfer.
  task respond_and_wait_for_next_transfer( 
       // This argument is used to send data received from the initiator
       // back to the sequence item.  The sequence determines how to respond.
       output inst_mem_initiator_s inst_mem_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input inst_mem_responder_s inst_mem_responder_struct 
       );// pragma tbx xtf   
  // Variables within the inst_mem_initiator_struct:
  //   op_t opcode ;
  //   bit [2:0] sr1 ;
  //   bit [2:0] sr2 ;
  //   bit [2:0] dr ;
  //   bit mode ;
  //   bit [2:0] baser ;
  //   bit [8:0] pcoffset9 ;
  //   bit [5:0] pcoffset6 ;
  //   bit [4:0] imm5 ;
  //   bit [2:0] nzp ;
  //   word PC ;
  //   bit instrmem_rd ;
  //   word instr_dout ;
  //   bit complete_instr ;
  // Variables within the inst_mem_responder_struct:
  //   op_t opcode ;
  //   bit [2:0] sr1 ;
  //   bit [2:0] sr2 ;
  //   bit [2:0] dr ;
  //   bit mode ;
  //   bit [2:0] baser ;
  //   bit [8:0] pcoffset9 ;
  //   bit [5:0] pcoffset6 ;
  //   bit [4:0] imm5 ;
  //   bit [2:0] nzp ;
  //   word PC ;
  //   bit instrmem_rd ;
  //   word instr_dout ;
  //   bit complete_instr ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      inst_mem_responder_struct.xyz = PC_i;  //    [15:0] 
       //      inst_mem_responder_struct.xyz = instrmem_rd_i;  //     
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      instr_dout_o <= inst_mem_initiator_struct.xyz;  //    [15:0] 
       //      complete_instr_o <= inst_mem_initiator_struct.xyz;  //     
       //    Responder inout signals
    
  @(posedge clock_i);
  while	 (instrmem_rd_i != 1) @(posedge clock_i);
		instr_dout_o <= inst_mem_responder_struct.instr_dout;
		complete_instr_o <= 1;  
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

