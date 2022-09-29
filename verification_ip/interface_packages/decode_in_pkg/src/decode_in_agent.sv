class decode_in_agent extends uvm_ageent;
    `uvm_component_utils(decode_in_agent)
    
    decode_in_config cfg;
    decode_in_sequencer seqr;
    decode_in_coverage cov;
    decode_in_driver drv;
    decode_in_monitor mon;
    bit coverage;
    bit enabled;
    
    function new(string name="decode_in_agent", uvm_component parent=null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // if(!uvm_config_db#(decode_in_config)::get(this,"","cfg",cfg))begin 
        //     `uvm_fatal("decode_in_agent, "Configuration not found")
        // end
        //Continue if configuration is found
        enabled = cfg.enabled;
        coverage = cfg.coverage;

        if(coverage)cov = decode_in_coverage::type_id::create("cov", this);
        if(enabled)begin
            seqr = decode_in_sequencer::type_id::create("seqr",this);
            drv = decode_in_driver::type_id::create("drv",this);
        end

        mon = decode_in_monitor::type_id::create("mon", this);

    endfunction
    
    virtual function void connect_phase(uvm_phase phase);
        ap = mon.mon_ap;
        if(enabled)  drv.seq_item_port.connect(seqr.seq_item_export);
        if(coverage) mon.mon_ap.connect(cov.analysis_export);
    endfunction
    
endclass