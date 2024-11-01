module FSM (

    //Inputs
    input FSM_op,
    input FSM_select,
    input i_clk,
    //outputs
    output FSM_valid,
    output FSM_rw
);

parameter Write = 2'b11;
parameter Stable = 2'b01;
parameter Read = 2'b10;
parameter Idle = 2'b00;

wire X0;
wire X1;


Dff dff_inst_0(
  .i_D(),
  .i_clk(i_clk),
  .o_Q(X0)
);

Dff dff_inst_1(
  .i_D(),
  .i_clk(i_clk),
  .o_Q(X1)
);

//implement logic here:

 


endmodule
