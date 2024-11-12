module FlipFlop (

//Inputs

input sel,
input inp,
input wr,

//OUPUTS

output outp
);

wire nottempoutp;
wire tempoutp;
wire tempinp1;
wire tempinp2;
wire notrw;

//inverter
not(notrw, wr);

//First layer of nand gates
nand(tempinp1, inp, sel, wr);
nand(tempinp2, tempinp1, sel, wr);

//second layer of nand gates
nand(tempoutp, tempinp1, nottempoutp);
nand(nottempoutp, tempinp2, tempoutp);

//Define output
and(outp,sel,notrw, tempoutp);


endmodule
