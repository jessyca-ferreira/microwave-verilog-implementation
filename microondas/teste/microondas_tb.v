`timescale 1ns/1ps
`include "microondas.v"

module microondas_tb;
    reg [9:0] teclado;
    reg startn, stopn, clrn, porta_fechada, clk100Hz;
    wire [6:0] s_unidades;
    wire [6:0] s_dezenas;
    wire [6:0] s_minutos;
    wire ligar;

    microondas dut (
      .teclado(teclado), .stopn(stopn), .startn(startn), .clrn(clrn), .porta_fechada(porta_fechada), .clk100Hz(clk100Hz),
      .s_unidades(s_unidades), .s_dezenas(s_dezenas), .s_minutos(s_minutos), .ligar(ligar)
    );
  
  	always  #1  clk100Hz = ~clk100Hz;

    initial begin
      $dumpfile("microondas.vcd");
      $dumpvars(0, microondas_tb);

      /* TESTE 1 */
      // inicialmente nenhum digito foi inserido, start não foi pressionado e a porta do microondas está fechada.
      clk100Hz = 1; teclado = 9'b000000000; porta_fechada = 1; stopn = 1; startn = 1; clrn = 1;
      // abrimos a porta
      porta_fechada = 0; #100;
      // fechamos a porta
      porta_fechada = 1; #100;
      // inserimos o valor 0:14 no microondas; teclado = 9'b000000000 representa que nenhuma tecla está sendo pressionada;
      teclado = 9'b000000010; #100;
      teclado = 9'b000000000; #100;
      teclado = 9'b000010000; #100;
      teclado = 9'b000000000; #100;
      // apertamos start
      startn = 0; #100;
      // esperamos o tempo passar
      #10000;


      /* TESTE 2 */
      // inicialmente nenhum digito foi inserido, start não foi pressionado e a porta do microondas está fechada.
      teclado = 9'b000000000; stopn = 1; startn = 1; clrn = 1;
      // inserimos o valor 1:55 no microondas; teclado = 9'b000000000 representa que nenhuma tecla está sendo pressionada;
      teclado = 9'b000000010; #100;
      teclado = 9'b000000000; #100;
      teclado = 9'b000100000; #100;
      teclado = 9'b000000000; #100;
      teclado = 9'b000100000; #100;
      teclado = 9'b000000000; #100;
      // apertamos start
      startn = 0; #100;
      // esperamos algum tempo;
      #10000;
      //apertamos clr
      clrn = 0; #150;



      /* Teste 3 */
      // inicialmente nenhum digito foi inserido, start não foi pressionado e a porta do microondas está fechada.
      teclado = 9'b000000000; stopn = 1; startn = 1; clrn = 1; porta_fechada = 1;
      // inserimos o valor 2:54 no microondas; teclado = 9'b000000000 representa que nenhuma tecla está sendo pressionada;
      teclado = 9'b000000100; #100;
      teclado = 9'b000000000; #100;
      teclado = 9'b000100000; #100;
      teclado = 9'b000000000; #100;
      teclado = 9'b000010000; #100;
      teclado = 9'b000000000; #100;
      // apertamos start
      startn = 0; #100;
      // esperamos algum tempo
      #1500;
      // abrimos a porta
      porta_fechada = 0; #1000;



      $finish;
    end
endmodule