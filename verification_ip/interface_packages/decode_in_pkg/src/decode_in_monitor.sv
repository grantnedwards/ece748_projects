class decode_in_monitor extends uvm_monitor;
    `uvm_component_utils(decode_in_monitor)
    virtual decode_in_monitor_bfm monitor_bfm;
    

    function new(string name="decode_in_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    virtual function void start_of_simulation_phase(uvm_phase phase);

    endfunction

    virtual task run_phase(uvm_phase phase);
    
    endtask



endclass