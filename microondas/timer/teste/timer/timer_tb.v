`timescale 1ns/1ps
`include "timer\HDL\timer.v"

module timer_tb;
    reg [3:0] data;
    reg loadn, clrn, clk, en;

    wire [3:0] seg_unidades;
    wire [3:0] seg_dezenas;
    wire [3:0] minutos;
    wire zero;

    integer i;

    timer dut (
        .data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), 
        .seg_unidades(seg_unidades), .seg_dezenas(seg_dezenas), .minutos(minutos), .zero(zero)
    );

    initial begin
      $dumpfile("timer.vcd");
      $dumpvars(0, timer_tb);
		
      en = 0;

      /* testando a habilidade do timer de carregar digítos quando enable = 0
      e de ignorar os zeros à esquerda */
      data = 4'b0001; loadn = 0; clk = 1;
      #50;
      loadn = 1; clk = 0;
      #50;
      data = 4'b0010; loadn = 0; clk = 1;
      #50;
      loadn = 1; clk = 0;
      #50;
      data = 4'b1001; loadn = 0; clk = 1;
      #50;
      loadn = 1; clk = 0;
      #100;

      en = 1;
      // testando a contagem do timer com enable = 1
      repeat(100)
        #10 clk = ~clk;
    end
endmodule