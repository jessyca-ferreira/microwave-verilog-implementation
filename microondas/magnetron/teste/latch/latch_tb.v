`timescale 1ns/1ps
`include "magnetron\HDL\terceiro_nivel\latch.v"

module latch_tb;
    reg s, r;
    wire out;

    latch dut (
      .s(s), .r(r),
      .out(out)
    );

    initial begin
        $dumpfile("latch.vcd");
        $dumpvars(0, latch_tb);

        s = 1; r = 0;
        #50;
        s = 0; r = 1;
        #50;
        s = 1; r = 1;
        #50;
        s = 0; r = 0;
        #50;
        s = 1; r = 0;
        #50;

    end
endmodule