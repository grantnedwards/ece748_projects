class decode_in_sequencer extends uvm_sequencer #(decode_in_transaction);
    `uvm_component_utils(decode_in_sequencer)

    function new(string name="decode_in_seequencer", uvm_component parent=null);
        super.new(name, parent);
    endfunction

endclass