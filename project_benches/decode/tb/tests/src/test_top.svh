class test_top extends uvm_test;

    `uvm_component_utils(test_top)

    decode_env_configuration env_cfg;
    decode_environment env;
    decode_in_random_sequence seq;

    string agent_path[], interface_name[];
    uvmf_active_passive_t activity[2] = {ACTIVE, PASSIVE};

    function new(string name="test_top", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      $display(" |                                                                      | ");
      $display("/=====================START OF RANDOM TEST SEQUENCE=====================\\");
      $display("|                                                                        |");

      $display("Please enter \"run -all\" in order to run the proper waves and generate proper transaction viewing");
      env = new("env", this);
      env_cfg = new("env_cfg");
      interface_name = new[2];
      agent_path = new[2];

      agent_path = '{"*", "*"};
      interface_name = '{"decode_in", "decode_out"};
      
      env_cfg.initialize(agent_path, interface_name, activity);
      seq = new("seq");

    endfunction

    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
        env_cfg.cfg_i.wait_for_reset();
        env_cfg.cfg_i.wait_for_num_clocks(1);
        repeat(25)
          seq.start(env_cfg.cfg_i.sequencer);
        env_cfg.cfg_i.wait_for_num_clocks(2);
      phase.drop_objection(this);

      `uvm_info("INFO", "test_top run phase complete", UVM_LOW);

    endtask : run_phase

endclass
