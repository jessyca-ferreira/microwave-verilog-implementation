module contador_mod10(
    input [3:0] data,
    input loadn, clrn, clk, en,
    output reg [3:0] unidades = 4'b0000,
    output tc, zero     // tc = terminal count; indica quando o contador está no seu valor minímo
); 

    assign zero = (unidades == 4'b0000);
    assign tc = zero & en;
 
    always @(posedge clk or negedge clrn) 
        if (!clrn) begin 
            unidades <= 4'b0000;
        end
        else if (en) begin
            if (unidades == 4'b0000) begin
                unidades <= 4'b1001;
            end 
            else begin
                unidades <= unidades - 1;
            end
        end
        else if (!loadn) begin
            unidades <= data;
        end

endmodule


