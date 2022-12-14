//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the inst_mem package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the inst_mem_configuration class.
//
  `define inst_mem_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } inst_mem_configuration_s;

  `define inst_mem_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function inst_mem_configuration_s to_struct();\
    inst_mem_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( inst_mem_configuration_struct );\
  endfunction

  `define inst_mem_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(inst_mem_configuration_s inst_mem_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = inst_mem_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the inst_mem_transaction class.
//
  `define inst_mem_MONITOR_STRUCT typedef struct packed  { \
  op_t opcode ; \
  bit [2:0] sr1 ; \
  bit [2:0] sr2 ; \
  bit [2:0] dr ; \
  bit mode ; \
  bit [2:0] baser ; \
  bit [8:0] pcoffset9 ; \
  bit [5:0] pcoffset6 ; \
  bit [4:0] imm5 ; \
  bit [2:0] nzp ; \
  word PC ; \
  bit instrmem_rd ; \
  word instr_dout ; \
  bit complete_instr ; \
     } inst_mem_monitor_s;

  `define inst_mem_TO_MONITOR_STRUCT_FUNCTION \
  virtual function inst_mem_monitor_s to_monitor_struct();\
    inst_mem_monitor_struct = \
            { \
            this.opcode , \
            this.sr1 , \
            this.sr2 , \
            this.dr , \
            this.mode , \
            this.baser , \
            this.pcoffset9 , \
            this.pcoffset6 , \
            this.imm5 , \
            this.nzp , \
            this.PC , \
            this.instrmem_rd , \
            this.instr_dout , \
            this.complete_instr  \
            };\
    return ( inst_mem_monitor_struct);\
  endfunction\

  `define inst_mem_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(inst_mem_monitor_s inst_mem_monitor_struct);\
            {\
            this.opcode , \
            this.sr1 , \
            this.sr2 , \
            this.dr , \
            this.mode , \
            this.baser , \
            this.pcoffset9 , \
            this.pcoffset6 , \
            this.imm5 , \
            this.nzp , \
            this.PC , \
            this.instrmem_rd , \
            this.instr_dout , \
            this.complete_instr  \
            } = inst_mem_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the inst_mem_transaction class.
//      Also update the comments in the driver BFM.
//
  `define inst_mem_INITIATOR_STRUCT typedef struct packed  { \
  op_t opcode ; \
  bit [2:0] sr1 ; \
  bit [2:0] sr2 ; \
  bit [2:0] dr ; \
  bit mode ; \
  bit [2:0] baser ; \
  bit [8:0] pcoffset9 ; \
  bit [5:0] pcoffset6 ; \
  bit [4:0] imm5 ; \
  bit [2:0] nzp ; \
  word PC ; \
  bit instrmem_rd ; \
  word instr_dout ; \
  bit complete_instr ; \
     } inst_mem_initiator_s;

  `define inst_mem_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function inst_mem_initiator_s to_initiator_struct();\
    inst_mem_initiator_struct = \
           {\
           this.opcode , \
           this.sr1 , \
           this.sr2 , \
           this.dr , \
           this.mode , \
           this.baser , \
           this.pcoffset9 , \
           this.pcoffset6 , \
           this.imm5 , \
           this.nzp , \
           this.PC , \
           this.instrmem_rd , \
           this.instr_dout , \
           this.complete_instr  \
           };\
    return ( inst_mem_initiator_struct);\
  endfunction

  `define inst_mem_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(inst_mem_initiator_s inst_mem_initiator_struct);\
           {\
           this.opcode , \
           this.sr1 , \
           this.sr2 , \
           this.dr , \
           this.mode , \
           this.baser , \
           this.pcoffset9 , \
           this.pcoffset6 , \
           this.imm5 , \
           this.nzp , \
           this.PC , \
           this.instrmem_rd , \
           this.instr_dout , \
           this.complete_instr  \
           } = inst_mem_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the inst_mem_transaction class.
//      Also update the comments in the driver BFM.
//
  `define inst_mem_RESPONDER_STRUCT typedef struct packed  { \
  op_t opcode ; \
  bit [2:0] sr1 ; \
  bit [2:0] sr2 ; \
  bit [2:0] dr ; \
  bit mode ; \
  bit [2:0] baser ; \
  bit [8:0] pcoffset9 ; \
  bit [5:0] pcoffset6 ; \
  bit [4:0] imm5 ; \
  bit [2:0] nzp ; \
  word PC ; \
  bit instrmem_rd ; \
  word instr_dout ; \
  bit complete_instr ; \
     } inst_mem_responder_s;

  `define inst_mem_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function inst_mem_responder_s to_responder_struct();\
    inst_mem_responder_struct = \
           {\
           this.opcode , \
           this.sr1 , \
           this.sr2 , \
           this.dr , \
           this.mode , \
           this.baser , \
           this.pcoffset9 , \
           this.pcoffset6 , \
           this.imm5 , \
           this.nzp , \
           this.PC , \
           this.instrmem_rd , \
           this.instr_dout , \
           this.complete_instr  \
           };\
    return ( inst_mem_responder_struct);\
  endfunction

  `define inst_mem_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(inst_mem_responder_s inst_mem_responder_struct);\
           {\
           this.opcode , \
           this.sr1 , \
           this.sr2 , \
           this.dr , \
           this.mode , \
           this.baser , \
           this.pcoffset9 , \
           this.pcoffset6 , \
           this.imm5 , \
           this.nzp , \
           this.PC , \
           this.instrmem_rd , \
           this.instr_dout , \
           this.complete_instr  \
           } = inst_mem_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
