`timescale 1ns/1ps
`include "codificador_input\HDL\terceiro_nivel\debouncer.v"

module debouncer_tb;
    reg clr, clk;
 
    wire out;

    debouncer dut(
        .clr(clr), .clk(clk),
        .delayed_output(out)
    );

  	always #100 clk = ~clk;

    initial begin
        $dumpfile("debouncer.vcd");
        $dumpvars(0, debouncer_tb);
		
        clk = 1; clr = 0;
        #1500;
        clr = 0; #500;
        clr = 1; #500;
        clr = 0; #500;
        clr = 1; #500;
        clr = 1; #500;
        clr = 0; #500;
        clr = 0; #500;
        clr = 1; #500;
        $finish;
    end
endmodule