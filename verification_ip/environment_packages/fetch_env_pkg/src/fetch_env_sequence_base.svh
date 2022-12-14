//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This file contains environment level sequences that will
//    be reused from block to top level simulations.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class fetch_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( fetch_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This fetch_env_sequence_base contains a handle to a fetch_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in fetch_environment:
    // configuration.agent_fetch_in_config.sequencer
    // configuration.agent_fetch_out_config.sequencer

  // Responder agent sequencers in fetch_environment:


    typedef fetch_in_random_sequence agent_fetch_in_random_sequence_t;
    agent_fetch_in_random_sequence_t agent_fetch_in_rand_seq;

    typedef fetch_out_random_sequence agent_fetch_out_random_sequence_t;
    agent_fetch_out_random_sequence_t agent_fetch_out_rand_seq;




  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);
    agent_fetch_in_rand_seq = agent_fetch_in_random_sequence_t::type_id::create("agent_fetch_in_rand_seq");
    agent_fetch_out_rand_seq = agent_fetch_out_random_sequence_t::type_id::create("agent_fetch_out_rand_seq");


  endfunction

  virtual task body();

    if ( configuration.agent_fetch_in_config.sequencer != null )
       repeat (25) agent_fetch_in_rand_seq.start(configuration.agent_fetch_in_config.sequencer);
    if ( configuration.agent_fetch_out_config.sequencer != null )
       repeat (25) agent_fetch_out_rand_seq.start(configuration.agent_fetch_out_config.sequencer);


  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

