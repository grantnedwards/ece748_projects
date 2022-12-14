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
class lc3_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( lc3_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This lc3_env_sequence_base contains a handle to a lc3_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in lc3_environment:
    // configuration.inst_mem_config.sequencer
    // configuration.data_mem_config.sequencer

  // Responder agent sequencers in lc3_environment:

  // Virtual sequencers in sub-environments located in sub-environment configuration
    // configuration.fetch_config.vsqr
    // configuration.decode_config.vsqr
    // configuration.writeback_config.vsqr
    // configuration.memaccess_config.vsqr
    // configuration.control_config.vsqr
    // configuration.execute_config.vsqr

    typedef inst_mem_responder_sequence inst_mem_responder_sequence_t;
    inst_mem_responder_sequence_t inst_mem_resp_seq;

    typedef data_mem_responder_sequence data_mem_responder_sequence_t;
    data_mem_responder_sequence_t data_mem_resp_seq;


typedef fetch_env_sequence_base #(
        .CONFIG_T(fetch_env_configuration)
        ) 
        fetch_sequence_base_t;
rand fetch_sequence_base_t fetch_seq;

typedef decode_env_sequence_base #(
        .CONFIG_T(decode_env_configuration)
        ) 
        decode_sequence_base_t;
rand decode_sequence_base_t decode_seq;

typedef writeback_env_sequence_base #(
        .CONFIG_T(writeback_env_configuration)
        ) 
        writeback_sequence_base_t;
rand writeback_sequence_base_t writeback_seq;

typedef memaccess_env_sequence_base #(
        .CONFIG_T(memaccess_env_configuration)
        ) 
        memaccess_sequence_base_t;
rand memaccess_sequence_base_t memaccess_seq;

typedef control_env_sequence_base #(
        .CONFIG_T(control_env_configuration)
        ) 
        control_sequence_base_t;
rand control_sequence_base_t control_seq;

typedef execute_env_sequence_base #(
        .CONFIG_T(execute_env_configuration)
        ) 
        execute_sequence_base_t;
rand execute_sequence_base_t execute_seq;



  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);
    inst_mem_resp_seq = inst_mem_responder_sequence_t::type_id::create("inst_mem_resp_seq");
    data_mem_resp_seq = data_mem_responder_sequence_t::type_id::create("data_mem_resp_seq");

    fetch_seq = fetch_sequence_base_t::type_id::create("fetch_seq");
    decode_seq = decode_sequence_base_t::type_id::create("decode_seq");
    writeback_seq = writeback_sequence_base_t::type_id::create("writeback_seq");
    memaccess_seq = memaccess_sequence_base_t::type_id::create("memaccess_seq");
    control_seq = control_sequence_base_t::type_id::create("control_seq");
    execute_seq = execute_sequence_base_t::type_id::create("execute_seq");

  endfunction

  virtual task body();
        /*
    if ( configuration.inst_mem_config.sequencer != null )
       repeat (25) inst_mem_resp_seq.start(configuration.inst_mem_config.sequencer);
    if ( configuration.data_mem_config.sequencer != null )
       repeat (25) data_mem_resp_seq.start(configuration.data_mem_config.sequencer);
        */
   
    fetch_seq.start(configuration.fetch_config.vsqr);
    decode_seq.start(configuration.decode_config.vsqr);
    writeback_seq.start(configuration.writeback_config.vsqr);
    memaccess_seq.start(configuration.memaccess_config.vsqr);
    control_seq.start(configuration.control_config.vsqr);
    execute_seq.start(configuration.execute_config.vsqr);


  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

