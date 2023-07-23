typedef 32 XLEN;
Integer xlen = valueOf(XLEN);

typedef Bit #(XLEN) WordXL; // Raw (unsigned) register data
typedef Int #(XLEN) IntXL;  // Signed register data

typedef WordXL Addr; // Addresses/Pointers

typedef 8 Bits_per_Byte;
typedef Bit #(Bits_per_Byte) Byte;

// Tokens are used for signalling/synchronization, and have no payload
typedef Bit #(0) Token;

typedef Bit #(32) Instr;
typedef Bit #(7) Opcode;
typedef Bit #(5) RegName; // 32 registers, 0..31
typedef 32 NumRegs;
Integer numRegs = valueOf(NumRegs);

function Opcode instr_opcode (Instr x);
  return x[6:0];
endfunction

function Bit #(3) instr_funct3 (Instr x);
  return x[14:12];
endfunction

function Bit #(7) instr_funct7 (Instr x);
  return x[31:25];
endfunction

function RegName instr_rd (Instr x);
  return x[11:7];
endfunction

function RegName instr_rs1 (Instr x);
  return x [19:15];
endfunction

function RegName instr_rs2 (Instr x);
  return x[24:20];
endfunction

function Bit #(12) instr_I_imm12 (Instr x);
  return x[31:20];
endfunction

function Bit #(12) instr_S_imm12 (Instr x);
  return { x[31:25], x[11:7] };
endfunction

function Bit #(13) instr_SB_imm13 (Instr x);
  return { x[31], x[7], x[30:25], x[11:8], 1'b0 };
endfunction

function Bit #(20) instr_U_imm20 (Instr x);
  return x[31:12];
endfunction

function Bit #(21) instr_UJ_imm21 (Instr x);
  return { x[31], x[19:12], x[20], x[30:21], 1'b0 };
endfunction

typedef struct {
   Opcode    opcode;

   RegName   rd;
   RegName   rs1;
   RegName   rs2;

   Bit #(3)  funct3;
   Bit #(7)  funct7;

   Bit #(12) imm12_I;
   Bit #(12) imm12_S;
   Bit #(13) imm13_SB;
   Bit #(20) imm20_U;
   Bit #(21) imm21_UJ;
} Decoded_Instr
deriving (FShow, Bits);

function Decoded_Instr fv_decode (Instr instr);
  return Decoded_Instr {
     opcode: instr_opcode(instr),

     rd: instr_rd(instr),
     rs1: instr_rs1(instr),
     rs2: instr_rs2(instr),

     funct3: instr_funct3(instr),
     funct7: instr_funct7(instr),

     imm12_I: instr_I_imm12(instr),
     imm12_S: instr_S_imm12(instr),
     imm13_SB: instr_SB_imm13(instr),
     imm20_U: instr_U_imm20(instr),
     imm21_UJ: instr_UJ_imm21(instr),
  };
endfunction

// Load instructions
Opcode op_LOAD = 7'b00_000_11;

// Store instructions
Opcode op_STORE = 7'b01_000_11;

// Memory Model
Opcode op_MISC_MEM = 7'b00_011_11;

// Atomic Memory Operation Instructions
Opcode op_AMO = 7'b01_011_11;

// Integer Register-Immediate Instructions
Opcode op_OP_IMM = 7'b00_100_11;

// Integer Register-Register Instructions
Opcode op_OP = 7'b01_100_11;

// LUI, AUIPC
Opcode op_LUI = 7'b01_101_11;
Opcode op_AUIPC = 7'b00_101_11;

// Control transfer
Opcode op_BRANCH = 7'b11_000_11;
Opcode op_JAL = 7'b11_011_11;
Opcode op_JALR = 7'b11_001_11;
