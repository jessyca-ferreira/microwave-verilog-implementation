`timescale 1ns/1ps
`include "codificador_input\HDL\terceiro_nivel\clk_freq.v"

module clk_freq_tb;
    reg clk_in; wire clk_out;
    integer  i;

    clk_freq dut (
        .clk_in(clk_in), .clk_out(clk_out)
    );

    initial begin
        $dumpfile("clk_freq.vcd");
        $dumpvars(0, clk_freq_tb);

        /* como o objetivo é diminuir a frequência do relógio de 100Hz para 1 Hz, o esperado é que
        o relógio pulse 3 vezes e não 300 */

        clk_in = 0;
        for (i = 0; i < 600; i = i + 1) begin
          #10 clk_in = ~clk_in;
        end

      	$finish;
    end
endmodule