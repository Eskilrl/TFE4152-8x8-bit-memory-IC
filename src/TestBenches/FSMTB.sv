`timescale 1ns/1ps

module FSMTB;

reg op;
reg select;
reg clk = 0;

wire valid;
wire rw;

FSM uut(
    .op(op),
    .select(select),
    .i_clk(clk),
    .valid(valid),
    .rw(rw)
);

always begin
    #5;
    clk = ~clk;
end

initial begin

#7;
op=0;
select=0;
#10;

    $finish;
end

endmodule