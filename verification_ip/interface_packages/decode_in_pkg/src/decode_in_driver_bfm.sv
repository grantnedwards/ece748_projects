interface decode_in_driver_bfm(decode_in_if bus);
    logic clock;
    logic reset;
    logic [15:0] npc_in, instr_dout, npc, dout;
    logic enable_decode, en;

    assign clock = bus.clock;
    assign reset = bus.reset;
    assign npc_in = bus.npc_in;
    assign enable_decode = bus.enable_decode;

    assign bus.npc_in = npc;
    assign bus.instr_dout = dout;
    assign bus.enable_decode = en;

    task drive(input logic [15:0] temp_npc_in, input logic [15:0] temp_instr_dout);
        @(posedge clock);
            npc = temp_npc_in;
            dout = temp_instr_dout;
    endtask

    task drive_enable();
        en = 1'b1;
    endtask

    task drive_de_enable();
        en = 1'b0;
    endtask

endinterface
