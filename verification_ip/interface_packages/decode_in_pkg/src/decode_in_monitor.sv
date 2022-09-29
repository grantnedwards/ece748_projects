class decode_in_monitor extends uvm_monitor;
    `uvm_component_utils(decode_in_monitor)
    
    virtual decode_in_monitor_bfm monitor_bfm;
    uvm_analysis_port #(decode_in_transaction) mon_ap;
    bit transaction_viewing;
    time = timestamp;
    int num_transactions;

    function new(string name="decode_in_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_ap = new("mon_ap", this);
    endfunction

    virtual function void start_of_simulation_phase(uvm_phase phase);
        if(transaction_viewing)begin

        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
            ->bfm.run;
        phase.drop_objection(this);
    endtask




endclass