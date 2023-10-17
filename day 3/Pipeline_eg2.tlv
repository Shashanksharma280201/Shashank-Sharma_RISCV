\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
   `include "sqrt32.v"
\TLV
   $reset = *reset;
   
   |calc
      @1
         $err1 = $bad_input ||$illegal_op;
      @2
         $err2 = $err1 || $over_flow;
      @3
         $err3 = $div_by_zero || $err2;
   
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
