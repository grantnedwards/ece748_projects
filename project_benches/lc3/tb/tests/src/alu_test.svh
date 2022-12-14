class alu_test extends test_top;
    `uvm_component_utils(alu_test)

    function new( string name = "", uvm_component parent = null );
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        lc3_bench_sequence_base::type_id::set_type_override(alu_sequence::get_type());
        super.build_phase(phase);
    endfunction

    
    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
    endfunction

endclass