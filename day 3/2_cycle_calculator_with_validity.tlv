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
      @0
         $reset = *reset;
         
      @1
         $val1 [31:0] = >>2$out [31:0];
         $val2 [31:0] = $rand2[3:0];
         
         $valid = $reset ? 1'b0 : >>1$valid + 1'b1;
         $valid_or_reset = $valid || $reset;
         
      ?$valid_or_reset
      @1
         $sum [31:0] = $val1 + $val2;
         $diff[31:0] = $val1 - $val2;
         $prod[31:0] = $val1 * $val2;
         $qut [31:0] = $val1 / $val2;
         
      @2
         $out [31:0] = $reset ? 32'b0 :
                      ($op[1:0] == 2'b00) ? $sum :
                      ($op[1:0] == 2'b01) ? $diff :
                      ($op[1:0] == 2'b10) ? $prod :
                                              $qut ;
   
   //...
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule