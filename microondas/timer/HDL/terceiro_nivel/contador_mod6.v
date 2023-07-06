module contador_mod6(
    input [3:0] data,
    input loadn, clrn, clk, en,
    output reg [3:0] dezenas = 3'b000,
    output tc, zero     // tc = terminal count; indica quando o contador está no seu valor minímo
);

    assign zero = (dezenas == 3'b000);
    assign tc = zero & en;

    
    always @(posedge clk or negedge clrn) 
        if (!clrn) begin 
            dezenas <= 3'b000;
        end
  		else if (en) begin
            if (dezenas == 3'b000) begin
                dezenas <= 3'b101;
            end 
            else begin
                dezenas <= dezenas - 1;
            end
        end
        else if (!loadn) begin
            dezenas <= data;
        end

endmodule


