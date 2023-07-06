`timescale 1ns/1ps
`include "timer\HDL\terceiro_nivel\contador_mod10.v"

module contador_mod10_tb;
    reg [3:0] data;
    reg loadn, clrn, clk, en;
 
    wire tc, zero;
    wire [3:0] unidades;

    contador_mod10 dut (
        .data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), 
        .unidades(unidades), .tc(tc), .zero(zero)
    );
  
  	always #100 clk = ~clk; // clk tem um período de 100ns

    initial begin
      $dumpfile("contador_mod10.vcd");
      $dumpvars(0, contador_mod10_tb);
		
      // teste 1: contagem normal, interrrompida por um clear    
      clk = 1; en = 0; loadn = 0; clrn = 1;

      data = 4'b1001; #100; en = 1; loadn = 1; #1000;
      clrn = 0;
      #1000;

      // teste 2: a contagem não deve acontecer com o enable desligado
      clrn = 1; en = 0; loadn = 0; #100;
      data = 4'b0100; #100; loadn = 1; #1000;

      // teste 3: verificando se tc e zero são ativados no momento correto
      clrn = 1; en = 0; loadn = 0; #100;
      data = 4'b1001; #100; en = 1; loadn = 1; 
      #2000;

      $finish;
    end
endmodule