class test_top extends uvm_test;

    `uvm_component_utils(test_top)

    decode_in_config cfg;
    decode_in_agent agt;
    decode_in_sequence seq;

    function new(string name="test_top", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      cfg = decode_in_config::type_id::create("decode_in_config", this);
      agt = decode_in_agent::type_id::create("decode_in_agent", this);

      if(!uvm_config_db#(bit)::get(null,"*", "wave", cfg.transaction_viewing))
      `uvm_fatal("test_top","test_top config could not get wave")
      if(!uvm_config_db#(bit)::get(null,"*", "enabled", cfg.enabled))
      `uvm_fatal("test_top","test_top config could not get enabled")
      if(!uvm_config_db#(bit)::get(null,"*", "coverage", cfg.coverage))
      `uvm_fatal("test_top","test_top config could not get coverage")

      if(!uvm_config_db#(virtual decode_in_driver_bfm)::get(null, "*", "decode_in", cfg.driver_bfm))
      `uvm_fatal("test_top", "test_top config didn't get driver base functional model")
      if(!uvm_config_db#(virtual decode_in_monitor_bfm)::get(null, "*", "decode_in", cfg.monitor_bfm))
      `uvm_fatal("test_top", "test_top config didn't get monitor base functional model")

      uvm_config_db#(decode_in_config)::set(null, "*", "cfg",cfg);
      `uvm_info("INFO", "test_top build phase complete", UVM_LOW);
    endfunction

    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
        cfg.monitor_bfm.wait_for_reset();
        cfg.monitor_bfm.wait_for_num_clocks(10);
        seq = decode_in_sequence::type_id::create("seq", this);
        cfg.driver_bfm.drive_enable();
        if(cfg.enabled) seq.start(agt.seqr);
        cfg.driver_bfm.drive_de_enable();
        cfg.monitor_bfm.wait_for_num_clocks(5);
      phase.drop_objection(this);

      `uvm_info("INFO", "test_top run phase complete", UVM_LOW);
    endtask : run_phase

endclass
