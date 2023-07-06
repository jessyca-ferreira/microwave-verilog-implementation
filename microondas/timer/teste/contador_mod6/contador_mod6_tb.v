`timescale 10ns/1ps
`include "timer\HDL\terceiro_nivel\contador_mod6.v"

module contador_mod6_tb;
    reg [3:0] data;
    reg loadn, clrn, clk, en;
 
    wire tc, zero;
    wire [3:0] seg_dezenas;

    contador_mod6 dut (
        .data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), 
        .dezenas(seg_dezenas), .tc(tc), .zero(zero)
    );
  
  	always #100 clk = ~clk; // clk tem um período de 100ns

    initial begin
      $dumpfile("contador_mod6.vcd");
      $dumpvars(0, contador_mod6_tb);
		
      // teste 1: contagem normal, interrrompida por um clear    
      clk = 1; en = 0; loadn = 0; clrn = 1;

      data = 3'b101; #100; en = 1; loadn = 1; #1000;
      clrn = 0;
      #1000;

      // teste 2: a contagem não deve acontecer com o enable desligado
      clrn = 1; en = 0; loadn = 0; #100;
      data = 3'b100; #100; loadn = 1; #1000;

      // teste 3: verificando se tc e zero são ativados no momento correto
      clrn = 1; en = 0; loadn = 0; #100;
      data = 3'b101; #100; en = 1; loadn = 1; 
      #1000;

      $finish;
    end
endmodule