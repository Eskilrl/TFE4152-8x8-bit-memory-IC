module Dff (
  input i_D,
  input i_clk,
  output o_Q,
);

wire Q;
wire Q_neg;
wire clk_inv;

not(clk_inv, i_clk);

nand();

  
endmodule
