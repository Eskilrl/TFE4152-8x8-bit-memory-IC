module FlipFlop (

//Inputs

input i_sel,
input i_inp,
input i_wr,

//OUPUTS

output o_outp
);

wire w_NAND_out_1;
wire w_NAND_out_2;
wire w_NAND_out_3;
wire w_NAND_out_4;
wire w_not_rw;

//inverter
NOT(w_not_rw, i_wr);

//First layer of nand gates
NAND(w_NAND_out_3, i_inp, i_sel, i_wr);
NAND(w_NAND_out_4, w_NAND_out_3, i_sel, i_wr);

//second layer of nand gates
NAND(w_NAND_out_2, w_NAND_out_3, w_NAND_out_1);
NAND(w_NAND_out_1, w_NAND_out_4, w_NAND_out_2);

//Define output
AND(o_outp,i_sel,w_not_rw, w_NAND_out_2);


endmodule
