//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records inst_mem transaction information using
//       a covergroup named inst_mem_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class inst_mem_transaction_coverage  extends uvm_subscriber #(.T(inst_mem_transaction ));

  `uvm_component_utils( inst_mem_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup inst_mem_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    opcode: coverpoint coverage_trans.opcode;
    sr1: coverpoint coverage_trans.sr1;
    sr2: coverpoint coverage_trans.sr2;
    dr: coverpoint coverage_trans.dr;
    mode: coverpoint coverage_trans.mode;
    baser: coverpoint coverage_trans.baser;
    pcoffset9: coverpoint coverage_trans.pcoffset9;
    pcoffset6: coverpoint coverage_trans.pcoffset6;
    imm5: coverpoint coverage_trans.imm5;
    nzp: coverpoint coverage_trans.nzp;
    PC: coverpoint coverage_trans.PC;
    instrmem_rd: coverpoint coverage_trans.instrmem_rd;
    instr_dout: coverpoint coverage_trans.instr_dout;
    complete_instr: coverpoint coverage_trans.complete_instr;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    inst_mem_transaction_cg=new;
    //`uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    inst_mem_transaction_cg.set_inst_name($sformatf("inst_mem_transaction_cg_%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_HIGH);
    coverage_trans = t;
    inst_mem_transaction_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

