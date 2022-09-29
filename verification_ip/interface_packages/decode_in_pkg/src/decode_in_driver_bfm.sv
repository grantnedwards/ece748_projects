interface decode_in_driver_bfm(decode_in_if bus);
    logic clock;
    logic reset;
    logic [15:0] npc_in;
    logic enable_decode;
    logic [15:0] instr_dout;

    assign clock = bus.clock;
    assign reset = bus.reset;
    assign npc_in = bus.npc_in;
    assign enable_decode = bus.enable_decode;
    assign instr_dout = bus.instr_dout;

    task drive(input logic [15:0] npc_in, instr_dout);
        @(posedge clk);
            bus.npc_in = npc_in;
            bus.instr_dout = instr_dout; 
    endtask

endinterface