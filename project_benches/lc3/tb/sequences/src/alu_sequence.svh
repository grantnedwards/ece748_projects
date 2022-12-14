class alu_sequence extends lc3_bench_sequence_base;
    `uvm_object_utils(alu_sequence);

    function new( string name = "");
        super.new();
    endfunction

    virtual task body();
        inst_mem_resp_seq = inst_mem_directed_alu_seq::type_id::create("inst_mem_directed_alu_seq");
        data_mem_resp_seq = data_mem_responder_seq_t::type_id::create("data_mem_resp_seq");

        fork
            inst_mem_resp_seq.start(inst_mem_sequencer);
            data_mem_resp_seq.start(data_mem_sequencer);
        join_none

        execute_agent_execute_in_config.wait_for_num_clocks(7400);
    endtask


endclass