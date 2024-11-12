module FSM (

    //Inputs
    input op,
    input select,
    input i_clk,
    //outputs
    output valid,
    output rw
);

wire X0;
wire X1;

//Logic wires

wire N0;
wire N1;
wire X0_and_X1;
wire op_and_select;
wire not_X0_and_X1;

//next state logic here:

and(X0_and_X1,X0,X1);
and(op_and_select,op,select);

not(not_X0_and_X1,X0_and_X1);

and(N0,select,not_X0_and_X1);
or(N1,X0_and_X1,op_and_select);

buf(valid,X0);
buf(rw,X1);

//Flip flops to store current,
Dff dff_inst_0(
  .i_D(N0),
  .i_clk(i_clk),
  .o_Q(X0)
);

Dff dff_inst_1(
  .i_D(N1),
  .i_clk(i_clk),
  .o_Q(X1)
);


endmodule
