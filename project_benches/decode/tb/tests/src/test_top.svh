class test_top extends uvmf_test_base #(.CONFIG_T(decode_env_configuration),
                                        .ENV_T(decode_environment),
                                        .TOP_LEVEL_SEQ_T(decode_in_random_sequence));

    `uvm_component_utils(test_top)

    uvmf_sim_level_t sim_level = BLOCK;
    string interface_name[2] = {"decode_in", "decode_out"};
    uvmf_active_passive_t interface_activity[2] = {ACTIVE, PASSIVE};
    uvm_reg_block regmodel = null;
    

    function new(string name="test_top", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      $display(" |                                                                      | ");
      $display("/=====================START OF RANDOM TEST SEQUENCE=====================\\");
      $display("|                                                                        |");

      $display("Please enter \"run -all\" in order to run the proper waves and generate proper transaction viewing");

      
      configuration.initialize(sim_level, "*", interface_name, null, interface_activity);

    endfunction

    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
        repeat(25)
          top_level_sequence.start(configuration.decode_in_agent_inst_config.sequencer);
        
        configuration.decode_in_agent_inst_config.wait_for_num_clocks(5);
      phase.drop_objection(this);

      `uvm_info("INFO", "test_top run phase complete", UVM_LOW);

    endtask : run_phase

endclass
