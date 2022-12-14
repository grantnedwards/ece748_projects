//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an decode_out
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class decode_out_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( decode_out_transaction )

  bit[15:0] npc_out ;
  bit Mem_Control ;
  bit[5:0] E_Control ;
  bit[1:0] W_Control ;
  op_t opcode ;
  mode_t mode ;
  reg_t sr1 ;
  reg_t sr2 ;
  reg_t dr ;
  baser_t baser ;
  pcoffset9_t pcoffset9 ;
  pcoffset6_t pcoffset6 ;
  imm5_t imm5 ;
  n_t n ;
  z_t z ;
  p_t p ;
  bit [15:0] instruction ;

  //Constraints for the transaction variables:

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //*******************************************************************
  //*******************************************************************
  // Macros that define structs and associated functions are
  // located in decode_out_macros.svh

  //*******************************************************************
  // Monitor macro used by decode_out_monitor and decode_out_monitor_bfm
  // This struct is defined in decode_out_macros.svh
  `decode_out_MONITOR_STRUCT
    decode_out_monitor_s decode_out_monitor_struct;
  //*******************************************************************
  // FUNCTION: to_monitor_struct()
  // This function packs transaction variables into a decode_out_monitor_s
  // structure.  The function returns the handle to the decode_out_monitor_struct.
  // This function is defined in decode_out_macros.svh
  `decode_out_TO_MONITOR_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_monitor_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in decode_out_macros.svh
  `decode_out_FROM_MONITOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Initiator macro used by decode_out_driver and decode_out_driver_bfm
  // to communicate initiator driven data to decode_out_driver_bfm.
  // This struct is defined in decode_out_macros.svh
  `decode_out_INITIATOR_STRUCT
    decode_out_initiator_s decode_out_initiator_struct;
  //*******************************************************************
  // FUNCTION: to_initiator_struct()
  // This function packs transaction variables into a decode_out_initiator_s
  // structure.  The function returns the handle to the decode_out_initiator_struct.
  // This function is defined in decode_out_macros.svh
  `decode_out_TO_INITIATOR_STRUCT_FUNCTION  
  //*******************************************************************
  // FUNCTION: from_initiator_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in decode_out_macros.svh
  `decode_out_FROM_INITIATOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Responder macro used by decode_out_driver and decode_out_driver_bfm
  // to communicate Responder driven data to decode_out_driver_bfm.
  // This struct is defined in decode_out_macros.svh
  `decode_out_RESPONDER_STRUCT
    decode_out_responder_s decode_out_responder_struct;
  //*******************************************************************
  // FUNCTION: to_responder_struct()
  // This function packs transaction variables into a decode_out_responder_s
  // structure.  The function returns the handle to the decode_out_responder_struct.
  // This function is defined in decode_out_macros.svh
  `decode_out_TO_RESPONDER_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_responder_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in decode_out_macros.svh
  `decode_out_FROM_RESPONDER_STRUCT_FUNCTION 
  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
  endfunction

  // ****************************************************************************
  // FUNCTION: convert2string()
  // This function converts all variables in this class to a single string for 
  // logfile reporting.
  //
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    // UVMF_CHANGE_ME : Customize format if desired.
    return $sformatf("npc_out:0x%x Mem_Control:0x%x E_Control:0x%x W_Control:0x%x opcode:0x%x mode:0x%x sr1:0x%x sr2:0x%x dr:0x%x baser:0x%x pcoffset9:0x%x pcoffset6:0x%x imm5:0x%x n:0x%x z:0x%x p:0x%x instruction:0x%x ",npc_out,Mem_Control,E_Control,W_Control,opcode,mode,sr1,sr2,dr,baser,pcoffset9,pcoffset6,imm5,n,z,p,instruction);
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
    decode_out_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.instruction == RHS.instruction)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    decode_out_transaction  RHS;
    assert($cast(RHS,rhs));
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.npc_out = RHS.npc_out;
    this.Mem_Control = RHS.Mem_Control;
    this.E_Control = RHS.E_Control;
    this.W_Control = RHS.W_Control;
    this.opcode = RHS.opcode;
    this.mode = RHS.mode;
    this.sr1 = RHS.sr1;
    this.sr2 = RHS.sr2;
    this.dr = RHS.dr;
    this.baser = RHS.baser;
    this.pcoffset9 = RHS.pcoffset9;
    this.pcoffset6 = RHS.pcoffset6;
    this.imm5 = RHS.imm5;
    this.n = RHS.n;
    this.z = RHS.z;
    this.p = RHS.p;
    this.instruction = RHS.instruction;
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
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"decode_out_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,npc_out,"npc_out");
    $add_attribute(transaction_view_h,Mem_Control,"Mem_Control");
    $add_attribute(transaction_view_h,E_Control,"E_Control");
    $add_attribute(transaction_view_h,W_Control,"W_Control");
    $add_attribute(transaction_view_h,opcode,"opcode");
    $add_attribute(transaction_view_h,mode,"mode");
    $add_attribute(transaction_view_h,sr1,"sr1");
    $add_attribute(transaction_view_h,sr2,"sr2");
    $add_attribute(transaction_view_h,dr,"dr");
    $add_attribute(transaction_view_h,baser,"baser");
    $add_attribute(transaction_view_h,pcoffset9,"pcoffset9");
    $add_attribute(transaction_view_h,pcoffset6,"pcoffset6");
    $add_attribute(transaction_view_h,imm5,"imm5");
    $add_attribute(transaction_view_h,n,"n");
    $add_attribute(transaction_view_h,z,"z");
    $add_attribute(transaction_view_h,p,"p");
    $add_attribute(transaction_view_h,instruction,"instruction");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

function void pack_instruction();
    case( opcode )
    ADD:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = dr;
      instruction[8:6] = sr1;
      instruction[5] = mode;
      if ( mode == 0 )
      begin
        instruction[4:3] = 'b00;
        instruction[2:0] = sr2;
      end
      else
      begin
        instruction[4:0] = imm5;
      end
      end
    AND:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = dr;
      instruction[8:6] = sr1;
      instruction[5] = mode;
      if ( mode == 0 )
      begin
        instruction[4:3] = 'b00;
        instruction[2:0] = sr2;
      end
      else
      begin
        instruction[4:0] = imm5;
      end
      end
    NOT:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = dr;
      instruction[8:6] = sr1;
      instruction[5:0] = 'b111111;
      end
    LD:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = dr;
      instruction[8:0] = pcoffset9;
      end
    LDR:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = dr;
      instruction[8:6] = baser;
      instruction[5:0] = pcoffset6;
      end
    LDI:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = dr;
      instruction[8:0] = pcoffset9;
      end
    LEA:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = dr;
      instruction[8:0] = pcoffset9;
      end
    ST:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = sr1;
      instruction[8:0] = pcoffset9;
      end
    STR:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = sr1;
      instruction[8:6] = baser;
      instruction[5:0] = pcoffset6;
      end
    STI:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = sr1;
      instruction[8:0] = pcoffset9;
      end
    BR:
      begin
      instruction[15:12] = opcode;
      instruction[11] = n;
      instruction[10] = z;
      instruction[9] = p;
      instruction[8:0] = pcoffset9;
      end
    JMP:
      begin
      instruction[15:12] = opcode;
      instruction[11:9] = 'b000;
      instruction[8:6] = baser;
      instruction[5:0] = 'b000000;
      end
    default: 
      begin
      instruction[15:12] = opcode;
      instruction[11:0] = 'h0;
      end
    endcase
  endfunction

  function void unpack_instruction();
    opcode = op_t'(instruction[15:12]);
    case( opcode )
    ADD:
      begin
      dr = instruction[11:9];
      sr1 = instruction[8:6];
      mode = instruction[5];
      if ( instruction[5] == 0 )
        sr2 = instruction[2:0];
      else
        imm5 = instruction[4:0];
      end
    AND:
      begin
      dr = instruction[11:9];
      sr1 = instruction[8:6];
      mode = instruction[5];
      if ( instruction[5] == 0 )
        sr2 = instruction[2:0];
      else
        imm5 = instruction[4:0];
      end
    NOT:
      begin
      dr = instruction[11:9];
      sr1 = instruction[8:6];
      end
    LD:
      begin
      dr = instruction[11:9];
      pcoffset9 = instruction[8:0];
      end
    LDR:
      begin
      dr = instruction[11:9];
      baser = instruction[8:6];
      pcoffset6 = instruction[5:0];
      end
    LDI:
      begin
      dr = instruction[11:9];
      pcoffset9 = instruction[8:0];
      end
    LEA:
      begin
      dr = instruction[11:9];
      pcoffset9 = instruction[8:0];
      end
    ST:
      begin
      sr1 = instruction[11:9];
      pcoffset9 = instruction[8:0];
      end
    STR:
      begin
      sr1 = instruction[11:9];
      baser = instruction[8:6];
      pcoffset6 = instruction[5:0];
      end
    STI:
      begin
      sr1 = instruction[11:9];
      pcoffset9 = instruction[8:0];
      end
    BR:
      begin
      n = instruction[11];
      z = instruction[10];
      p = instruction[9];
      pcoffset9 = instruction[8:0];
      end
    JMP:
      baser = instruction[8:6];
    endcase
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

