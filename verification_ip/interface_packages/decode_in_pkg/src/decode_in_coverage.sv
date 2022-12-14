class decode_in_coverage extends uvm_subscriber #(.T(decode_in_transaction));
    `uvm_component_utils(decode_in_coverage)

    T trans;

    covergroup decode_in_transaction_cg;
      option.per_instance = 1;
      option.auto_bin_max = 2048;

      start_time:   coverpoint trans.start_time;
      end_time:     coverpoint trans.end_time;
      npc_in:       coverpoint trans.npc_in;
      instr_dout:   coverpoint trans.instr_dout;
      op:           coverpoint trans.op;
      nzp:          coverpoint trans.nzp;
      randAND:      coverpoint trans.randAND;
      randADD:      coverpoint trans.randADD;
      DR:           coverpoint trans.DR;
      SR1:          coverpoint trans.SR1;
      SR2:          coverpoint trans.SR2;
      BaseR:        coverpoint trans.BaseR;
      SR:           coverpoint trans.SR;
      imm5:         coverpoint trans.imm5;
      PCoffset6:    coverpoint trans.PCoffset6;
      PCoffset9:    coverpoint trans.PCoffset9;
    endgroup

    function new(string name="decode_in_coverage", uvm_component parent = null);
        super.new(name, parent);
        decode_in_transaction_cg = new();
    endfunction

    virtual function void write(decode_in_transaction t);
        `uvm_info("COVERAGE", "Transaction Received", UVM_MEDIUM);
        trans = t;
        decode_in_transaction_cg.sample();
    endfunction

    virtual function void build_phase(uvm_phase phase);
        decode_in_transaction_cg.set_inst_name($sformatf("decode_in_transaction_cg_%s", get_full_name()));
        `uvm_info("INFO", "decode_in_coverage entered the build phase", UVM_LOW);
    endfunction


endclass
