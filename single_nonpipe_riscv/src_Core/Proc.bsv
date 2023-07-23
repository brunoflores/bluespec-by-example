import ClientServer::*;

import RF::*;
import Mem::*;
import Instr::*;

interface IProc;
endinterface

module mkProc(IProc);
  Reg#(Word) pc <- mkReg(0);
  RFile2R1W rf <- mkRFile2R1W;
  IMem iMem <- mkMem;
  IMem dMem <- mkMem;

  rule doProc;
    // let inst <- iMem.req(MemReq{op: Ld, addr: pc, data: dwv});
    let dInst = decode(inst);
    let rVal1 = rf.rd1(dInst.src1.index);
    let rVal2 = rf.rd2(dInst.src2.index);
    let eInst = execute(dInst, rVal1, rVal2, pc);
    updateState(eInst, pc, rf, dMem);
  endrule
endmodule
