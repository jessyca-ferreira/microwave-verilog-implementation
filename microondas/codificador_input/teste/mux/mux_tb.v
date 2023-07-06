`timescale 1ns/1ps
`include "codificador_input\HDL\terceiro_nivel\mux.v"

module mux_tb;
    reg sel, i0, i1;
 
    wire out;

    mux dut(
        .sel(sel), .i0(i0), .i1(i1),
        .out(out)
    );

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, mux_tb);

        i0 = 1; i1 = 0; sel = 1; #100;
        i0 = 0; i1 = 1; sel = 1; #100;
        i0 = 0; i1 = 1; sel = 0; #100;
        i0 = 1; i1 = 1; sel = 0; #100;
        i0 = 0; i1 = 0; sel = 1; #100;
		
    end
endmodule