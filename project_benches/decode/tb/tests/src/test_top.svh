class test_top extends uvm_test;

    `uvm_component_utils(test_top)

    decode_in_configuration cfg;
    decode_in_agent agt;
    decode_in_random_sequence seq;

    decode_out_configuration cfg_o;
    decode_out_agent agt_o;
    print_component prints;

    function new(string name="test_top", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      $display(" |                                                                      | ");
      $display("/=====================START OF RANDOM TEST SEQUENCE=====================\\");
      $display("|                                                                        |");

      $display("Please enter \"run -all\" in order to run the proper waves and generate proper transaction viewing");
      super.build_phase(phase);
      cfg = decode_in_configuration::type_id::create("decode_in_configuration", this);
      agt = decode_in_agent::type_id::create("decode_in_agent", this);
      cfg_o = decode_out_configuration::type_id::create("decode_out_configuration", this);
      agt_o = decode_out_agent::type_id::create("decode_out_agent", this);

      cfg.initialize(ACTIVE, "", "decode_in");
      cfg_o.initialize(ACTIVE, "", "decode_out");
      cfg.initiator_responder = INITIATOR;

      prints = print_component::type_id::create("prints", this);
      seq = decode_in_random_sequence::type_id::create("seq", this);

    endfunction

    virtual function void connect_phase(uvm_phase phase);
    		agt.monitored_ap.connect(prints.decode_in_ap);
    		agt_o.monitored_ap.connect(prints.decode_out_ap);
	  endfunction

    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);
        cfg.wait_for_reset();
        cfg.wait_for_num_clocks(1);
        repeat(25)
          seq.start(agt.sequencer);
        cfg.wait_for_num_clocks(5);
      phase.drop_objection(this);

      `uvm_info("INFO", "test_top run phase complete", UVM_LOW);

    endtask : run_phase

endclass
