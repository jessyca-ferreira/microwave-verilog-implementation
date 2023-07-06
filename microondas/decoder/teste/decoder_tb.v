`timescale 1ns/1ps
`include "decoder\HDL\decoder.v"

module decoder_tb;
    reg [3:0] sec_unidades;
    reg [3:0] sec_dezenas;
    reg [3:0] minutos;

    wire [6:0] seg_unidades;
    wire [6:0] seg_dezenas;
    wire [6:0] seg_minutos;
 
    integer i;
    decoder dut (
        .sec_unidades(sec_unidades), .sec_dezenas(sec_dezenas), .minutos(minutos),
        .seg_unidades(seg_unidades), .seg_dezenas(seg_dezenas), .seg_minutos(seg_minutos)
    );

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0, decoder_tb);

        sec_unidades = 4'b0101;
        sec_dezenas = 4'b1001;
        minutos = 4'b0010;
        #100;

        sec_unidades = 4'b1000;
        sec_dezenas = 4'b0001;
        minutos = 4'b0000;
        #100;

        sec_unidades = 4'b0011;
        sec_dezenas = 4'b0100;
        minutos = 4'b0110;
        #100;

        minutos = 4'b0111;
        #100;

        $finish;
    end
endmodule