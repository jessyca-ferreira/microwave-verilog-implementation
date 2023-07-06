module control(
    input startn, stopn, clrn, porta_fechada, zero,
    output s, r
);

    assign s = (!startn & porta_fechada & !zero) ? 1 : 0;
    assign r = (!clrn || !stopn || !porta_fechada || zero) ? 1 : 0;
endmodule