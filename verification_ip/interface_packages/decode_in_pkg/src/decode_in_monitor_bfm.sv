interface decode_in_monitor_bfm(decode_in_if bus);
    logic clock;
    logic reset;
    logic [15:0] npc_in;
    logic enable_decode;
    logic [15:0] instr_dout;
    event run;

    assign clock =          bus.clock;
    assign reset =          bus.reset;
    assign npc_in =         bus.npc_in;
    assign enable_decode =  bus.enable_decode;
    assign instr_dout =     bus.instr_dout;

    decode_in_pkg::decode_in_monitor mon;

    initial begin
        @run;
        forever begin
            @(posedge clock);
            if(enable_decode)begin
                mon.trans = new("trans");
                mon.trans.instr_dout = instr_dout;
                mon.trans.npc_in = npc_in;
                mon.trans.timestamp = $time;
                //if(mon.transaction_viewing) mon.trans.add_to_wave(mon.num_transactions)
                mon.mon_ap.write(mon.trans);
            end
        end

    end


endinterface