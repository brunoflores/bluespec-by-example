import Vector::*;

import Instr::*;

interface RFile2R1W;
  method Word rd1(RIndx i);
  method Word rd2(RIndx i);
  method Action wr (RIndx i, Word d);
endinterface

module mkRFile2R1W(RFile2R1W);
  Vector#(32, Reg#(Word)) rfile <- replicateM(mkReg(0));

  method Word rd1(RIndx i) = rfile[i];

  method Word rd2(RIndx i) = rfile[i];

  method Action wr(RIndx i, Word d);
    // Register 0 is hardwired to zero and cannot be written.
    if (i != 0) begin
      rfile[i] <= d;
    end
  endmethod
endmodule
