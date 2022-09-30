import uvm_pkg::*;
module hdl_top();
  logic clk;
  logic rst;
  logic en;
  logic psr;
  wire [15:0] dout;
  wire [15:0] npc_in;
  bit transaction_viewing = 1'b1;
  bit coverage = 1'b1;
  bit enabled = 1'b1;

  initial begin: gen_clk
    clk = 1'b0;
    #10;
    forever #5 clk =~clk;
  end

  initial begin: gen_rst
    rst = 1'b1;
    en = 1'b0;
    #15;
    en = 1'b1;
    rst = 1'b0;
  end


  decode_in_if decode_in_bus(.clock(clk), .reset(rst), .enable_decode(en), .instr_dout(dout), .npc_in(npc_in), .psr(psr));
  decode_in_monitor_bfm monitor_bfm(decode_in_bus);
  decode_in_driver_bfm driver_bfm(decode_in_bus);


  initial begin : initialize_bench
    uvm_config_db#(virtual decode_in_monitor_bfm)::set(null, "*", "decode_in", monitor_bfm);
    uvm_config_db#(virtual decode_in_driver_bfm)::set(null, "*", "decode_in", driver_bfm);

    uvm_config_db#(bit)::set(null, "*", "wave", transaction_viewing);
    uvm_config_db#(bit)::set(null, "*", "enabled", enabled);
    uvm_config_db#(bit)::set(null, "*", "coverage", coverage);
  end


endmodule
