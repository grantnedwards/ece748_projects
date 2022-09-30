interface decode_in_monitor_bfm(decode_in_if bus);
    logic clock;
    logic reset;
    logic [15:0] npc_in;
    logic enable_decode;
    logic [15:0] instr_dout;
    event go;
    decode_in_pkg::decode_in_monitor proxy;

    assign clock =          bus.clock;
    assign reset =          bus.reset;
    assign npc_in =         bus.npc_in;
    assign enable_decode =  bus.enable_decode;
    assign instr_dout =     bus.instr_dout;



    task do_monitor(output bit[15:0] npc, output bit[15:0] instr);
      npc = npc_in;
      instr = instr_dout;
    endtask

    task wait_for_reset();
      wait(!reset);
      @(posedge clock);
    endtask

    task wait_for_num_clocks(input int unsigned count);
      @(posedge clock);
      repeat(count-1)@(posedge clock);
    endtask

    initial begin
        @go;
        forever begin
            logic [15:0] temp_npc_in, temp_instr_dout;
            @(posedge clock);
            if(enable_decode)begin
                do_monitor(temp_npc_in, temp_instr_dout);
                proxy.notify_transaction(temp_npc_in, temp_instr_dout);
            end
        end
    end


endinterface
