class decode_in_sequence extends uvm_sequence #(decode_in_transaction);
    `uvm_object_utils(decode_in_sequence)
    decode_in_transaction trans;

    function new(string name = "decode_in_random_sequence");
        super.new(name);
    endfunction

    virtual task body();
        trans = new("trans");
        repeat(26)begin
            start_item(trans);
            assert(trans.randomize());
            if(!trans.randomize()) `uvm_fatal("decode_in_sequence", "Could not randomize driver sequence")
              `uvm_info("SEQUENCE", {"Sending transaction to Driver:", trans.convert2string()}, UVM_MEDIUM);
            finish_item(trans);
        end
    endtask

endclass
