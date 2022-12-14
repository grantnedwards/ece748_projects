class decode_in_config extends uvm_object;
    `uvm_object_utils(decode_in_config)

    virtual decode_in_monitor_bfm monitor_bfm;
    virtual decode_in_driver_bfm driver_bfm;
    bit enabled;
    bit coverage;
    bit transaction_viewing;

    function new(string name="decode_in_config");
        super.new(name);
    endfunction

    virtual function string convert2string();
        $sformatf("Status: %s, Coverage: %s, Transaction Viewing: %s", enabled ? "Active" : "Passive", coverage ? "Enabled" : "Disabled", transaction_viewing ? "Enabled" : "Disabled");
    endfunction

endclass
