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


wire[2:0] adrBuss;
wire[7:0] inputBuss;
wire[7:0] selectBuss;
wire[7:0] outputBuss0, outputBuss1, outputBuss2, outputBuss3,
          outputBuss4, outputBuss5, outputBuss6, outputBuss7;
		
assign adrBuss = {adr2,adr1,adr0};
assign inputBuss = {i7,i6,i5,i4,i3,i2,i1,i0};		  		  

Decoder decoder(
 .i_k_address(adrBuss),
 .valid(select),
 .o_select(selectBuss)
);

//ADD FSM here:




//END of FSM


MemCell Mem0 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[0]),
 .i_m_RW(op),
 .o_m_output(outputBuss0)
  );

MemCell Mem1 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[1]),
 .i_m_RW(op),
 .o_m_output(outputBuss1)
  ); 

MemCell Mem2 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[2]),
 .i_m_RW(op),
 .o_m_output(outputBuss2)
  ); 

MemCell Mem3 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[3]),
 .i_m_RW(op),
 .o_m_output(outputBuss3)
  ); 

MemCell Mem4 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[4]),
 .i_m_RW(op),
 .o_m_output(outputBuss4)
  ); 

MemCell Mem5 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[5]),
 .i_m_RW(op),
 .o_m_output(outputBuss5)
  ); 

MemCell Mem6 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[6]),
 .i_m_RW(op),
 .o_m_output(outputBuss6)
  ); 

MemCell Mem7 (
 .i_m_input(inputBuss),
 .i_m_sel(selectBuss[7]),
 .i_m_RW(op),
 .o_m_output(outputBuss7)
  ); 
  
assign o0 = outputBuss0[0]||outputBuss1[0]||outputBuss2[0]||outputBuss3[0]||outputBuss4[0]||outputBuss5[0]||outputBuss6[0]||outputBuss7[0];
assign o1 = outputBuss0[1]||outputBuss1[1]||outputBuss2[1]||outputBuss3[1]||outputBuss4[1]||outputBuss5[1]||outputBuss6[1]||outputBuss7[1];
assign o2 = outputBuss0[2]||outputBuss1[2]||outputBuss2[2]||outputBuss3[2]||outputBuss4[2]||outputBuss5[2]||outputBuss6[2]||outputBuss7[2];
assign o3 = outputBuss0[3]||outputBuss1[3]||outputBuss2[3]||outputBuss3[3]||outputBuss4[3]||outputBuss5[3]||outputBuss6[3]||outputBuss7[3];
assign o4 = outputBuss0[4]||outputBuss1[4]||outputBuss2[4]||outputBuss3[4]||outputBuss4[4]||outputBuss5[4]||outputBuss6[4]||outputBuss7[4];
assign o5 = outputBuss0[5]||outputBuss1[5]||outputBuss2[5]||outputBuss3[5]||outputBuss4[5]||outputBuss5[5]||outputBuss6[5]||outputBuss7[5];
assign o6 = outputBuss0[6]||outputBuss1[6]||outputBuss2[6]||outputBuss3[6]||outputBuss4[6]||outputBuss5[6]||outputBuss6[6]||outputBuss7[6];
assign o7 = outputBuss0[7]||outputBuss1[7]||outputBuss2[7]||outputBuss3[7]||outputBuss4[7]||outputBuss5[7]||outputBuss6[7]||outputBuss7[7];



endmodule
