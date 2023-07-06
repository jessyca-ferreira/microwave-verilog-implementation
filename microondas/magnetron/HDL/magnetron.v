`include "magnetron\HDL\terceiro_nivel\control.v"
`include "magnetron\HDL\terceiro_nivel\latch.v"

module magnetron(
    input startn, stopn, clrn, porta_fechada, zero,
    output ligar
);

    wire s, r;

    control sr (.startn(startn), .stopn(stopn), .clrn(clrn), .porta_fechada(porta_fechada), 
                .zero(zero), .s(s), .r(r)
    );
    latch latchsr (s, r, ligar);


endmodule