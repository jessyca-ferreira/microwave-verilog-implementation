`timescale 1ns/1ps
`include "magnetron\HDL\terceiro_nivel\control.v"

module control_tb;
    reg startn, clrn, porta_fechada, zero, stopn;
    wire s, r;

    control dut (
      .startn(startn), .stopn(stopn), .clrn(clrn), .porta_fechada(porta_fechada), .zero(zero),
      .s(s), .r(r)
    );

    initial begin
        $dumpfile("control.vcd");
        $dumpvars(0, control_tb);
	
        startn = 1; clrn = 0; porta_fechada = 1; zero = 0; stopn = 1;
        #100;
        startn = 0; clrn = 1; porta_fechada = 0; zero = 0; stopn = 1;
        #100;
        startn = 1; clrn = 0; porta_fechada = 0; zero = 0; stopn = 1;
        #100;
        startn = 1; clrn = 0; porta_fechada = 0; zero = 1; stopn = 1;
        #100;
        startn = 0; clrn = 1; porta_fechada = 1; zero = 0; stopn = 1;
        #100;
        

    end
endmodule