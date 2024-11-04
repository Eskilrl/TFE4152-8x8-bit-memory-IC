module FSM (

    //Inputs
    input i_op,
    input i_select,
    input i_clk,
    //outputs
    output o_valid,
    output o_rw
);

parameter Write = 2'b11;
parameter Stable = 2'b01;
parameter Read = 2'b10;
parameter Idle = 2'b00;

wire X0;
wire X1;

wire N_0;
wire N_1;

Dff dff_inst_0(
  .i_D(N_0),
  .i_clk(i_clk),
  .o_Q(X0)
);

Dff dff_inst_1(
  .i_D(N_1),
  .i_clk(i_clk),
  .o_Q(X1)
);

//implement logic here:

 buf(N_0,i_select)


endmodule
