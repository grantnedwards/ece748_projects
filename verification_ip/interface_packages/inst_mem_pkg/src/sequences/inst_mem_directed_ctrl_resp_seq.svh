class inst_mem_directed_ctrl_resp_seq extends inst_mem_responder_sequence;
    `uvm_object_utils(inst_mem_directed_ctrl_resp_seq)

    function new(string name = "inst_mem_directed_ctrl_resp_seq");
        super.new(name);
    endfunction
    bit [15:0] inst_mem[bit[15:0]];
    virtual function void load();
         int address = 16'h3009;

         inst_mem[16'h3000] = 16'hE000; //LEA 3001 -> R0
         inst_mem[16'h3001] = 16'hE000; //LEA 3001 -> R0
         inst_mem[16'h3002] = 16'hE200; //LEA 3002 -> R1
         inst_mem[16'h3003] = 16'hE400; //LEA 3003 -> R2
         inst_mem[16'h3004] = 16'hE600; //LEA 3004 -> R3
         inst_mem[16'h3005] = 16'hE800; //LEA 3005 -> R4
         inst_mem[16'h3006] = 16'hEA00; //LEA 3006 -> R5
         inst_mem[16'h3007] = 16'hEC00; //LEA 3007 -> R6
         inst_mem[16'h3008] = 16'hEE00; //LEA 3008 -> R7

         for(int i=1; i<8; i++)begin
             for(int j=0; j<512; j++)begin
                 inst_mem[address][15:12] = 4'b0000;
                 inst_mem[address][11:9] = i;
                 inst_mem[address][8:0] = j;
                 address++;
             end
         end
         for(int i=0; i<8; i++)begin
             inst_mem[address][15:12] = 4'b1100;
             inst_mem[address][11:9] = 3'b000;
             inst_mem[address][8:6] = i;
             inst_mem[address][5:0] = 5'b00000;
             address++;
         end
     endfunction

     virtual task body();
         bit[15:0] temp_address = 16'h3000;
         req = inst_mem_transaction::type_id::create("req");
         load();

         forever begin
             start_item(req);
             finish_item(req);
             if(inst_mem.exists(temp_address))begin
                 req.instr_dout = inst_mem[temp_address];
                 temp_address++;
             end else begin
                 req.instr_dout = inst_mem[16'h3009];
             end

             `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_HIGH)
         end
     endtask

endclass
