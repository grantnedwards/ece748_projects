import uvm_pkg::*;
import uvmf_base_pkg::*;
module hdl_top();
  logic clk;
  logic rst;

  initial begin: gen_clk
    clk = 1'b0;
    #10;
    forever #5 clk =~clk;
  end

  initial begin: gen_rst
    rst = 1'b1;
    #40;
    rst = 1'b0;
  end


  decode_in_if decode_in_bus(.clock(clk), .reset(rst));
  decode_in_monitor_bfm mon_bfm(decode_in_bus);
  decode_in_driver_bfm drv_bfm(decode_in_bus);
  decode_out_if decode_out_bus(.clock(clk), .reset(rst));
  decode_out_monitor_bfm mon_bfm_o(decode_out_bus);
  decode_out_driver_bfm drv_bfm_o(decode_out_bus);

  Decode DUT(
      .clock(clk),
  	  .reset(rst),
  	  .enable_decode(decode_in_bus.enable_decode),
  	  .dout(decode_in_bus.dout),
  	  .npc_in(decode_in_bus.npc_in),
  	 .W_Control(decode_out_bus.W_control),
  	 .Mem_Control(decode_out_bus.Mem_control),
  	 .E_Control(decode_out_bus.E_control),
  	 .IR(decode_out_bus.IR),
  	 .npc_out(decode_out_bus.npc_out)
  );


  initial begin : initialize_bench
    uvm_config_db#(virtual decode_in_monitor_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_in", mon_bfm);
    uvm_config_db#(virtual decode_in_driver_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_in", drv_bfm);
    uvm_config_db#(virtual decode_out_monitor_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_out", mon_bfm_o);
    uvm_config_db#(virtual decode_out_driver_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_out", drv_bfm_o);

    // uvm_config_db#(bit)::set(null, "*", "wave", transaction_viewing);
    // uvm_config_db#(bit)::set(null, "*", "enabled", enabled);
    // uvm_config_db#(bit)::set(null, "*", "coverage", coverage);
  end


endmodule
