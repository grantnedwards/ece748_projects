class decode_in_config extends uvm_object;
    `uvm_object_utils(decode_in_config)

    bit enabled;
    bit coverage;
    bit transaction_viewing;

    function new(string name="decode_in_configuration");
        super.new(name);
    endfunction

    virtual function void init(string name, bit enabled, string path_to_agent);
        uvm_config_db#(decode_in_config)::set(null, path_to_agent, "cfg", this);
    endfunction

endclass