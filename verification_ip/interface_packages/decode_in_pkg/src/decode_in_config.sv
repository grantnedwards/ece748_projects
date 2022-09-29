class decode_in_config extends uvm_object;
    `uvm_object_utils(decode_in_config)

    bit enabled;
    bit coverage;
    bit transaction_viewing;

    function new(string name="decode_in_configuration");
        super.new(name);
    endfunction

endclass