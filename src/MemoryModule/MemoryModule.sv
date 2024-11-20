`import "../MemCell/MemCell.sv"
`import "../Decoder/Decoder.sv"

module MemoryModule (

//Input Clock
  input i_clk,

//inputs
  input i0,
  input i1,
  input i2,
  input i3,
  input i4,
  input i5,
  input i6,
  input i7,

//Adress select
  input adr0,
  input adr1,
  input adr2,

//controll signals
  input op,
  input select,

//Outputs
  output o0,
  output o1,
  output o2,
  output o3,
  output o4,
  output o5,
  output o6,
  output o7,
);


wire[2:0] adrBuss;
wire[7:0] inputBuss;
wire[7:0] selectBuss;
wire[7:0] outputBuss0, outputBuss1, outputBuss2, outputBuss3,
          outputBuss4, outputBuss5, outputBuss6, outputBuss7;
wire o0Im1, o0Im2, o1Im1, o1Im2, o2Im1, o2Im2, o3Im1, o3Im2, o4Im1, o4Im2, o5Im1, o5Im2, o6Im1, o6Im2, o7Im1, o7Im2;


wire valid;
wire rw;
	
buf(adrBuss[2],adr2);
buf(adrBuss[1],adr1);
buf(adrBuss[0],adr0);

buf(inputBuss[7],i7);
buf(inputBuss[6],i6);
buf(inputBuss[5],i5);
buf(inputBuss[4],i4);
buf(inputBuss[3],i3);
buf(inputBuss[2],i2);
buf(inputBuss[1],i1);
buf(inputBuss[0],i0);

Decoder decoder(
 .i_k_address(adrBuss),
 .valid(valid),
 .o_select(selectBuss)
);

FSM FSM(
 .FSM_op(op),
 .FSM_select(select),
 .i_clk(i_clk),
 .FSM_valid(valid),
 .FSM_rw(rw)
);


MemCell Mem0 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[0]),
 .i_m_RW(rw),
 .o_m_output(outputBuss0)
  );

MemCell Mem1 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[1]),
 .i_m_RW(rw),
 .o_m_output(outputBuss1)
  ); 

MemCell Mem2 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[2]),
 .i_m_RW(rw),
 .o_m_output(outputBuss2)
  ); 

MemCell Mem3 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[3]),
 .i_m_RW(rw),
 .o_m_output(outputBuss3)
  ); 

MemCell Mem4 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[4]),
 .i_m_RW(rw),
 .o_m_output(outputBuss4)
  ); 

MemCell Mem5 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[5]),
 .i_m_RW(rw),
 .o_m_output(outputBuss5)
  ); 

MemCell Mem6 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[6]),
 .i_m_RW(rw),
 .o_m_output(outputBuss6)
  ); 

MemCell Mem7 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[7]),
 .i_m_RW(rw),
 .o_m_output(outputBuss7)
  ); 

//OR all inmtermidiates

or(o0Im1,outputBuss0[0],outputBuss1[0],outputBuss2[0],outputBuss3[0]);
or(o0Im2,outputBuss4[0],outputBuss5[0],outputBuss6[0],outputBuss7[0]);
or(o1Im1,outputBuss0[1],outputBuss1[1],outputBuss2[1],outputBuss3[1]);
or(o1Im2,outputBuss4[1],outputBuss5[1],outputBuss6[1],outputBuss7[1]);
or(o2Im1,outputBuss0[2],outputBuss1[2],outputBuss2[2],outputBuss3[2]);
or(o2Im2,outputBuss4[2],outputBuss5[2],outputBuss6[2],outputBuss7[2]);
or(o3Im1,outputBuss0[3],outputBuss1[3],outputBuss2[3],outputBuss3[3]);
or(o3Im2,outputBuss4[3],outputBuss5[3],outputBuss6[3],outputBuss7[3]);
or(o4Im1,outputBuss0[4],outputBuss1[4],outputBuss2[4],outputBuss3[4]);
or(o4Im2,outputBuss4[4],outputBuss5[4],outputBuss6[4],outputBuss7[4]);
or(o5Im1,outputBuss0[5],outputBuss1[5],outputBuss2[5],outputBuss3[5]);
or(o5Im2,outputBuss4[5],outputBuss5[5],outputBuss6[5],outputBuss7[6]);
or(o6Im1,outputBuss0[6],outputBuss1[6],outputBuss2[6],outputBuss3[6]);
or(o6Im2,outputBuss4[6],outputBuss5[6],outputBuss6[6],outputBuss7[6]);
or(o7Im1,outputBuss0[7],outputBuss1[7],outputBuss2[7],outputBuss3[7]);
or(o7Im2,outputBuss4[7],outputBuss5[7],outputBuss6[7],outputBuss7[7]);

//OR for final outputs

or(o0, o0Im1,o0Im2);
or(o1, o1Im1,o1Im2);
or(o2, o2Im1,o2Im2);
or(o3, o3Im1,o3Im2);
or(o4, o4Im1,o4Im2);
or(o5, o5Im1,o5Im2);
or(o6, o6Im1,o6Im2);
or(o7, o7Im1,o7Im2);

endmodule
