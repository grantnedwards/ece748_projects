class decode_in_coverage extends uvm_subscriber #(decode_in_transaction);
    `uvm_component_utils(decode_in_coverage)

    op_t op;
    logic[15:0] npc_in;

    covergroup decode_in_transaction_cg;
      option.per_instance = 1;
      option.name = get_full_name();

      op_type : coverpoint op
      {
          bins ADD  = {ADD};
          bins AND  = {AND};
          bins NOT  = {NOT};
          bins LD   = {LD};
          bins LDR  = {LDR};
          bins LDI  = {LDI};
          bins LEA  = {LEA};
          bins ST   = {ST};
          bins STR  = {STR};
          bins STI  = {STI};
          bins BR   = {BR};
          bins JMP  = {JMP};
      }
      coverpoint npc_in;
    endgroup

    function new(string name="decode_in_coverage", uvm_component parent = null);
        super.new(name, parent);
        decode_in_transaction_cg = new();
    endfunction

    virtual function void write(decode_in_transaction t);
        npc_in = t.npc_in;
        op = t.op;
        decode_in_transaction_cg.sample();
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction


endclass
