class test_top extends uvm_test;

    `uvm_component_utils(test_top)

    function new(string name="test_top", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
    endfunction

    virtual task run_phase(uvm_phase phase);
    endtask : run_phase

endclass