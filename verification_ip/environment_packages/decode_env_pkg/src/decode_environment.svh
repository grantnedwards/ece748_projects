class decode_environment extends uvm_env;
    `uvm_component_utils(decode_environment)

    decode_in_agent agt_i;
    decode_out_agent agt_o;
    decode_scoreboard scbd;
    decode_predictor pred;

    function new(string name = "decode_environment", uvm_component parent=null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agt_i = decode_in_agent::type_id::create("agt_i", this);
        agt_o = decode_out_agent::type_id::create("agt_o", this);
        scbd = decode_scoreboard::type_id::create("scbd", this);
        pred = decode_predictor::type_id::create("pred", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agt_i.monitored_ap.connect(pred.analysis_export);
        pred.pred_ap.connect(scbd.exp);
        agt_o.monitored_ap.connect(scbd.act);
    endfunction

endclass
