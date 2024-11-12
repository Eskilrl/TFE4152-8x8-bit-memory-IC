module BitCell (

//Inputs

input i_sel,
input i_inp,
input i_wr,

//OUPUTS

output o_outp
);

wire w_NOR_out_1;
wire w_NOR_out_2;
wire w_NOR_inn_1;
wire w_NOR_inn_2;

and()
nand()
not()
assign w_NOR_inn_1 = i_inp&&i_sel&&i_wr;
assign w_NOR_inn_2 = !i_inp&&i_sel&&i_wr;

assign w_NOR_out_1 = !(w_NOR_inn_1||w_NOR_out_2);
assign w_NOR_out_2 = !(w_NOR_inn_2||w_NOR_out_1);

assign o_outp = !i_wr&&i_sel&&w_NOR_out_2;

endmodule
