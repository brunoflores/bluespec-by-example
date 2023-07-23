typedef Bit#(32) Word;
typedef Bit#(5) RIndx;

typedef struct {
   IType iType;
   AluFunc aluFunc;
   BrFunc brFunc;
   RDst dst;
   RIndx src1;
   RIndx src2;
   Word imm;
} DecodedInst
deriving (Bits, Eq);

typedef enum {
   Op,
   Opimm,
   Branch,
   Lui,
   Jal,
   Jalr,
   Load,
   Store,
   Unsupported
} IType
deriving (Bits, Eq);

typedef enum {
   Add,
   Sub,
   And,
   Or,
   Xor,
   Slt,
   Sltu,
   Sll,
   Sra,
   Srl
} AluFunc
deriving (Bits, Eq);

typedef enum {
   Eq,
   Neq,
   Lt,
   Ltu,
   Ge,
   Geu
} BrFunc
deriving (Bits, Eq);

typedef struct {
   Bool valid;
   RIndx index;
} RDst
deriving (Bits, Eq);

function DecodedInst decode(Bit#(32) inst);
endfunction
