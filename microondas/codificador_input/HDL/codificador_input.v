`include "codificador_input\HDL\terceiro_nivel\clk_freq.v"
`include "codificador_input\HDL\terceiro_nivel\codificador.v"
`include "codificador_input\HDL\terceiro_nivel\debouncer.v"
`include "codificador_input\HDL\terceiro_nivel\mux.v"


module codificador_input(
    input [9:0] teclado,
    input clk100Hz, enablen,
    output [3:0] out_codificado,
    output loadn, pgt_1Hz
);

    wire i0, i1;


    codificador p_encoder (
        .teclado(teclado), .enablen(enablen), .BCD(out_codificado), .valido(loadn)
    );

    debouncer delay (
        .clr(loadn), .clk(clk100Hz), .delayed_output(i1)
    );

    clk_freq clk_conversao (
        .clk_in(clk100Hz), .clk_out(i0)
    );


    mux select (
        .sel(enablen), .i0(i0), .i1(i1), .out(pgt_1Hz)
    );
endmodule