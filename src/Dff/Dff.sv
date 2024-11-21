module Dff (
  input D,
  input clk,
  output wire Q
);

//Clock inverter
wire masterQ, clk_n;
not(clk_n,clk);

//Instantiate Master D-latch
Dlatch master(
  .D(D),
  .enable(clk_n),
  .Q(masterQ)
);

//Instantiate Slave D-latch
Dlatch slave(
  .D(masterQ),
  .enable(clk),
  .Q(Q)
);

endmodule
