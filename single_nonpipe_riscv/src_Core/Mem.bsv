import Memory::*;
import ClientServer::*;
import GetPut::*;
import FIFOF::*;

import Instr::*;

/*
typedef enum {
   Ld,
   St
} MemOp
deriving (Bits, Eq);

typedef struct {
   MemOp op;
   Word addr;
   Word data;
} MemoryRequest
deriving (Bits, Eq);
*/

/*
interface MagicMemory;
  method ActionValue#(Word) req(MemReq r);
endinterface
*/

typedef 32 AddrWidth;
typedef 8 DataWidth;

Integer memSize = 'h_80_0000;

typedef MemoryServer#(AddrWidth, DataWidth) IMem;

module mkMem(IMem);

  FIFOF #(MemoryRequest #(AddrWidth, DataWidth)) f_memreqs <- mkFIFOF;
  FIFOF #(MemoryResponse #(DataWidth)) f_memrsps <- mkFIFOF;

  interface Put request = toPut(f_memreqs);
  interface Get response = toGet(f_memrsps);

endmodule
