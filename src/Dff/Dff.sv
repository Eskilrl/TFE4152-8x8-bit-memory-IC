module Dff (
  input i_D,
  input i_clk,
  output wire o_Q
);

wire w_Q;
wire w_Q_not;
wire w_clk_inv;
wire w_enable;
wire w_D_not;
wire w_S;
wire w_R;

not(w_Q_not, w_Q);
not(w_D_not, i_D);
not(clk_inv, i_clk);
and(w_enable, i_clk, w_clk_inv);

nand(w_S, i_D, w_enable);
nand(w_R, w_D_not, w_enable);

nand(o_Q, w_D_not, w_S);
nand(w_Q_not, o_Q, w_R);


  
endmodule
