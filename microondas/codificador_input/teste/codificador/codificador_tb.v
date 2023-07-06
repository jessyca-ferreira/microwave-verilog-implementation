`timescale 1ns/1ps
`include "codificador_input\HDL\terceiro_nivel\codificador.v"

module codificador_tb;
    reg [9:0] teclado;
    reg enablen;
 
    wire [3:0] BCD;
    wire valido;

    codificador dut (
        .teclado(teclado), .enablen(enablen),
        .BCD(BCD), .valido(valido)
    );

    initial begin
        $dumpfile("codificador.vcd");
        $dumpvars(0, codificador_tb);

        enablen = 1;

        teclado = 10'b1000000000; #100;
        teclado = 10'b0100000000; #100;
        teclado = 10'b0010000000; #100;
        teclado = 10'b0001000000; #100;
        teclado = 10'b0000100000; #100;
        teclado = 10'b0000010000; #100;
        teclado = 10'b0000001000; #100;
        teclado = 10'b0000000100; #100;
        teclado = 10'b0000000010; #100;
        teclado = 10'b0000000001; #100;

    end
endmodule