interface decode_in_if #()(
    input tri                           clock,
    input tri                           reset,
    inout tri [15:0]                    npc_in,
    input tri                           enable_decode,
    inout tri [15:0]                    instr_dout,
    input tri                           psr
);
endinterface
