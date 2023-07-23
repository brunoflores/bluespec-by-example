import GetPut::*;
import ClientServer::*;

import ISA_Decls::*;
import AXI4_Types::*;
import Fabric_Defs::*;

interface CPU_IFC;

  // Reset
  interface Server #(Bool, Bool) hart0_server_reset;

  // ---------------------------------------------------------------------------
  // SoC fabric connections
  // IMem to Fabric master interface
  interface AXI4_Master_IFC #(Wd_Id, Wd_Addr, Wd_Data, Wd_User) imem_master;
  // DMem to Fabric master interface
  interface AXI4_Master_IFC #(Wd_Id, Wd_Addr, Wd_Data, Wd_User) dmem_master;
  // ---------------------------------------------------------------------------

  // Set core's verbosity
  method Action set_verbosity (Bit #(4) verbosity, Bit #(64) logdelay);

endinterface
