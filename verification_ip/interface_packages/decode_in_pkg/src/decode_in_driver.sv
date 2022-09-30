class decode_in_driver extends uvm_driver #(decode_in_transaction);
    `uvm_component_utils(decode_in_driver)

    virtual decode_in_driver_bfm driver_bfm;

    function new(string name="decode_in_driver", uvm_component parent=null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("INFO","Build phase of Driver ran", UVM_MEDIUM);
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            seq_item_port.get_next_item(req);
            driver_bfm.drive(req.npc_in, req.instr_dout);
            seq_item_port.item_done();
        end
    endtask

endclass
