module codificador(
    input [9:0] teclado,
    input enablen,
    output reg [3:0] BCD, 
    output reg valido);

always @(teclado)
    if (!enablen) begin
        BCD = 4'b0000;
        valido = 0;
    end else begin
        case (teclado)
            10'b1000000000 : begin BCD = 4'b1001; valido = 0; end
            10'b0100000000 : begin BCD = 4'b1000; valido = 0; end
            10'b0010000000 : begin BCD = 4'b0111; valido = 0; end
            10'b0001000000 : begin BCD = 4'b0110; valido = 0; end
            10'b0000100000 : begin BCD = 4'b0101; valido = 0; end
            10'b0000010000 : begin BCD = 4'b0100; valido = 0; end
            10'b0000001000 : begin BCD = 4'b0011; valido = 0; end
            10'b0000000100 : begin BCD = 4'b0010; valido = 0; end
            10'b0000000010 : begin BCD = 4'b0001; valido = 0; end
            10'b0000000001 : begin BCD = 4'b0000; valido = 0; end
            default: begin BCD = 4'b0000; valido = 1; end
        endcase
    end
endmodule
