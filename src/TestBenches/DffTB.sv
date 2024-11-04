`timescale 1ns/1ps

module DffTB;

reg D;
reg clk;
wire Q;

Dff dff(
    .i_D(D),
    .i_clk(clk),
    .o_Q(Q)
);

initial begin
    #10;
    clk=0;
    D=0;
    #5;
    D=1;
    #5;
    clk=1;
    #5;
    D=1;

    $finish;
end

endmodule