module debouncer(
    input clr, clk,
    output delayed_output = 0
);

    reg [2:0] contador = 3'b000;

    always @(posedge clr)
        begin
            delayed_output <= 0;
            contador = 3'b000;
        end

    always @(posedge clk)
        begin
            if (contador < 3'b111 & (!clr)) begin
                contador = contador + 1;
            end

            if (contador >= 3'b100) begin
                delayed_output <= 1;
            end
        end
endmodule
        

