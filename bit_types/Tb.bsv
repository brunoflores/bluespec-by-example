package Tb;

(* synthesize *)
module mkTb (Empty);
    Reg#(int) step <- mkReg(0);

    Reg#(Int#(16)) int16 <- mkReg('h800);
    Reg#(UInt#(16)) uint16 <- mkReg('h800);

    rule step0 (step == 0);
        $display("== step 0 ==");

        UInt#(16) foo = 'h1fff;
        $display("foo = %x", foo);

        foo = foo & 5;
        $display("foo = %x", foo);

        foo = 'hffff;
        $display("foo = %x", foo);

        foo = foo + 1;
        $display("foo = %x", foo);

        UInt#(16) maxUInt16 = unpack('1);
        UInt#(16) minUInt16 = unpack(0);

        $display("maxUInt16 = %d", maxUInt16);
        $display("minUInt16 = %d", minUInt16);

        $finish(0);
    endrule: step0
endmodule: mkTb

endpackage: Tb
