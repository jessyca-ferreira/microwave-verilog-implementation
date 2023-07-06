`include "codificador_input\HDL\codificador_input.v"
`include "decoder\HDL\decoder.v"
`include "magnetron\HDL\magnetron.v"
`include "timer\HDL\timer.v"

module microondas(
    input [9:0] teclado,
    input startn, stopn, clrn, porta_fechada, clk100Hz,
    output [6:0] s_unidades,
    output [6:0] s_dezenas,
    output [6:0] s_minutos,
    output ligar);

    wire [3:0] D;
    wire pgt_1Hz;
    wire loadn;

    wire [3:0] unidades;
    wire [3:0] dezenas;
    wire [3:0] mins;

    wire timer_done;

    codificador_input digitar_tempo (
        .teclado(teclado), .clk100Hz(clk100Hz), .enablen(!ligar),
        .out_codificado(D), .loadn(loadn), .pgt_1Hz(pgt_1Hz)
    );

    timer relogio (
        .data(D), .loadn(loadn), .clrn(clrn), .clk(pgt_1Hz), .en(ligar),
        .seg_unidades(unidades), .seg_dezenas(dezenas), .minutos(mins), .zero(timer_done)
    );

    magnetron ligar_mag (
        .startn(startn), .stopn(stopn), .clrn(clrn), .porta_fechada(porta_fechada), .zero(timer_done),
        .ligar(ligar)
    );

    decoder setesegmentos (
        .sec_unidades(unidades), .sec_dezenas(dezenas), .minutos(mins),
        .seg_unidades(s_unidades), .seg_dezenas(s_dezenas), .seg_minutos(s_minutos)
    );

endmodule