module latch (
    input s, r,
    output reg out
);

  always @(*) begin
    if (s & !r) begin
        out <= 1;
    end else if (!s & r) begin
        out <= 0;
    end
  end
endmodule