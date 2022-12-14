class inst_mem_directed_store_seq extends inst_mem_responder_sequence;
    `uvm_object_utils(inst_mem_directed_store_seq)

//sequence that targets store instructions
    function new(string name="inst_mem_responder_sequence");
        super.new(name);
    endfunction

    static int instr_count = 0;
    int i = 0;
    int j = 0;
    int k = 0;
    logic [2:0] dr = 3'b0;
    logic [8:0] pc_offset_9 = 9'b0;
    logic [5:0] pc_offset_6 = 6'b0;
    logic [2:0] br = 3'b0;

    logic [2:0] register_count = 3'b0;

    inst_mem_load_txrs reqx;

    task body();
        req = inst_mem_store_txrs::type_id::create("req");
        reqx = inst_mem_load_txrs::type_id::create("reqx");

        for(int i=0; i<15; i++) begin
            start_item(reqx);
            if(!(reqx.randomize() with {instr_dout[15:12] inside{LD};})) `uvm_fatal("SEQ", "instruction_mem_random_sequence::body()-inst_mem_transaction randomization failed")
            reqx.instr_dout[11:9] <=  register_count;
            register_count <= register_count + 3'h1;
            $display("%h ################# %d",register_count,instruction_count);
            finish_item(reqx);
        
        end


         for(i= 0; i<8; i++) begin
            for( j =0; j<512; j++) begin
                    start_item(req);
                    if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
                    req.instr_dout[15:12] = ST;
                    req.instr_dout[11:9]  = dr;
                    req.instr_dout[8:0]   = pc_offset_9;
                    pc_offset_9 = pc_offset_9 + 9'h1;
                    instr_count++;
                    finish_item(req);
                    $display("INSTRUCTION COUNT = %d",instr_count);    
                    `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_HIGH)
                end
                dr = dr + 3'h1;
            end
        
        dr = '0;
        pc_offset_9 = '0;

            for(i=0; i<8; i++) begin
                for( j=0; j<8; j++) begin
                    for( k=0; k<64; k++) begin
                        start_item(req);
                        if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
                        req.instr_dout[15:12] = STR;
                        req.instr_dout[11:9]  = dr;
                        req.instr_dout[8:6]   = br;
                        req.instr_dout[5:0]   = pc_offset_6;
                        pc_offset_6 = pc_offset_6 + 6'h1;
                        instr_count++;
                        finish_item(req);
                        $display("INSTRUCTION COUNT = %d",instr_count);    
                        `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_HIGH)
                    end
                    br = br + 3'h1;
                end
                dr = dr + 3'h1;
            end

            dr = '0;
            br = '0;
            pc_offset_6 = '0;
            pc_offset_9 = '0;

            for(i= 0; i<8; i++) begin
            for( j =0; j<512; j++) begin
                    start_item(req);
                    if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
                    req.instr_dout[15:12] = STI;
                    req.instr_dout[11:9]  = dr;
                    req.instr_dout[8:0]   = pc_offset_9;
                    pc_offset_9 = pc_offset_9 + 9'h1;
                    instr_count++;
                    finish_item(req);
                    $display("INSTRUCTION COUNT = %d",instr_count);    
                    `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_HIGH)
                end
                dr = dr + 3'h1;
            end

            forever begin
            start_item(req);
                
            if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
            
            $display("INSTRUCTION COUNT = %d",instr_count);    
                     `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_HIGH)
            finish_item(req);
            end
            
    endtask
            

endclass