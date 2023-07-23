export mkCPU;

import FIFOF::*;
import SpecialFIFOs::*;
import GetPut::*;
import ClientServer::*;
import Connectable::*;
import ConfigReg::*;

// import GetPut_Aux::*;
// import Semi_FIFOF::*;

import AXI4_Types::*;
import ISA_Decls::*;
import GPR_RegFile::*;
import CPU_Globals::*;
import CPU_IFC::*;
