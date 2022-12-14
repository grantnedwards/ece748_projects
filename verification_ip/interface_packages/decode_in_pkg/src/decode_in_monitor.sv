class decode_in_monitor extends uvm_monitor;

    virtual decode_in_monitor_bfm monitor_bfm;
    `uvm_component_utils(decode_in_monitor)

    decode_in_transaction trans;
    bit transaction_viewing = 1;
    int transaction_viewing_stream;

    uvm_analysis_port #(decode_in_transaction) mon_ap;
    protected time time_stamp = 0;

    function new(string name="decode_in_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monitor_bfm.proxy = this;
        mon_ap = new("mon_ap", this);
        `uvm_info("INFO", "decode_in_monitor entered the build phase", UVM_LOW);
    endfunction


    virtual function void start_of_simulation_phase(uvm_phase phase);
        if(transaction_viewing)
            transaction_viewing_stream = $create_transaction_stream({"..", get_full_name(),".","txn_stream"});
        `uvm_info("INFO", "decode_in_monitor entered start of sim phase", UVM_LOW);
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
            ->monitor_bfm.go;
        phase.drop_objection(this);
        `uvm_info("INFO", "decode_in_monitor entered the run phase", UVM_LOW);
    endtask

    virtual function void notify_transaction(
        input logic[15:0] instr_dout,
        input logic[15:0] npc_in
    );
        trans = new("trans");
        trans.start_time = time_stamp;
        trans.end_time = $time;
        time_stamp = trans.end_time;
        trans.npc_in = npc_in;
        trans.instr_dout = instr_dout;
        analyze(trans);
    endfunction

    virtual function void analyze(decode_in_transaction trans);
        if(transaction_viewing)
          trans.add_to_wave(transaction_viewing_stream);
        mon_ap.write(trans);
    endfunction

endclass
