//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the control_out transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a control_out_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class control_out_random_sequence 
  extends control_out_sequence_base ;

  `uvm_object_utils( control_out_random_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      req=control_out_transaction::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "control_out_random_sequence::body()-control_out_transaction randomization failed")
      // Send the transaction to the control_out_driver_bfm via the sequencer and control_out_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: control_out_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

