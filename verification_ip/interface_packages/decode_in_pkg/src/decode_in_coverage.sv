class decode_in_coverage extends uvm_subscriber #(decode_in_transaction);
    `uvm_component_utils(decode_in_coverage);
    
    covergroup decode_in_transaction_cg;
    endgroup

    function new(string name="decode_in_coverage", uvm_component parent = null);
        super.new(name, parent);
        decode_in_transaction_cg = new;
    endfunction

endclass