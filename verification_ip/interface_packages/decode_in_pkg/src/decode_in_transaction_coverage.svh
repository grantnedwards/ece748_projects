//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records decode_in transaction information using
//       a covergroup named decode_in_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class decode_in_transaction_coverage  extends uvm_subscriber #(.T(decode_in_transaction ));

  `uvm_component_utils( decode_in_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup decode_in_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    opcode: coverpoint coverage_trans.opcode;
    mode: coverpoint coverage_trans.mode;
    npc_in: coverpoint coverage_trans.npc_in;
    sr1: coverpoint coverage_trans.sr1;
    sr2: coverpoint coverage_trans.sr2;
    dr: coverpoint coverage_trans.dr;
    baser: coverpoint coverage_trans.baser iff (coverage_trans.opcode == JMP);
    pcoffset9: coverpoint coverage_trans.pcoffset9 iff (coverage_trans.opcode == BR);
    pcoffset6: coverpoint coverage_trans.pcoffset6;
    imm5: coverpoint coverage_trans.imm5;
    n: coverpoint coverage_trans.n;
    z: coverpoint coverage_trans.z;
    p: coverpoint coverage_trans.p;
    instruction: coverpoint coverage_trans.instruction;
    // pragma uvmf custom covergroup end
    
  endgroup

covergroup decode_in_alu_cg;
    option.auto_bin_max=1024;
    option.per_instance=1;
	
	op_add: coverpoint coverage_trans.opcode{
		bins alu_operations = {ADD};
	} 
	
	op_and: coverpoint coverage_trans.opcode{
		bins alu_operations = {AND};
	}

  op_not: coverpoint coverage_trans.opcode{
		bins alu_operations = {NOT};
	} 
	sr1: coverpoint coverage_trans.sr1;
	sr2: coverpoint coverage_trans.sr2;
	imm5: coverpoint coverage_trans.imm5;

	add_sr1: coverpoint coverage_trans.sr1 iff (coverage_trans.opcode == ADD); 
	add_sr2: coverpoint coverage_trans.sr2 iff (coverage_trans.opcode == ADD);
	
	and_sr1: coverpoint coverage_trans.sr1 iff (coverage_trans.opcode == AND); 
	and_sr2: coverpoint coverage_trans.sr2 iff (coverage_trans.opcode == AND); 

  not_write_reg: coverpoint {coverage_trans.dr, coverage_trans.sr1} iff (coverage_trans.opcode == NOT){
    bins not_regs[] = {[6'b000000 : 6'b111111]};
		option.auto_bin_max =64;
    ignore_bins ignores2 = {0, 2,  5, 6, 10, 12, 16, 17, 21, 27, 29, 30, 31, 36, 39, 40, 42, 43, 45, 48, 49, 50, 51, 57, 61};
  } 
  
  not_x_sr1 : cross op_not, sr1 {}
  
  alu_sr1_cp: coverpoint coverage_trans.instruction[8:6]{ //iff (coverage_trans.opcode inside {4'b0001,4'b0101,4'b1001}){
                  bins valid_sr1[] = {0,1,2,3,4,5,6,7};
    }

    alu_sr2_cp: coverpoint coverage_trans.instruction[8:6]{ //(coverage_trans.opcode inside {4'b0001,4'b0101,4'b1001}){
                  bins valid_sr2[] = {0,1,2,3,4,5,6,7};
    }

    alu_dr_cp: coverpoint coverage_trans.instruction[11:9]{// iff (coverage_trans.opcode inside {4'b0001,4'b0101,4'b1001}){
					bins valid_dr[] = {0,1,2,3,4,5,6,7};
    }
	 
	alu_imm5_cp: coverpoint coverage_trans.instruction[4:0] iff(coverage_trans.instruction[5] == 1){
			bins possible_imm5[] = {[5'b00000 : 5'b11111]};
			option.auto_bin_max =32;
			ignore_bins ignores =  {12, 16, 26, 28};
		}
		
	alu_sr1_cross_cp: coverpoint coverage_trans.instruction[8:6]{ //iff (coverage_trans.opcode inside {4'b0001,4'b0101,4'b1001}){
                  bins range[2] = {0,1,2,3,4,5,6,7};
    }

    alu_sr2_cross_cp: coverpoint coverage_trans.instruction[8:6]{ //(coverage_trans.opcode inside {4'b0001,4'b0101,4'b1001}){
                  bins range[2] = {0,1,2,3,4,5,6,7};
    }

    alu_dr_cross_cp: coverpoint coverage_trans.instruction[11:9]{// iff (coverage_trans.opcode inside {4'b0001,4'b0101,4'b1001}){
					bins range[2] = {0,1,2,3,4,5,6,7};
    }
	
  endgroup

  covergroup decode_in_memory_cg;
    option.auto_bin_max=1024;
    option.per_instance=1;

    op_ldr: coverpoint coverage_trans.opcode{
      bins memory_operations = {LDR};
    }
    op_ldi: coverpoint coverage_trans.opcode{
      bins memory_operations = {LDI};
    }

    op_ld: coverpoint coverage_trans.opcode{
      bins memory_operations = {LD};
    }

    op_lea: coverpoint coverage_trans.opcode{
      bins memory_operations = {LEA};
    }

    op_st: coverpoint coverage_trans.opcode{
      bins memory_operations = {ST};
    }

    op_str: coverpoint coverage_trans.opcode{
      bins memory_operations = {STR};
    }

    op_sti: coverpoint coverage_trans.opcode{
      bins memory_operations = {STI};
    }

    dreg_mem: coverpoint  coverage_trans.dr iff (( coverage_trans.opcode == LD) || (  coverage_trans.opcode == LDR) || (  coverage_trans.opcode == LDI)|| (  coverage_trans.opcode == LEA))
    {
        bins b_0_to_7 = {[0:7]};
    }
    sreg_mem: coverpoint  coverage_trans.sr1 iff (( coverage_trans.opcode == ST) || (  coverage_trans.opcode == STI) || (  coverage_trans.opcode == STR))
    {
        bins b_0_to_7 = {[0:7]};
    }       
	  baser_mem :  coverpoint  coverage_trans.baser iff (( coverage_trans.opcode == LDR) || (  coverage_trans.opcode == STR))
    {
        bins b_0_to_7 = {[0:7]};
    }
    pcOffset6_reg_mem :  coverpoint  coverage_trans.pcoffset6 iff (( coverage_trans.opcode == LDR) || (  coverage_trans.opcode == STR))
    {
        bins b_0_to_63 = {[0:63]};
    }
    
    pcOffset9_reg_mem :  coverpoint  coverage_trans.pcoffset9 iff (( coverage_trans.opcode == LD) || (  coverage_trans.opcode == LDI)|| ( coverage_trans.opcode == LEA) || (  coverage_trans.opcode == ST) || (  coverage_trans.opcode == STI))
    {
       	bins b_0_to_511= {[0:511]};
    }

    ld_x_dr : cross op_ld, dreg_mem {}
    ld_x_pcoffset9 : cross op_ld, pcOffset9_reg_mem {}

    ldr_x_dr : cross op_ldr, dreg_mem {}
    ldr_x_baser : cross op_ldr, baser_mem {}
    ldr_x_pcoffset6 : cross op_ldr, pcOffset6_reg_mem {}

    ldi_x_dr : cross op_ldi, dreg_mem {}
    ldi_x_pcoffset9 : cross op_ldi, pcOffset9_reg_mem {}

    st_x_sr : cross op_st, sreg_mem {}
    st_x_pcoffset9: cross op_st, pcOffset9_reg_mem {}

    str_x_sr: cross op_str, sreg_mem {}
    str_x_baser: cross op_str, baser_mem {}
    str_x_pcoffset6: cross op_str, pcOffset6_reg_mem {}

    sti_x_sr: cross op_sti, sreg_mem {}
    sti_x_pcoffset9: cross op_sti, pcOffset9_reg_mem {}

    lea_x_dr: cross op_lea, dreg_mem {}
    lea_x_pcoffset9: cross op_lea, pcOffset9_reg_mem {}

  endgroup

  covergroup decode_in_control_cg;
    option.auto_bin_max=1024;
    option.per_instance=1;

    op_jmp: coverpoint coverage_trans.opcode{
      bins control_operations = {JMP};
    }
    op_br: coverpoint coverage_trans.opcode{
      bins control_operations = {BR};
    }
    nzp: coverpoint {coverage_trans.n, coverage_trans.z, coverage_trans.p} iff (coverage_trans.opcode == BR)
    {
        bins b_0_to_7 = {[0:7]};
    }
    
    pcoffset9:  coverpoint  coverage_trans.pcoffset9 iff ( coverage_trans.opcode == BR)
    {
       	bins b_0_to_511= {[0:511]};
    }
    baser: coverpoint coverage_trans.baser iff (coverage_trans.opcode == JMP)
    {
        bins b_0_to_7 = {[0:7]};
    }

    baser_x_jmp: cross op_jmp, baser {}
    pcoffset9_x_br: cross op_br, pcoffset9 {}
    nzp_x_br : cross op_br, nzp {}

  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    decode_in_transaction_cg=new;
    decode_in_memory_cg=new;
    decode_in_control_cg=new;
    decode_in_alu_cg=new;
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    decode_in_transaction_cg.set_inst_name($sformatf("decode_in_transaction_cg_%s",get_full_name()));
    decode_in_alu_cg.set_inst_name($sformatf("decode_in_alu_cg_%s",get_full_name()));
    decode_in_memory_cg.set_inst_name($sformatf("decode_in_memory_cg_%s",get_full_name()));
    decode_in_control_cg.set_inst_name($sformatf("decode_in_control_cg_%s",get_full_name()));
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
    decode_in_transaction_cg.sample();
    decode_in_memory_cg.sample();
    decode_in_control_cg.sample();
    decode_in_alu_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

