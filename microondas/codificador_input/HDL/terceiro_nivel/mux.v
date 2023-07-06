module mux(
    input sel, i0, i1,
    output reg out
);

    always @(sel, i0, i1)
        begin
            case(sel)
                0: out <= i0;
                1: out <= i1;
            endcase
        end
endmodule