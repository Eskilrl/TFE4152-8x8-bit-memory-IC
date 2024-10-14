`import "../MemCell/MemCell.sv"
`import "../Decoder/Decoder.sv"

module MemoryModule (

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


assign adrBuss = {adr2,adr1,adr0};
assign inputBuss = {i7,i6,i5,i4,i3,i2,i1,i0};
wire[7:0] selectBuss;
wire[7:0] outputBuss0, outputBuss1, outputBuss2, outputBuss3,
          outputBuss4, outputBuss5, outputBuss6, outputBuss7;


Decoder decoder(
 .i_k_address(adrBuss),
 .i_k_valid(select),
 .o_select(selectBuss)
);


MemCell Mem0 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[0]),
 .i_m_RW(op)
 .o_m_output(outputBuss0)
  );

MemCell Mem1 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[1]),
 .i_m_RW(op)
 .o_m_output(outputBuss1)
  ); 

MemCell Mem2 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[2]),
 .i_m_RW(op)
 .o_m_output(outputBuss2)
  ); 

MemCell Mem3 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[3]),
 .i_m_RW(op)
 .o_m_output(outputBuss3)
  ); 

MemCell Mem4 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[4]),
 .i_m_RW(op)
 .o_m_output(outputBuss4)
  ); 

MemCell Mem5 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[5]),
 .i_m_RW(op)
 .o_m_output(outputBuss5)
  ); 

MemCell Mem6 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[6]),
 .i_m_RW(op)
 .o_m_output(outputBuss6)
  ); 

MemCell Mem7 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[7]),
 .i_m_RW(op)
 .o_m_output(outputBuss7)
  ); 
  
assign o0 = outputBuss0[0]||outputBuss1[0]||outputBuss2[0]||outputBuss3[0]||outputBuss4[0]||outputBuss5[0]||outputBuss6[0]||outputBuss7[0];

endmodule
