class decode_in_agent extends uvm_ageent;
    decode_in_config cfg;
    decode_in_sequencer seqr;
    decode_in_coverage cov;
    decode_in_driver drv;
    decode_in_monitor mon;
    bit coverage;
    bit enabled;
    ///
    `uvm_component_utils(decode_in_agent)
    
    function new(string name="decode_in_agent", uvm_component parent=null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction
    
endclass