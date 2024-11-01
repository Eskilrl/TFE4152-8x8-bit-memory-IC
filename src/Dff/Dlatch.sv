module Dlatch (
    input wire D,
    input wire enable,
    output wire Q
);
    
wire Qn;
wire w_enable;
wire w_D_not;
wire w_S;
wire w_R;

not(w_Q_not, w_Q);
not(w_D_not, D);

nand(w_S, D, enable);
nand(w_R, w_D_not, enable);

nand(Q, w_S, Qn);
nand(Qn,w_R, Q);

endmodule