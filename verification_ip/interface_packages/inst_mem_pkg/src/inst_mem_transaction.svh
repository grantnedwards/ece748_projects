//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an inst_mem
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class inst_mem_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( inst_mem_transaction )

  rand op_t opcode ;
  rand bit [2:0] sr1 ;
  rand bit [2:0] sr2 ;
  rand bit [2:0] dr ;
  rand bit mode ;
  rand bit [2:0] baser ;
  rand bit [8:0] pcoffset9 ;
  rand bit [5:0] pcoffset6 ;
  rand bit [4:0] imm5 ;
  rand bit [2:0] nzp ;
  word PC ;
  bit instrmem_rd ;
  rand word instr_dout ;
  bit complete_instr ;


  static int instr_count = 0;
  //Constraints for the transaction variables:
  constraint opcode_c {opcode inside {ADD, AND, NOT, BR, JMP, LD, LDR, LDI, LEA, ST, STR, STI};}
  //constraint comp_instr { complete_instr == 1'b1; }
  constraint nzp_c {$countones(nzp) != 0;}

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //*******************************************************************
  //*******************************************************************
  // Macros that define structs and associated functions are
  // located in inst_mem_macros.svh

  //*******************************************************************
  // Monitor macro used by inst_mem_monitor and inst_mem_monitor_bfm
  // This struct is defined in inst_mem_macros.svh
  `inst_mem_MONITOR_STRUCT
    inst_mem_monitor_s inst_mem_monitor_struct;
  //*******************************************************************
  // FUNCTION: to_monitor_struct()
  // This function packs transaction variables into a inst_mem_monitor_s
  // structure.  The function returns the handle to the inst_mem_monitor_struct.
  // This function is defined in inst_mem_macros.svh
  `inst_mem_TO_MONITOR_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_monitor_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in inst_mem_macros.svh
  `inst_mem_FROM_MONITOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Initiator macro used by inst_mem_driver and inst_mem_driver_bfm
  // to communicate initiator driven data to inst_mem_driver_bfm.
  // This struct is defined in inst_mem_macros.svh
  `inst_mem_INITIATOR_STRUCT
    inst_mem_initiator_s inst_mem_initiator_struct;
  //*******************************************************************
  // FUNCTION: to_initiator_struct()
  // This function packs transaction variables into a inst_mem_initiator_s
  // structure.  The function returns the handle to the inst_mem_initiator_struct.
  // This function is defined in inst_mem_macros.svh
  `inst_mem_TO_INITIATOR_STRUCT_FUNCTION  
  //*******************************************************************
  // FUNCTION: from_initiator_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in inst_mem_macros.svh
  `inst_mem_FROM_INITIATOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Responder macro used by inst_mem_driver and inst_mem_driver_bfm
  // to communicate Responder driven data to inst_mem_driver_bfm.
  // This struct is defined in inst_mem_macros.svh
  `inst_mem_RESPONDER_STRUCT
    inst_mem_responder_s inst_mem_responder_struct;
  //*******************************************************************
  // FUNCTION: to_responder_struct()
  // This function packs transaction variables into a inst_mem_responder_s
  // structure.  The function returns the handle to the inst_mem_responder_struct.
  // This function is defined in inst_mem_macros.svh
  `inst_mem_TO_RESPONDER_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_responder_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in inst_mem_macros.svh
  `inst_mem_FROM_RESPONDER_STRUCT_FUNCTION 
  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
  endfunction

  function void post_randomize();
		case(opcode)
			ADD: begin
        if (mode)
          instr_dout = {opcode, dr, sr1, mode, imm5};
        else
          instr_dout = {opcode, dr, sr1, 3'b000, sr2};
      end 
			AND: begin
					if(mode)					
						instr_dout = {opcode, dr, sr1, mode, imm5};
					else
						instr_dout = {opcode, dr, sr1, 3'b000, sr2};
				 end
			NOT: instr_dout = {NOT, dr, sr1, 6'b111111};
			LD:  instr_dout = {LD, dr, pcoffset9}; 
			LDR: instr_dout = {LDR, dr, baser, pcoffset6}; 
			LDI: instr_dout = {LDI, dr, pcoffset9}; 
			LEA: instr_dout = {LEA, dr, pcoffset9}; 
			ST:  instr_dout = {ST, sr1, pcoffset9}; 
			STR: instr_dout = {STR, sr1, baser, pcoffset6}; 
			STI: instr_dout = {STI, sr1, pcoffset9};
			BR:  instr_dout = {BR, nzp, pcoffset9};
			JMP: instr_dout = {JMP, 3'b000, baser, 6'b000000}; 
			default: `uvm_info(get_type_name(), $sformatf("unexpected randomization op_code: %b", opcode), UVM_MEDIUM)
		endcase
    instr_count++;
	endfunction
  

  // ****************************************************************************
  // FUNCTION: convert2string()
  // This function converts all variables in this class to a single string for 
  // logfile reporting.
  //
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    // UVMF_CHANGE_ME : Customize format if desired.
    return $sformatf("opcode:0x%x sr1:0x%x sr2:0x%x dr:0x%x mode:0x%x baser:0x%x pcoffset9:0x%x pcoffset6:0x%x imm5:0x%x nzp:0x%x PC:0x%x instrmem_rd:0x%x instr_dout:0x%x complete_instr:0x%x ",opcode,sr1,sr2,dr,mode,baser,pcoffset9,pcoffset6,imm5,nzp,PC,instrmem_rd,instr_dout,complete_instr);
    // pragma uvmf custom convert2string end
  endfunction

  //*******************************************************************
  // FUNCTION: do_print()
  // This function is automatically called when the .print() function
  // is called on this class.
  //
  virtual function void do_print(uvm_printer printer);
    // pragma uvmf custom do_print begin
    // UVMF_CHANGE_ME : Current contents of do_print allows for the use of UVM 1.1d, 1.2 or P1800.2.
    // Update based on your own printing preference according to your preferred UVM version
    $display(convert2string());
    // pragma uvmf custom do_print end
  endfunction

  //*******************************************************************
  // FUNCTION: do_compare()
  // This function is automatically called when the .compare() function
  // is called on this class.
  //
  virtual function bit do_compare (uvm_object rhs, uvm_comparer comparer);
    inst_mem_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    inst_mem_transaction  RHS;
    assert($cast(RHS,rhs));
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.opcode = RHS.opcode;
    this.sr1 = RHS.sr1;
    this.sr2 = RHS.sr2;
    this.dr = RHS.dr;
    this.mode = RHS.mode;
    this.baser = RHS.baser;
    this.pcoffset9 = RHS.pcoffset9;
    this.pcoffset6 = RHS.pcoffset6;
    this.imm5 = RHS.imm5;
    this.nzp = RHS.nzp;
    this.PC = RHS.PC;
    this.instrmem_rd = RHS.instrmem_rd;
    this.instr_dout = RHS.instr_dout;
    this.complete_instr = RHS.complete_instr;
    // pragma uvmf custom do_copy end
  endfunction

  // ****************************************************************************
  // FUNCTION: add_to_wave()
  // This function is used to display variables in this class in the waveform 
  // viewer.  The start_time and end_time variables must be set before this 
  // function is called.  If the start_time and end_time variables are not set
  // the transaction will be hidden at 0ns on the waveform display.
  // 
  virtual function void add_to_wave(int transaction_viewing_stream_h);
    `ifdef QUESTA
    if (transaction_view_h == 0) begin
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"inst_mem_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,opcode,"opcode");
    $add_attribute(transaction_view_h,sr1,"sr1");
    $add_attribute(transaction_view_h,sr2,"sr2");
    $add_attribute(transaction_view_h,dr,"dr");
    $add_attribute(transaction_view_h,mode,"mode");
    $add_attribute(transaction_view_h,baser,"baser");
    $add_attribute(transaction_view_h,pcoffset9,"pcoffset9");
    $add_attribute(transaction_view_h,pcoffset6,"pcoffset6");
    $add_attribute(transaction_view_h,imm5,"imm5");
    $add_attribute(transaction_view_h,nzp,"nzp");
    $add_attribute(transaction_view_h,PC,"PC");
    $add_attribute(transaction_view_h,instrmem_rd,"instrmem_rd");
    $add_attribute(transaction_view_h,instr_dout,"instr_dout");
    $add_attribute(transaction_view_h,complete_instr,"complete_instr");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

