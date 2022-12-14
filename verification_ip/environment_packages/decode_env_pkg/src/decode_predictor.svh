class decode_predictor extends uvm_subscriber #(decode_in_transaction);
    `uvm_component_utils(decode_predictor)

    uvm_analysis_port #(decode_out_transaction) pred_ap;
    decode_out_transaction trans;
    bit temp;
    
    function new (string name = "decode_predictor", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        pred_ap = new("pred_ap", this);
        trans = new("trans");
    endfunction

    virtual function void write(decode_in_transaction t);
        temp = decode_model(t.dout, 
                            t.npc_in, 
                            trans.IR, 
                            trans.npc_out, 
                            trans.E_control, 
                            trans.W_control, 
                            trans.Mem_control);
        pred_ap.write(trans);
    endfunction

endclass