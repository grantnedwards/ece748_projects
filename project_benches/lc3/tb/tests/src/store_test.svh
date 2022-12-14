class store_test extends test_top;

 	`uvm_component_utils( store_test );
	
	function new( string name = "", uvm_component parent = null );
   		super.new( name, parent );
  	endfunction
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//set_type_override_by_type(imem_transaction::get_type(), imem_memop_transaction::get_type());
        //inst_mem_transaction::type_id::set_type_override(inst_mem_load_txrs::get_type());
        inst_mem_responder_sequence::type_id::set_type_override(inst_mem_directed_store_seq::get_type());

	endfunction

    virtual function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
	    set_cycles_count(30000);
    endfunction


endclass
