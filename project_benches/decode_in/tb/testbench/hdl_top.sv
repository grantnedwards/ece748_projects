import uvm_pkg::*;
module hdl_top();
  logic clk;
  logic rst;
  logic en;
  wire [15:0] dout;
  wire [15:0] npc_in;
  bit transaction_viewing = 1'b1;
  bit coverage = 1'b1;
  bit enabled = 1'b1;

  initial begin: gen_clk
    clk = 1'b0;
    #20;
    forever begin
        #5;
        clk =~clk;
    end
  end
  
  initial begin: gen_rst
    rst = 1'b1;
    en = 1'b0;
    #30;
    en = 1'b1;
    rst = 1'b0;
  end

  
  decode_in_if decode_in_bus(.clock(clk), .reset(rst), .enable_decode(en), .Instr_dout(dout), .npc_in(npc_in));
  decode_in_monitor_bfm mon_bfm(decode_in_bus);
  decode_in_driver_bfm drv_bfm(decode_in_bus);


  initial begin : initialize_bench
    uvm_config_db#(virtual decode_in_monitor_bfm)::set(null, "uvm_test_top.configuration", "decode_in", mon_bfm);
    uvm_config_db#(virtual decode_in_driver_bfm)::set(null, "uvm_test_top.configuration", "decode_in", drv_bfm);

    uvm_config_db#(bit)::set(null, "uvm_test_top.configuration", "wave", transaction_viewing);
    uvm_config_db#(bit)::set(null, "uvm_test_top.configuration", "active", enabled);
    uvm_config_db#(bit)::set(null, "uvm_test_top.configuration", "coverage", coverage);
  end


endmodule