class decode_in_sequence extends uvm_sequence #(decode_in_transaction);
    `uvm_object_utils(decode_in_sequence)

    function new(string name = "decode_in_random_sequence");
        super.new(name);
    endfunction

    virtual task body();
    endtask

endclass