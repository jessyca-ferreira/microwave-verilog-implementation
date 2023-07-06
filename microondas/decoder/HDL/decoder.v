module decoder (
    input [3:0] sec_unidades,
    input [3:0] sec_dezenas,
    input [3:0] minutos,
    output reg [6:0] seg_unidades,
    output reg [6:0] seg_dezenas,
    output reg [6:0] seg_minutos
);

    reg [6:0] segmentos [9:0];

    initial begin
        segmentos[0] = 7'b1111110;
        segmentos[1] = 7'b0110000;
        segmentos[2] = 7'b1101101;
        segmentos[3] = 7'b1111001;
        segmentos[4] = 7'b0110011;
        segmentos[5] = 7'b1011011;
        segmentos[6] = 7'b1011111;
        segmentos[7] = 7'b1110000;
        segmentos[8] = 7'b1111111;
        segmentos[9] = 7'b1111011;
    end

    always @(*) begin
        seg_unidades = segmentos[sec_unidades];
        seg_dezenas = segmentos[sec_dezenas];
        seg_minutos = segmentos[minutos]; 
    end

endmodule