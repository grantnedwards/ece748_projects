class decode_in_transaction extends uvm_sequence_item;
    time start_time, end_time;
    bit [15:0] npc_in = 16'h3001;
    logic [15:0] instr_dout;
    `uvm_object_utils_begin(decode_in_transaction)
        `uvm_field_int(start_time, UVM_ALL_ON)
        `uvm_field_int(end_time, UVM_ALL_ON)
        `uvm_field_int(instr_dout, UVM_ALL_ON)
        `uvm_field_int(npc_in, UVM_ALL_ON)
    `uvm_object_utils_end

    rand op_t op;
    rand nzp_t nzp;
    rand bit randAND, randADD;
    rand bit [2:0] DR, SR1, SR2, BaseR, SR;
    rand bit [4:0] imm5;
    rand bit [5:0] PCoffset6;
    rand bit [8:0] PCoffset9;

    function new(string name = "decode_in_transaction");
        super.new(name);
    endfunction


    virtual function string convert2string();
        $sformatf("NPC input: 0x%h,  Instruction Output: 0x%h", npc_in, instr_dout);
    endfunction

    function void post_randomize();
        case(op)
            ADD:    instr_dout = randADD ? {ADD, DR, SR1, 3'b000, SR2} : {ADD, DR, SR1, 1'b1, imm5};
            AND:    instr_dout = randAND ? {AND, DR, SR1, 3'b000, SR2} : {ADD, DR, SR1, 1'b1, imm5};
            NOT:    instr_dout = {NOT, DR, SR1, 6'b111111};
            LD:     instr_dout = {LD, DR, PCoffset9};
            LDR:    instr_dout = {LDR, DR, BaseR, PCoffset6};
            LDI:    instr_dout = {LDI, DR, PCoffset9};
            LEA:    instr_dout = {LEA, DR, PCoffset9};
            ST:     instr_dout = {ST, SR, PCoffset9};
            STR:    instr_dout = {STR, SR, BaseR, PCoffset6};
            STI:    instr_dout = {STI, SR, PCoffset9};
            BR:     instr_dout = {BR, nzp, PCoffset9};
            JMP:    instr_dout = {JMP, 3'b000, BaseR, 6'b000000};
        endcase
    endfunction

    virtual function void add_to_wave(int trans_num);
        int trans_view;
        trans_view = $begin_transaction(trans_num, "decode_in_transaction", start_time);
        $add_attribute(trans_view, npc_in, "npc_in");
        $add_attribute(trans_view, instr_dout, "instr_dout");
        $end_transaction(trans_view, end_time);
        $free_transaction(trans_view);
    endfunction

endclass
