class inst_mem_directed_load_seq extends inst_mem_responder_sequence;
    `uvm_object_utils(inst_mem_directed_load_seq)


//sequence that targets load instructions.
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

    task body();
        req = inst_mem_load_txrs::type_id::create("req");
         for(i= 0; i<8; i++) begin
            for( j =0; j<512; j++) begin
                    start_item(req);
                    if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
                    req.instr_dout[15:12] = LD;
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
                        req.instr_dout[15:12] = LDR;
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
                    req.instr_dout[15:12] = LDI;
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
            br = '0;
            pc_offset_6 = '0;
            pc_offset_9 = '0;


            for(i= 0; i<8; i++) begin
                for( j =0; j<512; j++) begin
                    start_item(req);
                    if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
                    req.instr_dout[15:12] = LEA;
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
            /*
            dr = '0;
            br = '0;
            pc_offset_6 = '0;
            

            
         for(i= 0; i<8; i++) begin
            for( j =0; j<512; j++) begin
                    start_item(req);
                    if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
                    req.instr_dout[15:12] = LDI;
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

            for(i= 0; i<8; i++) begin
            for( j =0; j<512; j++) begin
                    start_item(req);
                    if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_directed_load_sequence::body()-inst_mem_transaction randomization failed")
                    req.instr_dout[15:12] = LEA;
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


            


            /*
            else if(instr_count >=2048 && instr_count < 4096)
            begin
                req.instr_dout[15:12] = LDR;
                req.instr_dout[11:9]  = dr;
                req.instr_dout[8:6]   = br;
                req.instr_dout[5:0]   = pc_offset_6;
                dr = dr+ 3'b1;
                br = br+ 3'b1;
                pc_offset_6 = pc_offset_6 + 6'b1;
            end
            else if(instr_count >=4096 && instr_count < 6144)
            begin
                req.instr_dout[15:12] = LDI;
                req.instr_dout[11:9]  = dr;
                req.instr_dout[8:0]   = pc_offset_9;
                dr = dr+ 3'b1;
                pc_offset_9 = pc_offset_9+ 9'b1;
            end
            else if(instr_count >=6144 && instr_count<8192)
            begin
                req.instr_dout[15:12] = LEA;
                req.instr_dout[11:9]  = dr;
                req.instr_dout[8:0]   = pc_offset_9;
                dr = dr+ 3'b1;
                pc_offset_9 = pc_offset_9+ 9'b1;
            end

            instr_count = instr_count + 1;

            if(instr_count == 2048 || instr_count == 4096 || instr_count == 6144) 
            begin
                dr = 3'b0;
                pc_offset_9 = 9'b0;
                pc_offset_6 = 6'b0;
                br = 3'b0;
            end
            */

endclass