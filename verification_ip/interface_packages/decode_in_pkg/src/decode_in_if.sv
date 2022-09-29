interface decode_in_if #(
    int INSTRUCTION_WIDTH = 16,
    int PSR WIDTH = 3,
    int NPC_WIDTH = 16
)(
    input tri                           clock,
    input tri                           reset,
    inout tri [NPC_WIDTH-1:0]           npc_in,
    input tri                           enable_decode,
    inout tri [INSTRUCTION_WIDTH-1:0]   instr_dout,
    input tri                           psr
)