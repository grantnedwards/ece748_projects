//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class inst_mem_responder_sequence 
  extends inst_mem_sequence_base ;

  `uvm_object_utils( inst_mem_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "inst_mem_responder_sequence");
    super.new(name);
  endfunction

  static int instruction_count = 0;
  bit [2:0] register_count= 3'b000; //r0,r1,r2....r7.

  inst_mem_load_txrs reqx;

  task body();
    reqx=inst_mem_load_txrs::type_id::create("reqx");
    req = inst_mem_transaction::type_id::create("req");
    forever begin
      if(instruction_count < 30) //perform load instructions before ALU ops. 
      begin
        instruction_count++;
        start_item(reqx);
        if(!(reqx.randomize() with {instr_dout[15:12] inside{LD};})) `uvm_fatal("SEQ", "instruction_mem_random_sequence::body()-inst_mem_transaction randomization failed")
        reqx.instr_dout[11:9] =  register_count;
        register_count = register_count + 3'h1;
        $display("%h ################# %d",register_count,instruction_count);
        finish_item(reqx);
      end
      else
      begin
        //other ops
        start_item(req);
        if(!req.randomize()) `uvm_fatal("SEQ", "instruction_mem_random_sequence::body()-inst_mem_transaction randomization failed")
        finish_item(req);
        // pragma uvmf custom body begin
        // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
        // finish_item() call above will block until the req transaction is ready
        // to be handled by the responder sequence.
        // If this was an item that required a response, the expectation is
        // that the response should be populated within this transaction now.
        `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
        // pragma uvmf custom body end
      end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

