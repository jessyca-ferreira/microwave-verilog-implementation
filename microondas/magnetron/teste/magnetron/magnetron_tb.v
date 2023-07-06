`timescale 1ns/1ps
`include "magnetron\HDL\magnetron.v"

module magnetron_tb;
    reg startn, stopn, clrn, porta_fechada, zero;
    wire ligar;

  magnetron dut (
    .startn(startn), .stopn(stopn), .clrn(clrn), .porta_fechada(porta_fechada), .zero(zero),
    .ligar(ligar)
  );

    initial begin
        $dumpfile("magnetron.vcd");
        $dumpvars(0, magnetron_tb);

        startn = 1; clrn = 1; stopn = 1; porta_fechada = 1; zero = 0;
        #50;
        startn = 0; clrn = 1; stopn = 1; porta_fechada = 1; zero = 0;
        #50;
        startn = 1; clrn = 1; stopn = 1; porta_fechada = 0; zero = 0;
        #50;
        startn = 1; clrn = 1; stopn = 1; porta_fechada = 1; zero = 1;
        #50;
        startn = 0; clrn = 0; stopn = 1; porta_fechada = 1; zero = 0;
        #50;
        startn = 1; clrn = 1; stopn = 1; porta_fechada = 0; zero = 0;
        #50;
        startn = 0; clrn = 1; stopn = 0; porta_fechada = 0; zero = 0;
        #50;

    end
endmodule