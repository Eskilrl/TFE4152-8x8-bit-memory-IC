module Dff (
  input D,
  input clk,
  output wire Q
);

wire masterQ, clk_n;

not(clk_n,clk);

Dlatch master(
  .D(D),
  .enable(clk_n),
  .Q(masterQ)
);

Dlatch slave(
  .D(masterQ),
  .enable(clk),
  .Q(Q)
);

endmodule
