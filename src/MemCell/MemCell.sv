`import "../FlipFlop/FlipFlop.sv"

module MemCell (
 input[7:0] i_m_input,
 input i_m_sel,
 input i_m_RW,

 output[7:0] o_m_output
);
 
//Instantiate bitcells
BitCell BC_0(
 .sel(i_m_sel),
 .inp(i_m_input[0]),
 .wr(i_m_RW),
 .outp(o_m_output[0])
  );

BitCell BC_1(
 .sel(i_m_sel),
 .inp(i_m_input[1]),
 .wr(i_m_RW),
 .outp(o_m_output[1])
  );

BitCell BC_2(
 .sel(i_m_sel),
 .inp(i_m_input[2]),
 .wr(i_m_RW),
 .outp(o_m_output[2])
  );

BitCell BC_3(
 .sel(i_m_sel),
 .inp(i_m_input[3]),
 .wr(i_m_RW),
 .outp(o_m_output[3])
  );

BitCell BC_4(
 .sel(i_m_sel),
 .inp(i_m_input[4]),
 .wr(i_m_RW),
 .outp(o_m_output[4])
  );

BitCell BC_5(
 .sel(i_m_sel),
 .inp(i_m_input[5]),
 .wr(i_m_RW),
 .outp(o_m_output[5])
  );

BitCell BC_6(
 .sel(i_m_sel),
 .inp(i_m_input[6]),
 .wr(i_m_RW),
 .outp(o_m_output[6])
  );

BitCell BC_7(
 .sel(i_m_sel),
 .inp(i_m_input[7]),
 .wr(i_m_RW),
 .outp(o_m_output[7])
  );

  endmodule
