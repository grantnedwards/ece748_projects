//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// Description: This file contains the top level and utility sequences
//     used by test_top. It can be extended to create derivative top
//     level sequences.
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//


typedef lc3_env_configuration  lc3_env_configuration_t;

class lc3_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( lc3_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef lc3_env_sequence_base #(
        .CONFIG_T(lc3_env_configuration_t)
        )
        lc3_env_sequence_base_t;
rand lc3_env_sequence_base_t lc3_env_seq;

integer num_clocks = 3000;

  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef inst_mem_responder_sequence  inst_mem_responder_seq_t;
  inst_mem_responder_seq_t inst_mem_resp_seq;
  typedef data_mem_responder_sequence  data_mem_responder_seq_t;
  data_mem_responder_seq_t data_mem_resp_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef inst_mem_transaction  inst_mem_transaction_t;
  uvm_sequencer #(inst_mem_transaction_t)  inst_mem_sequencer; 
  typedef data_mem_transaction  data_mem_transaction_t;
  uvm_sequencer #(data_mem_transaction_t)  data_mem_sequencer; 


  // Top level environment configuration handle
  lc3_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  fetch_in_configuration  fetch_agent_fetch_in_config;
  fetch_out_configuration  fetch_agent_fetch_out_config;
  decode_in_configuration  decode_agent_decode_in_config;
  decode_out_configuration  decode_agent_decode_out_config;
  writeback_in_configuration  writeback_agent_writeback_in_config;
  writeback_out_configuration  writeback_agent_writeback_out_config;
  memaccess_in_configuration  memaccess_agent_memaccess_in_config;
  memaccess_out_configuration  memaccess_agent_memaccess_out_config;
  control_in_configuration  control_agent_control_in_config;
  control_out_configuration  control_agent_control_out_config;
  execute_in_configuration  execute_agent_execute_in_config;
  execute_out_configuration  execute_agent_execute_out_config;
  inst_mem_configuration  inst_mem_config;
  data_mem_configuration  data_mem_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(lc3_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(lc3_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( fetch_in_configuration )::get( null , UVMF_CONFIGURATIONS , fetch_agent_fetch_in_BFM , fetch_agent_fetch_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_in_configuration )::get cannot find resource fetch_agent_fetch_in_BFM" )
    if( !uvm_config_db #( fetch_out_configuration )::get( null , UVMF_CONFIGURATIONS , fetch_agent_fetch_out_BFM , fetch_agent_fetch_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_out_configuration )::get cannot find resource fetch_agent_fetch_out_BFM" )
    if( !uvm_config_db #( decode_in_configuration )::get( null , UVMF_CONFIGURATIONS , decode_agent_decode_in_BFM , decode_agent_decode_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_in_configuration )::get cannot find resource decode_agent_decode_in_BFM" )
    if( !uvm_config_db #( decode_out_configuration )::get( null , UVMF_CONFIGURATIONS , decode_agent_decode_out_BFM , decode_agent_decode_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_out_configuration )::get cannot find resource decode_agent_decode_out_BFM" )
    if( !uvm_config_db #( writeback_in_configuration )::get( null , UVMF_CONFIGURATIONS , writeback_agent_writeback_in_BFM , writeback_agent_writeback_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( writeback_in_configuration )::get cannot find resource writeback_agent_writeback_in_BFM" )
    if( !uvm_config_db #( writeback_out_configuration )::get( null , UVMF_CONFIGURATIONS , writeback_agent_writeback_out_BFM , writeback_agent_writeback_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( writeback_out_configuration )::get cannot find resource writeback_agent_writeback_out_BFM" )
    if( !uvm_config_db #( memaccess_in_configuration )::get( null , UVMF_CONFIGURATIONS , memaccess_agent_memaccess_in_BFM , memaccess_agent_memaccess_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_in_configuration )::get cannot find resource memaccess_agent_memaccess_in_BFM" )
    if( !uvm_config_db #( memaccess_out_configuration )::get( null , UVMF_CONFIGURATIONS , memaccess_agent_memaccess_out_BFM , memaccess_agent_memaccess_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_out_configuration )::get cannot find resource memaccess_agent_memaccess_out_BFM" )
    if( !uvm_config_db #( control_in_configuration )::get( null , UVMF_CONFIGURATIONS , control_agent_control_in_BFM , control_agent_control_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_in_configuration )::get cannot find resource control_agent_control_in_BFM" )
    if( !uvm_config_db #( control_out_configuration )::get( null , UVMF_CONFIGURATIONS , control_agent_control_out_BFM , control_agent_control_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_out_configuration )::get cannot find resource control_agent_control_out_BFM" )
    if( !uvm_config_db #( execute_in_configuration )::get( null , UVMF_CONFIGURATIONS , execute_agent_execute_in_BFM , execute_agent_execute_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_in_configuration )::get cannot find resource execute_agent_execute_in_BFM" )
    if( !uvm_config_db #( execute_out_configuration )::get( null , UVMF_CONFIGURATIONS , execute_agent_execute_out_BFM , execute_agent_execute_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_out_configuration )::get cannot find resource execute_agent_execute_out_BFM" )
    if( !uvm_config_db #( inst_mem_configuration )::get( null , UVMF_CONFIGURATIONS , inst_mem_BFM , inst_mem_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( inst_mem_configuration )::get cannot find resource inst_mem_BFM" )
    if( !uvm_config_db #( data_mem_configuration )::get( null , UVMF_CONFIGURATIONS , data_mem_BFM , data_mem_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( data_mem_configuration )::get cannot find resource data_mem_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    inst_mem_sequencer = inst_mem_config.get_sequencer();
    data_mem_sequencer = data_mem_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    lc3_env_seq = lc3_env_sequence_base_t::type_id::create("lc3_env_seq");

    inst_mem_resp_seq     = inst_mem_responder_seq_t::type_id::create("inst_mem_resp_seq");
    data_mem_resp_seq     = data_mem_responder_seq_t::type_id::create("data_mem_resp_seq");
    fork
      fetch_agent_fetch_in_config.wait_for_reset();
      fetch_agent_fetch_out_config.wait_for_reset();
      decode_agent_decode_in_config.wait_for_reset();
      decode_agent_decode_out_config.wait_for_reset();
      writeback_agent_writeback_in_config.wait_for_reset();
      writeback_agent_writeback_out_config.wait_for_reset();
      memaccess_agent_memaccess_in_config.wait_for_reset();
      memaccess_agent_memaccess_out_config.wait_for_reset();
      control_agent_control_in_config.wait_for_reset();
      control_agent_control_out_config.wait_for_reset();
      execute_agent_execute_in_config.wait_for_reset();
      execute_agent_execute_out_config.wait_for_reset();
      inst_mem_config.wait_for_reset();
      data_mem_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      inst_mem_resp_seq.start(inst_mem_sequencer);
      data_mem_resp_seq.start(data_mem_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
      // repeat (25) inst_mem_random_seq.start(inst_mem_sequencer);
      // repeat (25) data_mem_random_seq.start(data_mem_sequencer);
    join

    lc3_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      fetch_agent_fetch_in_config.wait_for_num_clocks(num_clocks);
      fetch_agent_fetch_out_config.wait_for_num_clocks(num_clocks);
      decode_agent_decode_in_config.wait_for_num_clocks(num_clocks);
      decode_agent_decode_out_config.wait_for_num_clocks(num_clocks);
      writeback_agent_writeback_in_config.wait_for_num_clocks(num_clocks);
      writeback_agent_writeback_out_config.wait_for_num_clocks(num_clocks);
      memaccess_agent_memaccess_in_config.wait_for_num_clocks(num_clocks);
      memaccess_agent_memaccess_out_config.wait_for_num_clocks(num_clocks);
      control_agent_control_in_config.wait_for_num_clocks(num_clocks);
      control_agent_control_out_config.wait_for_num_clocks(num_clocks);
      execute_agent_execute_in_config.wait_for_num_clocks(num_clocks);
      execute_agent_execute_out_config.wait_for_num_clocks(num_clocks);
      inst_mem_config.wait_for_num_clocks(num_clocks);
      data_mem_config.wait_for_num_clocks(num_clocks);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end