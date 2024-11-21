module FSM (

    //Inputs
    input op,
    input select,
    input i_clk,
    //outputs
    output valid,
    output rw
);

//Output buffer
wire w_valid;
wire w_rw;

//Logic wires
wire next_valid;
wire next_rw;
wire nand_valid_rw;
wire op_and_select;
wire valid_and_rw;

//next state logic
nand(nand_valid_rw,w_valid,w_rw);
and(op_and_select,op,select);
not(valid_and_rw,nand_valid_rw);

and(next_valid,select,nand_valid_rw);
or(next_rw,valid_and_rw,op_and_select);

buf(valid,w_valid);
buf(rw,w_rw);

//Flip flops to store current,
Dff dff_inst_0(
  .i_D(next_valid),
  .i_clk(i_clk),
  .o_Q(w_valid)
);

Dff dff_inst_1(
  .i_D(next_rw),
  .i_clk(i_clk),
  .o_Q(w_rw)
);


endmodule
