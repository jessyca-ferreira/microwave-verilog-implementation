`timescale 1ns/1ps
`include "codificador_input\HDL\codificador_input.v"

module codificador_input_tb;
    reg [9:0] teclado;
    reg clk100Hz, enablen;

    wire [3:0] out_codificado;
    wire loadn, pgt_1Hz;

    codificador_input dut(
        .teclado(teclado), .clk100Hz(clk100Hz), .enablen(enablen),
        .out_codificado(out_codificado), .loadn(loadn), .pgt_1Hz(pgt_1Hz)
    );

  	always #10 clk100Hz = ~clk100Hz; // clk tem um período de 10ns

    initial begin
        $dumpfile("codificador_input.vcd");
        $dumpvars(0, codificador_input_tb);
		
        clk100Hz = 1;  enablen = 1;

        teclado = 10'b1000000000; #200;
        teclado = 10'b0100000000; #200;
        teclado = 10'b0010000000; #200;
        teclado = 10'b0001000000; #200;
        teclado = 10'b0000100000; #200;
        teclado = 10'b0000010000; #200;
        teclado = 10'b0000001000; #200;
        teclado = 10'b0000000100; #200;
        teclado = 10'b0000000010; #200;
        teclado = 10'b0000000001; #200;
        teclado = 10'b0000000000; #200;

        $finish;
    end
endmodule