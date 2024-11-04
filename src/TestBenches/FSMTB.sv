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
op=0;
select=0;

#7;	 
#10;
//idle
op=0;
select=0;
#10;  
//write
op=1;
select=1;
#10;  
//try to write
op=1;
select=1;
#10;  
//write
op=1;
select=1;
#10;  

op=0;
select=0;
#10;  
//read
op=0;
select=1;
#10;
//read
op=0;
select=1;
#10;
//Idle
op=0;
select=0;
#10;
//read
op=0;
select=1;
#10;
//Write
op=1;
select=1;
#10;
//stable
op=0;
select=1;
#10;
//Idle
op=1;
select=0;
#10;
    $finish;
end

endmodule