module FSM (

    //Inputs
    input FSM_op,
    input FSM_select,

    //outputs
    output FSM_valid,
    output FSM_rw
);

parameter Write = 2'b11;
parameter Stable = 2'b01;
parameter Read = 2'b10;
parameter Idle = 2'b00;


    
endmodule