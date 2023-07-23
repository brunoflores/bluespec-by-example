import Proc::*;

(* synthesize *)
module mkTb (Empty);
  IProc proc <- mkProc;

  rule greet;
    $display("Hello World!");
    $finish(0);
  endrule
endmodule
