`include "timer\HDL\terceiro_nivel\contador_mod6.v"
`include "timer\HDL\terceiro_nivel\contador_mod10.v"

module timer(
    input [3:0] data,
    input loadn, clrn, clk, en,
    output [3:0] seg_unidades,
    output [3:0] seg_dezenas,
    output [3:0] minutos,
    output zero
);

    wire tc_unidades, tc_dezenas, tc_minutos;
    wire zero_unidades, zero_dezenas, zero_minutos;

    contador_mod10 s_unidades (
        .data(data), .loadn(loadn), .clrn(clrn), .clk(clk), .en(en), .unidades(seg_unidades),
        .tc(tc_unidades), .zero(zero_unidades)
    );
    contador_mod6 s_dezenas (
        .data(seg_unidades), .loadn(loadn), .clrn(clrn), .clk(clk), .en(tc_unidades), .dezenas(seg_dezenas),
        .tc(tc_dezenas), .zero(zero_dezenas)
    );
    contador_mod10 mins (.data(seg_dezenas), .loadn(loadn), .clrn(clrn), .clk(clk), .en(tc_dezenas), .unidades(minutos), 
    .tc(tc_minutos), .zero(zero_minutos));

    assign zero = (zero_unidades & zero_dezenas & zero_minutos) ? 1 : 0;
endmodule

