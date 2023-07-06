module clk_freq(input clk_in, output reg clk_out = 0);
  reg [6:0] contador = 0;

  always @(posedge clk_in) begin
    if (contador == 99) begin
      contador <= 0; 
      clk_out <= ~clk_out; 
    end else begin
      contador <= contador + 1;
    end
  end

endmodule
    