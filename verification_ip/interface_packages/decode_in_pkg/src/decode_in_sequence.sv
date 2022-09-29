class decode_in_sequence extends uvm_sequence #(decode_in_transaction);
    `uvm_object_utils(decode_in_sequence)
    decode_in_transaction trans;

    function new(string name = "decode_in_random_sequence");
        super.new(name);
    endfunction

    virtual task body();
        trans = new("trans");
        repeat(25)begin
            start_item(trans);
            trans.randomize();
            finish_item(trans);
        end
    endtask

endclass